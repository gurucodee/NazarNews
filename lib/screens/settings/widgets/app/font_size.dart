import 'package:NazarNewsTV/localization/local_languages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AppSettingsFontSize extends StatefulWidget {
  @override
  _AppSettingsFontSizeState createState() => _AppSettingsFontSizeState();
}

class _AppSettingsFontSizeState extends State<AppSettingsFontSize> {
  double _value = 20.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text(getTranslated(context, 'Размер шрифта')),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              getTranslated(context, 'Размер заголовка статьи будет таким же, каким вы его видите в этой строке.'),
              style: Theme.of(context).textTheme.headline1.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: _value
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              getTranslated(context, 'Размер текста статьи будет таким же, каким вы его видите в этой строке.'),
              style: TextStyle(
                fontSize: _value,
              ),
            ),
            Container(
              child: Slider(
                value: _value,
                activeColor: Theme.of(context).primaryColor,
                inactiveColor: Theme.of(context).primaryColorLight,
                onChanged: (double s) {
                  setState(() {
                    _value = s;
                  });
                },
                divisions: 10,
                label: _value.toString(),
                min: 15.0,
                max: 30.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
