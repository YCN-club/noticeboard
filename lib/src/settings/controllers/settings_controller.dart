import 'package:flutter/material.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:noticeboard/src/settings/models/settings_model.dart';

part 'settings_controller.g.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(1, 222, 87, 29),
      brightness: Brightness.light),
  useMaterial3: true,
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Color.fromARGB(1, 255, 114, 53),
    brightness: Brightness.dark,
  ),
  useMaterial3: true,
);

@riverpod
class Settings extends _$Settings {
  @override
  SettingsModel build() {
    return init();
  }

  static SettingsModel init() {
    const defaultValue = SettingsModel(themeMode: ThemeMode.system);

    // TODO: implement getting saved theme from KV
    return defaultValue;
  }

  void updateThemeMode(ThemeMode? newThemeMode) async {
    if (newThemeMode == state.themeMode || newThemeMode == null) return;

    state = state.copyWith(themeMode: newThemeMode);
    // TODO: save new state of theme in KV
  }
}
