import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  var notificationsEnabled = false;
  void toggleNotification(bool value) {
    setState(() {
      notificationsEnabled
          ? notificationsEnabled = false
          : notificationsEnabled = true;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Text(
                    "Push Notifications",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
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
              Column(
                children: const [
                  Text(
                    "Brought to you by CodeX MIT-BLR",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Image(
                    image: AssetImage("images/cxlogo.png"),
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
