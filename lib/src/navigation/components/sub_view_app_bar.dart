import 'dart:ui';

import 'package:flutter/material.dart';

class SubViewAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: AppBar(
            backgroundColor: colorScheme.background.withOpacity(0.6),
            title: Image.asset(
              colorScheme.brightness == Brightness.dark
                  ? 'assets/noticeboard/logo-square-dark.png'
                  : 'assets/noticeboard/logo-square-light.png',
              width: 42,
            ),
            centerTitle: true,
            elevation: 0.0,
            scrolledUnderElevation: 0.0,
          ),
        ),
      ),
    );
  }
}
