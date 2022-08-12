import 'package:exer_log_revamp/res/dimen.dart';
import 'package:flutter/material.dart';

class CircularProgress extends StatelessWidget {
  const CircularProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
        width: iconSizeStd,
        height: iconSizeStd,
        child: CircularProgressIndicator());
  }
}
