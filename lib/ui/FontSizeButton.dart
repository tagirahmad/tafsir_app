import 'package:flutter/material.dart';
import 'package:tafsir_albaqara/ui/FontSizePickerDialog.dart';

// class FontSizeButton extends StatefulWidget {
//   FontSizeButton({this.updateState});
//   final Function updateState;
//   @override
//   _FontSizeButtonState createState() => _FontSizeButtonState();
// }

class FontSizeButton extends StatelessWidget {
  // double _fontSize = 15.0;

  // void _showFontSizePickerDialog(context) async {
  //   final selectedFontSize = await showDialog<double>(
  //     context: context,
  //     builder: (context) => FontSizePickerDialog(
  //       // initialFontSize: _fontSize,
  //       // updateTextFunction: widget.updateState,
  //     ),
  //   );
    // if (selectedFontSize != null) {
    //   setState(() {
    //     _fontSize = selectedFontSize;
    //   });
    // }
  // }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      // onPressed: () => _showFontSizePickerDialog(context),
      onPressed: () => showDialog<double>(
      context: context,
      builder: (context) => FontSizePickerDialog(
        // initialFontSize: _fontSize,
        // updateTextFunction: widget.updateState,
      ),
    ),
      icon: const Icon(Icons.text_fields),
      tooltip: "Изменить размер шрифта",
    );
  }
}
