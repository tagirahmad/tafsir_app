import 'package:flutter/material.dart';
import 'package:tafsir_albaqara/screens/ListOfContent.dart';
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
          // side: BorderSide(color: Colors.red)
        ),
        // elevation: 3.0,
        padding: const EdgeInsets.all(0.0),
        // animationDuration: Duration(seconds: 2),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ListOfContent()));
        },
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              colors: <Color>[
                Colors.indigoAccent,
                Color(0xFF7630ff),
              ],
            ),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.5,
            height: 30,
            // padding: const EdgeInsets.all(10.0),
            alignment: Alignment.center,
            child: Text(GlobalConstants.toListOfContents,
                style: TextStyle(color: Colors.white, fontSize: toChapters)),
          ),
        ),
      ),
    );
  }
}
