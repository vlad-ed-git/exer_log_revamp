import 'package:exer_log_revamp/res/app_theme.dart';
import 'package:flutter/material.dart';

var primaryGradient = LinearGradient(colors: [
  appTheme.colorScheme.primary.withOpacity(0.4),
  appTheme.colorScheme.primary.withOpacity(0.6),
  appTheme.colorScheme.primary.withOpacity(0.8),
  appTheme.colorScheme.primary,
], begin: Alignment.topLeft, end: Alignment.bottomRight);
