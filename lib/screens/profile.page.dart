import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordEditing = false;

  @override
  Widget build(BuildContext context) {
    final user = _auth.currentUser;
    final email = user?.email ?? 'guest@example.com';
    String username = email.split('@')[0];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF1E88E5), Color(0xFF0D47A1)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE3F2FD), Color(0xFFBBDEFB)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Avatar
                  CircleAvatar(
                    backgroundImage: AssetImage("images/avatar.png"),
                    radius: 50,
                    backgroundColor: Colors.grey.shade200,
                  ),
                  SizedBox(height: 20),

                  // Email
                  Text(
                    "Email: $email",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),

                  // Username
                  Text(
                    "Username: $username",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),

                  // Password Update Section
                  if (!_isPasswordEditing)
                    ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          _isPasswordEditing = true;
                        });
                      },
                      icon: Icon(Icons.lock, color: Colors.white),
                      label: Text(
                        "Change Password",
                        style: GoogleFonts.poppins(fontSize: 16),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF1E88E5),
                          minimumSize: Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          foregroundColor: Colors.white),
                    ),
                  if (_isPasswordEditing)
                    Column(
                      children: [
                        TextField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "New Password",
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF1E88E5)),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () async {
                            final newPassword = _passwordController.text;
                            if (newPassword.isNotEmpty) {
                              try {
                                await user?.updatePassword(newPassword);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      "Password updated successfully",
                                      style: GoogleFonts.poppins(),
                                    ),
                                    backgroundColor: Colors.green,
                                  ),
                                );
                                setState(() {
                                  _isPasswordEditing = false;
                                  _passwordController.clear();
                                });
                              } catch (e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      "Error updating password: $e",
                                      style: GoogleFonts.poppins(),
                                    ),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              }
                            }
                          },
                          child: Text(
                            "Update Password",
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF1E88E5),
                            minimumSize: Size(double.infinity, 50),
                          ),
                        ),
                        SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _isPasswordEditing = false;
                              _passwordController.clear();
                            });
                          },
                          child: Text(
                            "Cancel",
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            minimumSize: Size(double.infinity, 50),
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
