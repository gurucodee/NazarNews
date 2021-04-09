import 'package:NazarNewsTV/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:NazarNewsTV/models/languages.dart';
import 'package:NazarNewsTV/localization/local_languages.dart';

class AppSettingsLanguages extends StatefulWidget {
  @override
  _AppSettingsLanguagesState createState() => _AppSettingsLanguagesState();
}

class _AppSettingsLanguagesState extends State<AppSettingsLanguages> {

  // Default Radio Button Item
  String language = 'ky';

  // Group Value for Radio Button.
  int id = 1;

  void _changeAppLanguage(AppLanguage language) async {
    Locale _locale = await setLocale(language.languageCode);
    App.setLocale(context, _locale);
  }

  setSelectedLanguage(String val) {
    setState(() {
      language = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text(getTranslated(context, 'Язык')),
      ),
      body: Container(
        child: Column(
          children:
            AppLanguage.languageList().map((item) => RadioListTile(
              title: Text(
                item.name,
                style: TextStyle(fontSize: 20.0),
              ),
              value: item.id,
              groupValue: id,
              activeColor: Theme.of(context).primaryColor,
              onChanged: (val) {
                setState(() {
                  id = item.id;
                });
                _changeAppLanguage(item);
                // Navigator.pop(context);
              },
              subtitle: Text(
                item.languageDescription,
                style: TextStyle(
                  fontWeight: FontWeight.w300
                ),
              ),
              dense: true,
              secondary: Text(item.flag),
            )).toList(),
        ),
      ),
    );
  }
}
