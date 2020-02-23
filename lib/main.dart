import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:tafsir_albaqara/ui/DynamicThemeIconButton.dart';
import 'package:tafsir_albaqara/ui/GradientButton.dart';
import 'package:tafsir_albaqara/ui/SettingsIconButton.dart';
import 'screens/ListOfContent.dart';
import 'screens/Settings.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
          return new MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: theme,
            title: 'Тафсир суры аль-Бакара',
            home: new MyHomePage(title: 'Тафсир суры аль-Бакара'),
          );
        });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double fontSize = 16;
  // Future<void> getFontSizeFromStore() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   double size = (prefs.getDouble('fontSizeStore') ?? 15);
  //   setState(() {
  //     fontSize = size;
  //   });
  // }
  
  // @override
  // initState() {
  // TODO: implement initState
  // super.initState();
  // getFontSizeFromStore();
  // }
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
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Flexible(
                child: Text(
              " تفسير سورة البقرة ",
              style: new TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()..shader = linearGradient),
            )
                //  Text(
                //   " تفسير سورة البقرة ",
                //   style: TextStyle(fontSize: 35, color: Colors.indigo),
                // ),
                ),
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
          ],
        ),
      ),
    );
  }
}
