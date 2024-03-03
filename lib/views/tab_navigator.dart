import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:noticeboard/views/home_screen.dart';

class TabNavigator extends StatefulWidget {
  const TabNavigator({super.key});

  @override
  State<TabNavigator> createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    Text('Notices'),
    Text('Profile Section')
  ];

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 65.0),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: AppBar(
              title: Image.asset(
                isDarkMode ? 'assets/logo-dark.png' : 'assets/logo-light.png',
                width: 160,
              ),
              forceMaterialTransparency: true,
              elevation: 0.0,
            ),
          ),
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
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
