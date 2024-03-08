import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:google_nav_bar/google_nav_bar.dart';

class NavigationView extends StatefulWidget {
  const NavigationView({super.key});

  @override
  State<NavigationView> createState() => _NavigationViewState();
}

class _NavigationViewState extends State<NavigationView> {
  final List<Widget> _views = <Widget>[
    const Center(
      child: Text('Events View'),
    ),
    const Center(
      child: Text('Notices View'),
    ),
    const Center(
      child: Text('Profile View'),
    ),
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: AppBar(
                backgroundColor: colorScheme.background.withOpacity(0.6),
                title: Image.asset(
                  colorScheme.brightness == Brightness.dark
                      ? 'assets/noticeboard/logo-dark.png'
                      : 'assets/noticeboard/logo-light.png',
                  width: 160,
                ),
                centerTitle: true,
                actions: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.tune,
                        weight: 200,
                        color: colorScheme.onBackground,
                      ))
                ],
                elevation: 0.0,
                scrolledUnderElevation: 0.0,
              ),
            ),
          ),
        ),
        preferredSize: const Size(double.infinity, 65.0),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _views,
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        color: colorScheme.background.withOpacity(0.5),
        child: GNav(
          color: colorScheme.onBackground,
          backgroundColor: colorScheme.background.withOpacity(0.5),
          activeColor: colorScheme.primary,
          tabBackgroundColor: colorScheme.background.withOpacity(0.6),
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
