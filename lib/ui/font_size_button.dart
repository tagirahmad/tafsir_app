// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:tafsir_albaqara/statics/global_constants.dart';
import 'package:tafsir_albaqara/ui/font_size_picker_dialog.dart';

class FontSizeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => showDialog<double>(
        context: context,
        builder: (BuildContext context) => FontSizePickerDialog(),
      ),
      icon: const Icon(Icons.text_fields),
      tooltip: GlobalConstants.changeFs,
    );
  }
}
