import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:noticeboard/src/navigation/views/navigation_view.dart';

class SubmitButton extends StatefulWidget {
  const SubmitButton({
    super.key,
  });

  @override
  State<SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: _loading
          ? null
          : () {
              setState(() {
                _loading = !_loading;
              });

              Future.delayed(Duration(seconds: 3)).then(
                (value) => {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => NavigationView(),
                    ),
                  ),
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Welcome Back, Abhigyan Tripathi!'),
                    ),
                  ),
                },
              );
            },
      icon: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: const Icon(FontAwesomeIcons.microsoft),
      ),
      label: _loading
          ? const Text(
              'Loading...',
              style: TextStyle(fontSize: 16),
            )
          : const Text(
              'Login with Outlook',
              style: TextStyle(fontSize: 16),
            ),
    );
  }
}
