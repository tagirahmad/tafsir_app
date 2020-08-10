import 'package:flutter/material.dart';
import 'package:tafsir_albaqara/screens/settings.dart';
import 'package:tafsir_albaqara/statics/global_constants.dart';

class SettingsIconButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute<void>(
                builder: (BuildContext context) => Settings()));
      },
      icon: const Icon(Icons.settings),
      tooltip: GlobalConstants.settings,
    );
  }
}
