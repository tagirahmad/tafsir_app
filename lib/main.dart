// Flutter imports:
// Package imports:
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts_arabic/fonts.dart';

// Project imports:
import 'package:tafsir_albaqara/bloc/bookmark_bloc/bookmark_bloc.dart';
import 'package:tafsir_albaqara/bloc/content_bloc/content_bloc.dart';
import 'package:tafsir_albaqara/bloc/font_bloc/font_size_bloc.dart';
import 'package:tafsir_albaqara/components/appbar_actions.dart';
import 'package:tafsir_albaqara/components/gradient_button.dart';
import 'package:tafsir_albaqara/configs/size_config.dart';
import 'package:tafsir_albaqara/models/button_type.dart';
import 'package:tafsir_albaqara/models/chapter.dart';
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
  final FontSizeBloc _fontSizeBloc = FontSizeBloc(const FontSizeInitial());
  final ContentBloc _contentBloc =
      ContentBloc(const ContentLoadInProgress(null));
  final BookmarkBloc _bookmarkBloc = BookmarkBloc(const BookmarkInitial());

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
                      _fontSizeBloc..add(AppStarted())),
              BlocProvider<ContentBloc>(
                create: (BuildContext context) =>
                    _contentBloc..add(AppLaunched()),
              ),
              BlocProvider<BookmarkBloc>(
                  create: (BuildContext context) =>
                      _bookmarkBloc..add(AppStarts()))
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
                            foreground: Paint()..shader = arabicLinearGradient),
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
                    const GradientButton(
                      buttonType: ButtonType.toContentList,
                      chapter:
                          Chapter(text: null, title: null, chapterName: null),
                    )
                  ],
                ),
              ),
              BlocBuilder<BookmarkBloc, BookmarkState>(
                builder: (BuildContext context, BookmarkState state) {
                  if (state is BookmarkInitial || state is BookmarkNoContent) {
                    return Container(
                      width: 0,
                      height: 0,
                    );
                  } else if (state is BookmarkLoadSuccess) {
                    return Flexible(
                        child: GradientButton(
                            buttonType: ButtonType.continueReading,
                            chapter: state.chapter));
                  } else if (state is BookmarkLoadInProgress) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
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
