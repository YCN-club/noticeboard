import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:noticeboard/src/app.dart';

void main(List<String> args) async {
  runApp(const ProviderScope(child: MainApp()));
}
