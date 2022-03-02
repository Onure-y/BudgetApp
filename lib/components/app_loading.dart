import 'package:budget_app/constant.dart';
import 'package:flutter/material.dart';

class AppLoadingComp extends StatelessWidget {
  const AppLoadingComp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: secondaryLightColor,
        strokeWidth: 3,
      ),
    );
  }
}
