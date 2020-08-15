import 'package:flutter/material.dart';
import 'package:tafsir_albaqara/components/dynamic_theme_icon_button.dart';
import 'package:tafsir_albaqara/components/font_size_button.dart';
import 'package:tafsir_albaqara/components/settings_icon_button.dart';

enum AppBarPlace { startPage, listOfContent, chapterScreen }

List<Widget> appBarActions(AppBarPlace appBarPlace) {
  switch (appBarPlace) {
    case AppBarPlace.startPage:
    case AppBarPlace.listOfContent:
      return <Widget>[DynamicThemeIconButton(), SettingsIconButton()];
      break;
    case AppBarPlace.chapterScreen:
      return <Widget>[DynamicThemeIconButton(), FontSizeButton()];
      break;
    default:
      return null;
  }
}
