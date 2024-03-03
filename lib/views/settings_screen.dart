import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var notificationsEnabled = false;
  var darkModeEnabled = false;

  void toggleNotification(bool value) {
    setState(() {
      notificationsEnabled
          ? notificationsEnabled = false
          : notificationsEnabled = true;
    });
  }

  void toggleDarkMode(bool value) {
    setState(() {
      darkModeEnabled ? darkModeEnabled = false : darkModeEnabled = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.black),
        ),
        leading: const BackButton(
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Text(
                        'Push Notifications',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                      Switch(
                        activeTrackColor: Colors.orange,
                        activeColor: Colors.orange,
                        inactiveTrackColor: Colors.grey,
                        value: notificationsEnabled,
                        onChanged: toggleNotification,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Text(
                        'Dark Mode',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                      Switch(
                        activeTrackColor: Colors.orange,
                        activeColor: Colors.orange,
                        inactiveTrackColor: Colors.grey,
                        value: darkModeEnabled,
                        onChanged: toggleDarkMode,
                      )
                    ],
                  ),
                ],
              ),
              const Column(
                children: [
                  Text(
                    'Brought to you by mitblr.club',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Image(
                    image: AssetImage('assets/cxlogo.png'),
                    width: 200,
                    height: 100,
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}
