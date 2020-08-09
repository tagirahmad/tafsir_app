import 'package:flutter/material.dart';
import 'package:tafsir_albaqara/ui/FontSizePickerDialog.dart';

class FontSizeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => showDialog<double>(
        context: context,
        builder: (BuildContext context) => FontSizePickerDialog(),
      ),
      icon: const Icon(Icons.text_fields),
      tooltip: 'Изменить размер шрифта',
    );
  }
}
