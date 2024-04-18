import 'package:flutter/material.dart';

import 'package:noticeboard/src/profile/components/profile_menu_widget.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(18.0),
            child: Column(
              children: [
                /// -- IMAGE
                SizedBox(
                  width: 120,
                  height: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: const Image(
                      image: AssetImage('assets/launcher-icon.png'),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text('Abhigyan Tripathi',
                    style:
                        TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text('CSE Cybersecurity (B), 2026',
                    style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(height: 20),

                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        side: BorderSide.none, shape: const StadiumBorder()),
                    child: const Text('Edit Profile'),
                  ),
                ),
                const SizedBox(height: 20),

                /// -- MENU
                ProfileMenuWidget(
                  title: 'Settings',
                  icon: Icons.settings,
                  onPressed: () {},
                ),
                ProfileMenuWidget(
                  title: 'Academic Details',
                  icon: Icons.school,
                  onPressed: () {},
                ),
                ProfileMenuWidget(
                  title: 'User Management',
                  icon: Icons.manage_accounts,
                  onPressed: () {},
                ),
                const SizedBox(height: 10),
                const Divider(),
                const SizedBox(height: 10),
                ProfileMenuWidget(
                  title: 'Information',
                  icon: Icons.info,
                  onPressed: () {},
                ),
                ProfileMenuWidget(
                  title: 'Logout',
                  icon: Icons.logout,
                  textColor: Colors.red,
                  endIcon: false,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
