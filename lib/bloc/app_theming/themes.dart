import 'package:NazarNewsTV/styles.dart';
import 'package:flutter/material.dart';

enum AppTheme {
  GreenTheme,
  BlueTheme,
  IndiagoTheme,
  OrangeTheme,
  RedTheme,
  BrownTheme
}

final appThemeData = {
  AppTheme.BrownTheme: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.brown,
    fontFamily: 'Open Sans',
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primarySwatch: Colors.indigo,
    splashColor: Colors.transparent, // remove ripple splash colors
    highlightColor: Colors.transparent, // remove ripple splash colors
    appBarTheme: AppBarTheme(
      toolbarTextStyle: TextTheme(
        headline1: AppBarTextStyle,
        headline6: AppBarTextStyle,
      ).bodyText2, titleTextStyle: TextTheme(
        headline1: AppBarTextStyle,
        headline6: AppBarTextStyle,
      ).headline6,
    ),
    textTheme: TextTheme(
      headline1: TitleTextStyle,
      bodyText1: Body1TextStyle,
      subtitle1: SubTitleTextStyle,
      caption: CaptionTextStyle,
    ),
  ),
  AppTheme.BlueTheme: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    fontFamily: 'Open Sans',
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primarySwatch: Colors.indigo,
    splashColor: Colors.transparent, // remove ripple splash colors
    highlightColor: Colors.transparent, // remove ripple splash colors
    appBarTheme: AppBarTheme(
      toolbarTextStyle: TextTheme(
        headline1: AppBarTextStyle,
        headline6: AppBarTextStyle,
      ).bodyText2, titleTextStyle: TextTheme(
        headline1: AppBarTextStyle,
        headline6: AppBarTextStyle,
      ).headline6,
    ),
    textTheme: TextTheme(
      headline1: TitleTextStyle,
      bodyText1: Body1TextStyle,
      subtitle1: SubTitleTextStyle,
      caption: CaptionTextStyle,
    ),
  ),
  AppTheme.GreenTheme: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.green,
    fontFamily: 'Open Sans',
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primarySwatch: Colors.indigo,
    splashColor: Colors.transparent, // remove ripple splash colors
    highlightColor: Colors.transparent, // remove ripple splash colors
    appBarTheme: AppBarTheme(
      toolbarTextStyle: TextTheme(
        headline1: AppBarTextStyle,
        headline6: AppBarTextStyle,
      ).bodyText2, titleTextStyle: TextTheme(
        headline1: AppBarTextStyle,
        headline6: AppBarTextStyle,
      ).headline6,
    ),
    textTheme: TextTheme(
      headline1: TitleTextStyle,
      bodyText1: Body1TextStyle,
      subtitle1: SubTitleTextStyle,
      caption: CaptionTextStyle,
    ),
  ),
  AppTheme.IndiagoTheme: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.indigo,
    fontFamily: 'Open Sans',
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primarySwatch: Colors.indigo,
    splashColor: Colors.transparent, // remove ripple splash colors
    highlightColor: Colors.transparent, // remove ripple splash colors
    appBarTheme: AppBarTheme(
      toolbarTextStyle: TextTheme(
        headline1: AppBarTextStyle,
        headline6: AppBarTextStyle,
      ).bodyText2, titleTextStyle: TextTheme(
        headline1: AppBarTextStyle,
        headline6: AppBarTextStyle,
      ).headline6,
    ),
    textTheme: TextTheme(
      headline1: TitleTextStyle,
      bodyText1: Body1TextStyle,
      subtitle1: SubTitleTextStyle,
      caption: CaptionTextStyle,
    ),
  ),
  AppTheme.OrangeTheme: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.deepPurple,
    fontFamily: 'Open Sans',
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primarySwatch: Colors.indigo,
    splashColor: Colors.transparent, // remove ripple splash colors
    highlightColor: Colors.transparent, // remove ripple splash colors
    appBarTheme: AppBarTheme(
      toolbarTextStyle: TextTheme(
        headline1: AppBarTextStyle,
        headline6: AppBarTextStyle,
      ).bodyText2, titleTextStyle: TextTheme(
        headline1: AppBarTextStyle,
        headline6: AppBarTextStyle,
      ).headline6,
    ),
    textTheme: TextTheme(
      headline1: TitleTextStyle,
      bodyText1: Body1TextStyle,
      subtitle1: SubTitleTextStyle,
      caption: CaptionTextStyle,
    ),
  ),
  AppTheme.RedTheme: ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.redAccent,
    fontFamily: 'Open Sans',
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primarySwatch: Colors.indigo,
    splashColor: Colors.transparent, // remove ripple splash colors
    highlightColor: Colors.transparent, // remove ripple splash colors
    appBarTheme: AppBarTheme(
      toolbarTextStyle: TextTheme(
        headline1: AppBarTextStyle,
        headline6: AppBarTextStyle,
      ).bodyText2, titleTextStyle: TextTheme(
        headline1: AppBarTextStyle,
        headline6: AppBarTextStyle,
      ).headline6,
    ),
    textTheme: TextTheme(
      headline1: TitleTextStyle,
      bodyText1: Body1TextStyle,
      subtitle1: SubTitleTextStyle,
      caption: CaptionTextStyle,
    ),
  ),
};
