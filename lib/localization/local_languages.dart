import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:NazarNewsTV/localization/app_localization.dart';

const String LAGUAGE_CODE = 'languageCode';

//languages code
const String RUSSIAN = 'ru';
const String KYRGYZ = 'ky';
const String ARABIC = 'ar';

Future<Locale> setLocale(String languageCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(LAGUAGE_CODE, languageCode);
  return _locale(languageCode);
}

Future<Locale> getLocale() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String languageCode = _prefs.getString(LAGUAGE_CODE) ?? "ru";
  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  switch (languageCode) {
    case RUSSIAN:
      return Locale(RUSSIAN, 'Русский');
    case KYRGYZ:
      return Locale(KYRGYZ, "Кыргызча");
    case ARABIC:
      return Locale(ARABIC, "العربية");
    default:
      return Locale(RUSSIAN, 'Русский');
  }
}

String getTranslated(BuildContext context, String key) {
  return AppLocalization.of(context)!.translate(key);
}