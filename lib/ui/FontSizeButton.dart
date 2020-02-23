import 'package:flutter/material.dart';
import 'package:tafsir_albaqara/ui/FontSizePickerDialog.dart';

class FontSizeButton extends StatefulWidget {
  FontSizeButton({this.updateState});
  final Function updateState;
  @override
  _FontSizeButtonState createState() => _FontSizeButtonState();
}

class _FontSizeButtonState extends State<FontSizeButton> {
  double _fontSize = 15.0;

  void _showFontSizePickerDialog() async {
    final selectedFontSize = await showDialog<double>(
      context: context,
      builder: (context) => FontSizePickerDialog(
        initialFontSize: _fontSize,
        updateTextFunction: widget.updateState,
      ),
    );
    if (selectedFontSize != null) {
      setState(() {
        _fontSize = selectedFontSize;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: _showFontSizePickerDialog,
      icon: const Icon(Icons.text_fields),
      tooltip: "Изменить размер шрифта",
    );
  }
}
