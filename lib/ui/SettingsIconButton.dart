import 'package:flutter/material.dart';
import 'package:tafsir_albaqara/screens/Settings.dart';

class SettingsIconButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Settings()));
      },
      icon: const Icon(Icons.settings),
      tooltip: "Настройки",
    );
  }
}
