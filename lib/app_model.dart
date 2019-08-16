import 'package:flutter/material.dart';
import 'util/colors.dart';

enum Themes { light, dark, black }

class AppModel {
   static final String font =
      DateTime.now().month == 4 && DateTime.now().day == 1
          ? 'ComicSans'
          : 'ProductSans';

  static final List<ThemeData> _themes = [
    ThemeData(
      brightness: Brightness.light,
      fontFamily: font,
      primaryColor: lightPrimaryColor,
      accentColor: lightAccentColor,
    ),
    ThemeData(
      brightness: Brightness.dark,
      fontFamily: font,
      primaryColor: darkPrimaryColor,
      accentColor: darkAccentColor,
      canvasColor: darkCanvasColor,
      scaffoldBackgroundColor: darkBackgroundColor,
      cardColor: darkCardColor,
      dividerColor: darkDividerColor,
      dialogBackgroundColor: darkCardColor,
    ),
    ThemeData(
      brightness: Brightness.dark,
      fontFamily: font,
      primaryColor: blackPrimaryColor,
      accentColor: blackAccentColor,
      canvasColor: blackBackgroundColor,
      scaffoldBackgroundColor: blackBackgroundColor,
      cardColor: blackCardColor,
      dividerColor: blackDividerColor,
      dialogBackgroundColor: darkCardColor,
    )
  ];

  ThemeData _themeData = _themes[1];
  get themeData => _themeData;
  set themeData(Themes theme) {
    _themeData = _themes[theme.index];
  }

}