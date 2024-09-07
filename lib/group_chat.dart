import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

class GroupChatPage extends StatefulWidget {
  final String groupId;
  final String groupName;

  GroupChatPage({required this.groupId, required this.groupName});

  @override
  State<GroupChatPage> createState() => _GroupChatPageState();
}

class _GroupChatPageState extends State<GroupChatPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _database = FirebaseDatabase.instance.ref();
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  String _message = '';
  String? _groupImageUrl;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });
    _fetchGroupImage();
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    }
  }

  Future<void> _fetchGroupImage() async {
    try {
      final snapshot = await _database.child('groups').child(widget.groupId).child('image').get();
      if (snapshot.exists) {
        setState(() {
          _groupImageUrl = snapshot.value as String?;
        });
      }
    } catch (e) {
      print("Failed to fetch group image: $e");
    }
  }

  Future<void> _uploadImage(File image) async {
    try {
      final fileName = DateTime.now().millisecondsSinceEpoch.toString();
      final ref = _storage.ref().child('chat_images').child(fileName);
      final uploadTask = ref.putFile(image);
      final snapshot = await uploadTask.whenComplete(() => {});
      final imageUrl = await snapshot.ref.getDownloadURL();

      _database.child('groups').child(widget.groupId).child('messages').push().set({
        'fileType': 'image',
        'fileUrl': imageUrl,
        'timestamp': DateTime.now().toIso8601String(),
        'sender': _auth.currentUser?.email,
      });
    } catch (e) {
      print("Failed to upload image: $e");
    }
  }

  Future<void> _uploadFile(File file) async {
    try {
      final fileName = DateTime.now().millisecondsSinceEpoch.toString();
      final ref = _storage.ref().child('chat_files').child(fileName);
      final uploadTask = ref.putFile(file);
      final snapshot = await uploadTask.whenComplete(() => {});
      final fileUrl = await snapshot.ref.getDownloadURL();

      _database.child('groups').child(widget.groupId).child('messages').push().set({
        'fileType': 'file',
        'fileUrl': fileUrl,
        'timestamp': DateTime.now().toIso8601String(),
        'sender': _auth.currentUser?.email,
      });
    } catch (e) {
      print("Failed to upload file: $e");
    }
  }

  Future<void> _pickAndSendFile(ImageSource source) async {
    final picker = ImagePicker();
    if (source == ImageSource.camera || source == ImageSource.gallery) {
      final pickedFile = await picker.pickImage(source: source);

      if (pickedFile != null) {
        final imageFile = File(pickedFile.path);
        await _uploadImage(imageFile);
      }
    } else {
      final result = await FilePicker.platform.pickFiles();

      if (result != null) {
        final file = File(result.files.single.path!);
        await _uploadFile(file);
      }
    }
  }

  void _showAttachmentDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.camera_alt, color: Colors.white),
                title: Text('Camera', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickAndSendFile(ImageSource.camera);
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library, color: Colors.white),
                title: Text('Gallery', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickAndSendFile(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: Icon(Icons.file_upload_outlined, color: Colors.white),
                title: Text('File', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickAndSendFile(ImageSource.gallery); // Placeholder to trigger file picker
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _sendMessage() {
    if (_message.trim().isEmpty) return;

    // Get the user's name from the auth instance or from a user profile stored in the database
    String? senderName = _auth.currentUser?.displayName ?? 'Unknown User';

    _database.child('groups').child(widget.groupId).child('messages').push().set({
      'text': _message,
      'timestamp': DateTime.now().toIso8601String(),
      'sender': _auth.currentUser?.email,
      'senderName': senderName,
    });

    _messageController.clear();
    setState(() {
      _message = '';
    });

    _scrollToBottom();
  }


  void _editMessage(String messageId, String currentText) {
    TextEditingController _editController = TextEditingController(text: currentText);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Message'),
          content: TextField(
            controller: _editController,
            decoration: InputDecoration(hintText: 'Edit your message'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _database.child('groups').child(widget.groupId).child('messages').child(messageId).update({
                  'text': _editController.text,
                });
              },
              child: Text('Save'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void _deleteMessage(String messageId, String fileUrl) {
    if (fileUrl.isNotEmpty) {
      _storage.refFromURL(fileUrl).delete().then((_) {
        print('File deleted from storage');
      }).catchError((error) {
        print('Failed to delete file from storage: $error');
      });
    }

    _database.child('groups').child(widget.groupId).child('messages').child(messageId).remove().then((_) {
      print('Message deleted');
    }).catchError((error) {
      print('Failed to delete message: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            if (_groupImageUrl != null)
              CircleAvatar(
                backgroundImage: NetworkImage(_groupImageUrl!),
                radius: 20,
              )
            else
              CircleAvatar(
                child: Icon(Icons.group, color: Colors.white),
                backgroundColor: Colors.grey[800],
                radius: 20,
              ),
            SizedBox(width: 8),
            Text(widget.groupName, style: TextStyle(color: Colors.white)),
          ],
        ),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(Icons.attach_file, color: Colors.white),
            onPressed: _showAttachmentDialog,
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<DatabaseEvent>(
              stream: _database
                  .child('groups')
                  .child(widget.groupId)
                  .child('messages')
                  .orderByChild('timestamp')
                  .onValue,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.snapshot.children.isEmpty) {
                  return Center(child: Text('No messages yet.', style: TextStyle(color: Colors.white)));
                }

                final messages = snapshot.data!.snapshot.children.toList();
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  _scrollToBottom();
                });

                return ListView.builder(
                  controller: _scrollController,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    final messageId = message.key!;
                    final messageData = message.value as Map<dynamic, dynamic>;
                    final isCurrentUser = messageData['sender'] == _auth.currentUser?.email;

                    return Align(
                      alignment: isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
                      child: GestureDetector(
                        onLongPress: () {
                          if (isCurrentUser) {
                            _showMessageOptions(messageId, messageData);
                          }
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: isCurrentUser ? Colors.blue[700] : Colors.grey[800],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (messageData['text'] != null)
                                Text(
                                  messageData['text'] ?? '',
                                  style: TextStyle(color: Colors.white),
                                ),
                              if (messageData['fileType'] == 'image' && messageData['fileUrl'] != null)
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => FullScreenImagePage(imageUrl: messageData['fileUrl']),
                                      ),
                                    );
                                  },
                                  child: Image.network(
                                    messageData['fileUrl'] ?? '',
                                    width: 200,
                                    height: 200,
                                    fit: BoxFit.cover,
                                    loadingBuilder: (context, child, loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Center(
                                        child: CircularProgressIndicator(
                                          value: loadingProgress.expectedTotalBytes != null
                                              ? loadingProgress.cumulativeBytesLoaded /
                                              (loadingProgress.expectedTotalBytes ?? 1)
                                              : null,
                                        ),
                                      );
                                    },
                                    errorBuilder: (context, error, stackTrace) {
                                      return Center(
                                        child: Icon(Icons.error, color: Colors.white),
                                      );
                                    },
                                  ),
                                ),
                              SizedBox(height: 4),
                              Text(
                                _formatTimestamp(messageData['timestamp']),
                                style: TextStyle(color: Colors.white60, fontSize: 10),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    onChanged: (value) {
                      setState(() {
                        _message = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter your message...',
                      hintStyle: TextStyle(color: Colors.white38),
                      fillColor: Colors.grey[900],
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
                SizedBox(width: 8),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.white),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showMessageOptions(String messageId, Map<dynamic, dynamic> messageData) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.edit, color: Colors.white),
              title: Text('Edit', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.of(context).pop();
                _editMessage(messageId, messageData['text'] ?? '');
              },
            ),
            ListTile(
              leading: Icon(Icons.delete, color: Colors.white),
              title: Text('Delete', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.of(context).pop();
                _deleteMessage(messageId, messageData['fileUrl'] ?? '');
              },
            ),
          ],
        );
      },
    );
  }

  String _formatTimestamp(String timestamp) {
    final DateTime dateTime = DateTime.parse(timestamp);
    return '${dateTime.hour}:${dateTime.minute}';
  }
}

class FullScreenImagePage extends StatelessWidget {
  final String imageUrl;

  FullScreenImagePage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(Icons.download, color: Colors.white),
            onPressed: () async {
              // Implement image download logic here
            },
          ),
          IconButton(
            icon: Icon(Icons.close, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: Center(
        child: InteractiveViewer(
          child: Image.network(
            imageUrl,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return Center(child: Icon(Icons.error, color: Colors.white));
            },
          ),
        ),
      ),
    );
  }
}
