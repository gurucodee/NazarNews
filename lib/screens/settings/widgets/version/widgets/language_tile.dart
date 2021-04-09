import 'package:NazarNewsTV/screens/settings/widgets/version/select_languages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LanguageSettingsTile extends StatefulWidget {

  final String lang;
  final String title;

  LanguageSettingsTile({Key key, this.lang, this.title}) : super(key: key);

  @override
  _LanguageSettingsTileState createState() => _LanguageSettingsTileState();
}

class _LanguageSettingsTileState extends State<LanguageSettingsTile> {

  @override
  Widget build(BuildContext context) {

    String _language = widget.lang;

    return ListTile(
      title: Text(
        widget.title,
        style: TextStyle(
          fontSize: 20.0
        ),
      ),
      leading: Radio(
        value: _language,
        groupValue: '',
        onChanged: (String value) {
          setState(() {
            _language = value;
          });
        },
      ),
    );
  }
}