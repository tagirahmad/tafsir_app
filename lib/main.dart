// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts_arabic/fonts.dart';

// Project imports:
import 'package:tafsir_albaqara/bloc/bookmark_bloc/bookmark_bloc.dart';
import 'package:tafsir_albaqara/bloc/content_bloc/content_bloc.dart';
import 'package:tafsir_albaqara/bloc/font_bloc/font_size_bloc.dart';
import 'package:tafsir_albaqara/components/appbar_actions.dart';
import 'package:tafsir_albaqara/components/gradient_button.dart';
import 'package:tafsir_albaqara/configs/size_config.dart';
import 'package:tafsir_albaqara/models/chapter.dart';
import 'package:tafsir_albaqara/screens/chapter_screen.dart';
import 'package:tafsir_albaqara/services/service_locator.dart';
import 'package:tafsir_albaqara/statics/global_constants.dart';
import 'package:tafsir_albaqara/statics/styles.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
        defaultBrightness: Brightness.light,
        data: (Brightness brightness) => ThemeData(
              primarySwatch: Colors.indigo,
              brightness: brightness,
              accentColor: Colors.indigo,
            ),
        themedWidgetBuilder: (BuildContext context, ThemeData theme) {
          return MultiBlocProvider(
            providers: <BlocProvider<dynamic>>[
              BlocProvider<FontSizeBloc>(
                  create: (BuildContext context) =>
                      FontSizeBloc()..add(AppStarted())),
              BlocProvider<ContentBloc>(
                create: (BuildContext context) =>
                    ContentBloc()..add(AppLaunched()),
              ),
              BlocProvider<BookmarkBloc>(
                  create: (BuildContext context) =>
                      BookmarkBloc()..add(AppStarts()))
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: theme,
              title: GlobalConstants.russianTitle,
              home: MyHomePage(),
            ),
          );
        });
  }
}

class MyHomePage extends StatelessWidget {
  final Shader linearGradient = const LinearGradient(
    colors: <Color>[
      Color(0xFF9683ec),
      Colors.indigoAccent,
      Color(0xFF7630ff),
    ],
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          GlobalConstants.russianTitle,
          style: TextStyle(fontSize: appBarTitleFs),
        ),
        actions: appBarActions(AppBarPlace.startPage),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Flexible(
                  flex: 2,
                  child: Align(
                    alignment: Alignment.center,
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        GlobalConstants.arabicTitle,
                        style: TextStyle(
                            fontSize: homeArabicFs,
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
                      GlobalConstants.homeHadis,
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: homeHadisFs,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.left,
                    ),
                    GradientButton()
                  ],
                ),
              ),
              BlocBuilder<BookmarkBloc, BookmarkState>(
                builder: (BuildContext context, BookmarkState state) {
                  if (state is BookmarkInitial) {
                    return Container(
                      width: 0,
                      height: 0,
                    );
                  } else if (state is BookmarkNoContent) {
                    return Container(
                      width: 0,
                      height: 0,
                    );
                  } else if (state is BookmarkLoadSuccess) {
                    return Flexible(
                        child: MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      padding: const EdgeInsets.all(0.0),
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
                          child: Text(
                            'Продолжить чтение с: ${state.chapter.chapterName}',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: continueReadingBtn),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    ChapterScreen(
                                        chapter: Chapter(
                                            text: state.chapter.text,
                                            title: state.chapter.title,
                                            chapterName:
                                                state.chapter.chapterName))));
                      },
                    ));
                  } else {
                    return Container(
                      height: 0,
                      width: 0,
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
