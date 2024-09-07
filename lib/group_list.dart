import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:polaris_chief_mate/group_chat.dart';

class GroupsPage extends StatefulWidget {
  @override
  State<GroupsPage> createState() => _GroupsPageState();
}

class _GroupsPageState extends State<GroupsPage> {
  final _database = FirebaseDatabase.instance.ref();
  final _auth = FirebaseAuth.instance;
  final _groupNameController = TextEditingController();
  User? _currentUser;
  final _picker = ImagePicker();
  File? _image;

  @override
  void initState() {
    super.initState();
    _currentUser = _auth.currentUser;
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<String?> _uploadImage() async {
    if (_image != null) {
      final storageRef = FirebaseStorage.instance.ref();
      final fileName = DateTime.now().millisecondsSinceEpoch.toString();
      final imageRef = storageRef.child('group_images/$fileName');
      try {
        await imageRef.putFile(_image!);
        final downloadUrl = await imageRef.getDownloadURL();
        return downloadUrl;
      } catch (e) {
        print('Error uploading image: $e');
        return null;
      }
    }
    return null;
  }

  Future<void> _createGroup() async {
    final groupName = _groupNameController.text.trim();
    if (groupName.isNotEmpty && _currentUser != null) {
      try {
        final groupRef = _database.child('groups').push();
        final imageUrl = await _uploadImage();
        await groupRef.set({
          'name': groupName,
          'createdBy': _currentUser!.email,
          'timestamp': DateTime.now().toIso8601String(),
          'editors': [_currentUser!.email],
          'image': imageUrl,
        });
        _groupNameController.clear();
        setState(() {
          _image = null;
        });
      } catch (e) {
        print('Error creating group: $e');
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Write the group name'),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  Future<void> _editGroupName(String groupId, String currentName) async {
    final _editController = TextEditingController(text: currentName);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.black,
        title: Text('Edit Group Name', style: TextStyle(color: Colors.white)),
        content: TextField(
          controller: _editController,
          decoration: InputDecoration(
            hintText: 'Enter new group name',
            hintStyle: TextStyle(color: Colors.white38),
            fillColor: Colors.black,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel', style: TextStyle(color: Colors.white)),
          ),
          TextButton(
            onPressed: () async {
              final newName = _editController.text.trim();
              if (newName.isNotEmpty) {
                try {
                  final groupSnapshot = await _database.child('groups').child(groupId).once();
                  final groupData = groupSnapshot.snapshot.value as Map<dynamic, dynamic>;

                  if (groupData['createdBy'] == _currentUser?.email) {
                    await _database.child('groups').child(groupId).update({
                      'name': newName,
                    });
                    Navigator.of(context).pop();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('You are not authorized to edit this group'),
                        backgroundColor: Colors.red,
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  }
                } catch (e) {
                  print('Error updating group name: $e');
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Group name cannot be empty'),
                    backgroundColor: Colors.red,
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              }
            },
            child: Text('Save', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Future<void> _deleteGroup(String groupId) async {
    try {
      final groupSnapshot = await _database.child('groups').child(groupId).once();
      final groupData = groupSnapshot.snapshot.value as Map<dynamic, dynamic>;

      if (groupData['createdBy'] == _currentUser?.email) {
        await _database.child('groups').child(groupId).remove();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('You are not authorized to delete this group'),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } catch (e) {
      print('Error deleting group: $e');
    }
  }

  Future<void> _changeGroupImage(String groupId) async {
    await _pickImage();
    final imageUrl = await _uploadImage();
    if (imageUrl != null) {
      try {
        await _database.child('groups').child(groupId).update({
          'image': imageUrl,
        });
      } catch (e) {
        print('Error updating group image: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chat Groups',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: _groupNameController,
                      decoration: InputDecoration(
                        hintText: 'Create group...',
                        hintStyle: TextStyle(color: Colors.white38),
                        fillColor: Colors.black,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: IconButton(
                    onPressed: () async {
                      await _pickImage();
                      _createGroup();
                    },
                    icon: Icon(Icons.add),
                    color: Colors.white,
                    iconSize: 30,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: StreamBuilder<DatabaseEvent>(
              stream: _database.child('groups').orderByChild('timestamp').onValue,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}', style: TextStyle(color: Colors.white)));
                }
                if (!snapshot.hasData || snapshot.data!.snapshot.children.isEmpty) {
                  return Center(child: Text('No groups yet.', style: TextStyle(color: Colors.white)));
                }
                final groups = snapshot.data!.snapshot.children.toList();
                return ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 7),
                  itemCount: groups.length,
                  itemBuilder: (context, index) {
                    final group = groups[index];
                    final groupData = group.value as Map<dynamic, dynamic>;
                    final isCreator = groupData['createdBy'] == _currentUser?.email;

                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        leading: groupData['image'] != null
                            ? CircleAvatar(
                          backgroundImage: NetworkImage(groupData['image']),
                        )
                            : CircleAvatar(
                          child: Icon(Icons.group, color: Colors.white),
                          backgroundColor: Colors.grey[800],
                        ),
                        title: Text(
                          groupData['name'] ?? 'No Name',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        trailing: isCreator
                            ? PopupMenuButton<String>(
                          onSelected: (value) {
                            if (value == 'edit') {
                              _editGroupName(group.key!, groupData['name']);
                            } else if (value == 'delete') {
                              _deleteGroup(group.key!);
                            } else if (value == 'change_image') {
                              _changeGroupImage(group.key!);
                            }
                          },
                          icon: Icon(Icons.more_vert, color: Colors.white),
                          color: Colors.black,
                          itemBuilder: (context) => [
                            PopupMenuItem(
                              value: 'edit',
                              child: Row(
                                children: [
                                  Icon(Icons.edit, color: Colors.white),
                                  SizedBox(width: 8),
                                  Text('Edit', style: TextStyle(color: Colors.white)),
                                ],
                              ),
                            ),
                            PopupMenuItem(
                              value: 'delete',
                              child: Row(
                                children: [
                                  Icon(Icons.delete, color: Colors.white),
                                  SizedBox(width: 8),
                                  Text('Delete', style: TextStyle(color: Colors.white)),
                                ],
                              ),
                            ),
                            PopupMenuItem(
                              value: 'change_image',
                              child: Row(
                                children: [
                                  Icon(Icons.image, color: Colors.white),
                                  SizedBox(width: 8),
                                  Text('Change Image', style: TextStyle(color: Colors.white)),
                                ],
                              ),
                            ),
                          ],
                        )
                            : null,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GroupChatPage(
                                groupId: group.key!,
                                groupName: groupData['name'] ?? 'No Name',
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
