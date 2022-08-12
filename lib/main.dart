import 'package:exer_log_revamp/main_init.dart';
import 'package:exer_log_revamp/res/app_theme.dart';
import 'package:exer_log_revamp/res/routes.dart';
import 'package:exer_log_revamp/res/strings.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MainInit.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: appTheme,
      routes: appRoutes,
    );
  }
}
