// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:dynamic_theme/dynamic_theme.dart';

// Project imports:
import 'package:tafsir_albaqara/statics/global_constants.dart';

class DynamicThemeIconButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (DynamicTheme.of(context).brightness == Brightness.dark) {
          DynamicTheme.of(context).setBrightness(Brightness.light);
        } else {
          DynamicTheme.of(context).setBrightness(Brightness.dark);
        }
      },
      icon: const Icon(Icons.brightness_2),
      tooltip: GlobalConstants.theme,
    );
  }
}
