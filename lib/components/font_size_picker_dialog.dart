// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:tafsir_albaqara/bloc/font_bloc/font_size_bloc.dart';
import 'package:tafsir_albaqara/statics/global_constants.dart';

class FontSizePickerDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final FontSizeBloc fontSizeBloc = BlocProvider.of<FontSizeBloc>(context);

    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0))),
      title: const Text(GlobalConstants.fontSize),
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
                },
              ));
        },
      ),
      actions: <Widget>[
        FlatButton(
          child: const Text(GlobalConstants.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
