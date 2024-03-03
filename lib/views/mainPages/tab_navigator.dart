import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:noticeboard/views/mainPages/home_screen.dart';

class TabNavigator extends StatefulWidget {
  const TabNavigator({super.key});

  @override
  State<TabNavigator> createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    Text('Notices'),
    Text('Profile Section')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
        color: Colors.black,
        child: GNav(
          color: Colors.white,
          backgroundColor: Colors.black,
          activeColor: Colors.orange,
          tabBackgroundColor: Colors.grey.shade50.withOpacity(0.15),
          gap: 8,
          haptic: true,
          padding: const EdgeInsets.all(16),
          tabs: const [
            GButton(
              icon: Icons.calendar_month_outlined,
              text: 'Events',
            ),
            GButton(
              icon: Icons.notifications,
              text: 'Notices',
            ),
            GButton(
              icon: Icons.person,
              text: 'Me',
            )
          ],
          selectedIndex: _selectedIndex,
          onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}
