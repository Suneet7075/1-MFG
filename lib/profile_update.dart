import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileUpdatePage extends StatefulWidget {
  @override
  _ProfileUpdatePageState createState() => _ProfileUpdatePageState();
}

class _ProfileUpdatePageState extends State<ProfileUpdatePage> {
  bool _isEditing = false;
  File? _profileImage;

  // Placeholder data for user profile
  String _name = 'John Doe';
  String _selectedCompany = 'Maersk Line';
  String _selectedPosition = 'Chief Mate';
  String _selectedExperience = '5-10';

  // Controllers for text fields
  final TextEditingController _nameController = TextEditingController();

  final List<String> _companyOptions = [
    'Anglo-Eastern Group',
    'Bernhard Schulte Shipmanagement (BSM)',
    'CMA CGM Group',
    'Columbia Shipmanagement',
    'COSCO Shipping Lines',
    'Evergreen Marine Corporation',
    'Fleet Management Limited',
    'Hapag-Lloyd',
    'HMM (Hyundai Merchant Marine)',
    'Maersk Line',
    'Mediterranean Shipping Company (MSC)',
    'Ocean Network Express (ONE)',
    'Oman Ship Management Company (OSMC)',
    'Synergy Marine Group',
    'Thome Group',
    'V.Group',
    'Wallem Group',
    'Wilhelmsen Ship Management',
    'Others'
  ];

  final List<String> _positionOptions = ['Third Mate', 'Second Mate', 'Chief Mate', 'Master'];
  final List<String> _experienceOptions = ['0-1', '1-5', '5-10', '10+'];

  @override
  void initState() {
    super.initState();
    // Initialize controllers with current data
    _nameController.text = _name;
  }

  void _toggleEditMode() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }

  void _saveProfile() {
    setState(() {
      _name = _nameController.text;
      _isEditing = false; // Disable editing mode after saving
    });
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.grey[900],
        actions: [
          PopupMenuButton<String>(
            icon: Icon(Icons.more_vert, color: Colors.white),
            onSelected: (value) {
              if (value == 'edit') {
                _toggleEditMode();
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<String>(
                  value: 'edit',
                  child: Text(
                    _isEditing ? 'Cancel' : 'Edit',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ];
            },
            color: Colors.grey[900],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: _profileImage != null
                        ? FileImage(_profileImage!)
                        : AssetImage('assets/default_profile_pic.png')
                    as ImageProvider,
                    backgroundColor: Colors.grey[800],
                  ),
                  if (_isEditing)
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: InkWell(
                        onTap: () {
                          _showImageSourceActionSheet(context);
                        },
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(height: 20),
            _buildTextField('Name', _nameController, !_isEditing),
            SizedBox(height: 15),
            _buildDropdown('Company Name', _selectedCompany, _companyOptions, (String? newValue) {
              setState(() {
                _selectedCompany = newValue!;
              });
            }),
            SizedBox(height: 15),
            _buildDropdown('Current Position', _selectedPosition, _positionOptions, (String? newValue) {
              setState(() {
                _selectedPosition = newValue!;
              });
            }),
            SizedBox(height: 15),
            _buildDropdown('Years of Experience', _selectedExperience, _experienceOptions, (String? newValue) {
              setState(() {
                _selectedExperience = newValue!;
              });
            }),
            SizedBox(height: 30), // Space between the bottom box and Save button
            if (_isEditing)
              Center(
                child: ElevatedButton(
                  onPressed: _saveProfile,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: BorderSide(color: Colors.white, width: 2),
                    ),
                    elevation: 5,
                  ),
                  child: Text('Save', style: TextStyle(fontSize: 16)),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String labelText, TextEditingController controller, bool readOnly) {
    return TextField(
      controller: controller,
      style: TextStyle(color: Colors.white),
      readOnly: readOnly,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.white),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[700]!),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: Colors.grey[850],
      ),
    );
  }

  Widget _buildDropdown(String labelText, String currentValue, List<String> options, ValueChanged<String?> onChanged) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[700]!),
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[850],
      ),
      child: Stack(
        children: [
          Positioned(
            left: 10,
            top: 10,
            child: Text(
              labelText,
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30), // Adjust as needed
            child: DropdownButton<String>(
              value: currentValue,
              dropdownColor: Colors.grey[850],
              icon: Icon(Icons.arrow_drop_down, color: Colors.white),
              isExpanded: true,
              underline: SizedBox(),
              items: options.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, style: TextStyle(color: Colors.white)),
                );
              }).toList(),
              onChanged: _isEditing ? onChanged : null,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }


  void _showImageSourceActionSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.grey[900],
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.photo_library, color: Colors.white),
                title: Text('Gallery', style: TextStyle(color: Colors.white)),
                onTap: () {
                  _pickImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_camera, color: Colors.white),
                title: Text('Camera', style: TextStyle(color: Colors.white)),
                onTap: () {
                  _pickImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
