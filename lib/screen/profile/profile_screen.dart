import 'package:flutter/material.dart';
import 'package:task_manager/core/storage/token_storage.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A1D37),
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text("Profile", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF2ECC71), Color(0xFF0A1D37)],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 20),

              /// Avatar
              const CircleAvatar(
                radius: 55,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Color(0xFF0A1D37),
                  child: Icon(Icons.person, size: 60, color: Colors.white),
                ),
              ),

              const SizedBox(height: 16),

              /// Name
              const Text(
                "John Doe",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 4),

              /// Email
              const Text(
                "john.doe@email.com",
                style: TextStyle(fontSize: 14, color: Colors.white70),
              ),

              const SizedBox(height: 30),

              /// Profile Options
              _profileTile(
                icon: Icons.edit,
                title: "Edit Profile",
                onTap: () {
                  // TODO: navigate to edit profile
                  Navigator.pushNamed(context, '/editProfile');
                },
              ),

              _profileTile(
                icon: Icons.lock,
                title: "Change Password",
                onTap: () {
                  // TODO: navigate to change password
                    Navigator.pushNamed(context, '/changePassword');
                },
              ),

              _profileTile(
                icon: Icons.logout,
                title: "Logout",
                isDestructive: true,
                onTap: () {
                  Navigator.pushNamed(context, '/login');
                  TokenStorage.clear();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Profile Tile Widget
  Widget _profileTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isDestructive = false,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: ListTile(
        onTap: onTap,
        leading: Icon(
          icon,
          color: isDestructive ? Colors.red : const Color(0xFF0A1D37),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: isDestructive ? Colors.red : Colors.black,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}
