import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tafsir_albaqara/bloc/font_size_bloc.dart';
import 'package:tafsir_albaqara/screens/ContentPage.dart';
import 'package:tafsir_albaqara/ui/DynamicThemeIconButton.dart';
import 'package:tafsir_albaqara/ui/GradientButton.dart';
import 'package:tafsir_albaqara/ui/SettingsIconButton.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new DynamicTheme(
        defaultBrightness: Brightness.light,
        data: (brightness) => new ThemeData(
              primarySwatch: Colors.indigo,
              brightness: brightness,
              accentColor: Colors.indigo,
            ),
        themedWidgetBuilder: (context, theme) {
          return BlocProvider<FontSizeBloc>(
            create: (context) => FontSizeBloc()..add(AppStarted()),
            child: new MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: theme,
              title: 'Тафсир суры аль-Бакара',
              home: MyHomePage(title: 'Тафсир суры аль-Бакара'),
            ),
          );
        });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  double lastPos;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double fontSize = 16;
  Future<double> lastPosFut;
  Future<String> lastChapterFut;
  Future<String> textFut;
  Future<String> titleFut;
  double lastPos;
  String lastChapter;
  String text;
  String title;
  Future<List> list;
  SharedPreferences prefs;
  // List<dynamic> list;

  // Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  @override
  void initState() {
    super.initState();
    getLastPos();
  }

  // @override
  // void didUpdateWidget(MyHomePage oldWidget) {
  //   if (oldWidget.lastPos == null) {
  //     getLastPos();
  //   } else {
  //     getLastPos();
  //   }
  //   super.didUpdateWidget(oldWidget);
  // }
  // void getPrefs() async{
  //   prefs = await SharedPreferences.getInstance();
  // }

  void update() {
    setState(() {
      lastPos = (prefs.getDouble('lastPos') ?? 0);
      lastChapter = (prefs.getString("lastChapter"));
      text = (prefs.getString("text"));
      title = (prefs.getString("title"));
    });
  }

  getLastPos() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      lastPos = (prefs.getDouble('lastPos') ?? 0);
      lastChapter = (prefs.getString("lastChapter"));
      text = (prefs.getString("text"));
      title = (prefs.getString("title"));
    });
    // lastPosFut = _prefs.then((SharedPreferences prefs) {
    //   print("last pos from main.dart ${prefs.getDouble("lastPos")}");
    //   return (prefs.getDouble('lastPos') ?? 0);
    // });
    // if (lastPosFut != null) {
    // lastPosFut = _prefs.then((SharedPreferences prefs) {
    //   return (prefs.getDouble('lastPos') ?? 0);
    // }).then((value) => lastPos = value.toDouble());

    // lastChapterFut = _prefs.then((SharedPreferences prefs) {
    //   return (prefs.getString("lastChapter"));
    // }).then((value) => lastChapter = value.toString());

    //   textFut = _prefs.then((SharedPreferences prefs) {
    //     return (prefs.getString("text"));
    //   }).then((value) => text = value.toString());

    //   titleFut = _prefs.then((SharedPreferences prefs) {
    //     return (prefs.getString("title"));
    //   }).then((value) => title = value.toString());

    //   setState(() {
    //     list = [lastPos, lastChapter, text, title] as Future<List>;
    //   });

    // }
  }

  Widget showButton(double lastPos) {
    // if (lastPos != 0) {
    return RaisedButton(
      child: Text("Продолжить чтение с последней позиции"),
      onPressed: () {
        // double lastPos = prefs.getDouble("lastPos");
        // getLastPos();

        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PageContent(
                    // chapter: lastChapter,
                    // text: text,
                    // title: title,
                    // lastPos: lastPos,
                    // updateMainState: update,
                    )));
      },
    );
    // } else {
    //   return SizedBox(child: Text("text"),);
    // }
  }

  final Shader linearGradient = LinearGradient(
    colors: <Color>[
      Color(0xFF9683ec),
      Colors.indigoAccent,
      Color(0xFF7630ff),
    ],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Тафсир Суры аль-Бакара',
        ),
        actions: <Widget>[DynamicThemeIconButton(), SettingsIconButton()],
      ),
      body:
          //  FutureBuilder(
          //   future: list,
          //   builder: (BuildContext context, AsyncSnapshot snapshot) {
          //     return
          Container(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            Flexible(
                child: Text(
              " تفسير سورة البقرة ",
              style: new TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()..shader = linearGradient),
            )),
            Flexible(
              child: Column(
                children: <Widget>[
                  Text(
                    'Сообщается, что ан-Наууас ибн Сам’ан, да будет доволен им Аллах, сказал: “Я слышал, как посланник Аллаха ﷺ сказал: «В День воскрешения приведут Коран и тех, кто в мире этом поступал в соответствии с ним, а впереди него будут идти суры “Корова” и “Семейство Имрана»”. Муслим 805.',
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: fontSize,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.left,
                  ),
                  GradientButton()
                ],
              ),
            ),
            Flexible(child: showButton(lastPos))
          ],
        ),
      ),
      // },
    );
    // );
    // }
  }
}
