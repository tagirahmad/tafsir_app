import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tafsir_albaqara/bloc/font_bloc/font_size_bloc.dart';


class FontSizePickerDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final FontSizeBloc fontSizeBloc = BlocProvider.of<FontSizeBloc>(context);

    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0))),
      title: Text("Размер шрифта"),
      content: BlocBuilder<FontSizeBloc, FontSizeState>(
        builder: (BuildContext context, FontSizeState state) {
          return Container(
              width: 100,
              height: 80,
              child: Slider(
                min: 10.0,
                max: 30.0,
                value: state.fontSize,
                label: state.fontSize.toString(),
                divisions: 8,
                activeColor: Colors.indigo,
                onChanged: (double value) {
                  fontSizeBloc.add(FontSizeChanged(value));
                  print(state.fontSize);
                },
              ));
        },
      ),
      actions: <Widget>[
        FlatButton(
          child: Text("Закрыть"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
