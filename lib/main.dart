import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tafsir_albaqara/bloc/content_bloc/content_bloc.dart';
import 'package:tafsir_albaqara/bloc/font_bloc/font_size_bloc.dart';
import 'package:tafsir_albaqara/bloc/bookmark_bloc/bookmark_bloc.dart';
import 'package:tafsir_albaqara/screens/ContentPage.dart';
import 'package:tafsir_albaqara/ui/DynamicThemeIconButton.dart';
import 'package:tafsir_albaqara/ui/GradientButton.dart';
import 'package:tafsir_albaqara/ui/SettingsIconButton.dart';
import 'package:google_fonts_arabic/fonts.dart';

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
          return MultiBlocProvider(
            providers: [
              BlocProvider<FontSizeBloc>(
                  create: (context) => FontSizeBloc()..add(AppStarted())),
              BlocProvider<ContentBloc>(
                create: (context) => ContentBloc()..add(AppLaunched()),
              ),
              BlocProvider<BookmarkBloc>(
                  create: (context) => BookmarkBloc()..add(AppStarts()))
            ],
            child: new MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: theme,
              title: 'Тафсир суры аль-Бакара',
              home: MyHomePage(),
            ),
          );
        });
  }
}

// ignore: must_be_immutable
class MyHomePage extends StatelessWidget {
  double fontSize = 16;

  final Shader linearGradient = LinearGradient(
    colors: <Color>[
      Color(0xFF9683ec),
      Colors.indigoAccent,
      Color(0xFF7630ff),
    ],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  @override
  Widget build(BuildContext context) {
    final BookmarkBloc bookmarkBloc = BlocProvider.of<BookmarkBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Тафсир Суры аль-Бакара',
        ),
        actions: <Widget>[DynamicThemeIconButton(), SettingsIconButton()],
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: [
              Flexible(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.center,
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        " تفسير سورة البقرة ",
                        style: new TextStyle(
                            fontSize: 50.0,
                            fontFamily: ArabicFonts.Mirza,
                            package: 'google_fonts_arabic',
                            fontWeight: FontWeight.bold,
                            foreground: Paint()..shader = linearGradient),
                      ),
                    ),
                  )),
              Flexible(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
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
              BlocBuilder<BookmarkBloc, BookmarkState>(
                builder: (context, state) {
                  if (state is BookmarkLoadSuccess) {
                    return Flexible(
                        child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 3.0,
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                            colors: <Color>[
                              Colors.indigoAccent,
                              Color(0xFF7630ff),
                            ],
                          ),
                        ),
                        child: Text(
                          "Продолжить чтение с последней позиции (${state.lastChapter})",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PageContent(
                                      chapter: state.lastChapter,
                                      text: state.text,
                                      title: state.title,
                                    )));
                      },
                    ));
                  } else if (state is BookmarkNoContent ||
                      state is BookmarkInitial) {
                    return Container(
                      width: 0,
                      height: 0,
                    );
                  } else if (state is BookmarkSetSuccess) {
                    bookmarkBloc.add(BookmarkSuccess());
                    return Container(
                      child: Text('something went wrong'),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
