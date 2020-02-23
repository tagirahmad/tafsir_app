import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FontSizePickerDialog extends StatefulWidget {
  final double initialFontSize;
  final Function updateTextFunction;
  FontSizePickerDialog({this.initialFontSize, this.updateTextFunction});
  @override
  _FontSizePickerDialogState createState() => _FontSizePickerDialogState();
}

class _FontSizePickerDialogState extends State<FontSizePickerDialog> {
  double _fontSize;
  Future<void> getSizeFromStore() async {
    final prefs = await SharedPreferences.getInstance();
    double size = (prefs.getDouble('fontSize') ?? 15);
    setState(() {
      _fontSize = size;
    });
  }

  @override
  initState() {
    super.initState();
    _fontSize = widget.initialFontSize;
    getSizeFromStore();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0))),
      // shape: CircleBorder(),
      title: Text("Размер шрифта"),
      // contentPadding: EdgeInsets.all(0),
      content: Container(
        width: 100,
        height: 80,
        child: Slider(
          min: 10.0,
          max: 30.0,
          value: _fontSize,
          label: _fontSize.toString(),
          divisions: 8,
          activeColor: Colors.indigo,
          onChanged: (double value) async {
            setState(() => _fontSize = value);
            SharedPreferences prefs = await SharedPreferences.getInstance();
            await prefs.setDouble('fontSizeStore', _fontSize);
            await prefs.setDouble("fontSize", _fontSize);
            widget.updateTextFunction(value);
          },
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text("Закрыть"),
          onPressed: () {
            Navigator.pop(context, _fontSize);
          },
        ),
      ],
    );
  }
}
