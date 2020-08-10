// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:tafsir_albaqara/screens/list_of_content.dart';
import 'package:tafsir_albaqara/statics/global_constants.dart';
import 'package:tafsir_albaqara/statics/styles.dart';

class GradientButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        padding: const EdgeInsets.all(0.0),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute<void>(
                  builder: (BuildContext context) => ListOfContent()));
        },
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: const LinearGradient(
              colors: <Color>[
                Colors.indigoAccent,
                Color(0xFF7630ff),
              ],
            ),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.5,
            height: 30,
            alignment: Alignment.center,
            child: Text(GlobalConstants.toListOfContents,
                style: TextStyle(color: Colors.white, fontSize: toChapters)),
          ),
        ),
      ),
    );
  }
}
