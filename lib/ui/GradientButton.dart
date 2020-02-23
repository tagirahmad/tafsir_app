import 'package:flutter/material.dart';
import 'package:tafsir_albaqara/screens/ListOfContent.dart';

class GradientButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: RaisedButton(
          elevation: 3.0,
          padding: const EdgeInsets.all(0.0),
          animationDuration: Duration(seconds: 2),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ListOfContent()));
          },
          child: Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  Colors.indigoAccent,
                  Color(0xFF7630ff),
                ],
              ),
            ),
            child: Text('К списку глав',
                style: TextStyle(
                  color: Colors.white,
                )),
          ),
        ));
  }
}
