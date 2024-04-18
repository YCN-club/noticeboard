import 'package:flutter/material.dart';

import 'package:noticeboard/src/login/components/submit_button.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 64),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/noticeboard/logo-square-dark.png',
                width: 156,
              ),
              SizedBox(
                height: 12,
                width: double.infinity,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text.rich(
                  TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Please login with your ',
                      ),
                      TextSpan(
                        text: 'Manipal Learner ID',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: ' to access the application.',
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(
                height: 24,
                width: double.infinity,
              ),
              SubmitButton(),
            ],
          ),
        ),
      ),
    );
  }
}
