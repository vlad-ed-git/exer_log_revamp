import 'package:exer_log_revamp/res/text_theme.dart';
import 'package:flutter/material.dart';

var appTheme = ThemeData(
    useMaterial3: true, colorSchemeSeed: Colors.blue, textTheme: appTextTheme);

var darkTheme = appTheme.copyWith(brightness: Brightness.dark);

var lightTheme = appTheme.copyWith(brightness: Brightness.light);
