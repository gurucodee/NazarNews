import 'package:NazarNewsTV/localization/local_languages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:NazarNewsTV/bloc/app_theming/theme_bloc.dart';
import 'package:NazarNewsTV/bloc/app_theming/themes.dart';

class AppSettingsChangeTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text(getTranslated(context, "Поменять тему")),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(30),
        itemCount: AppTheme.values.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          crossAxisCount: 3,
        ),
        itemBuilder: (context, index) {
          final itemAppTheme = AppTheme.values[index];
          // appThemeData[itemAppTheme].textTheme.bodyText1,
          return Stack(children: [
            InkWell(
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(150),
                  color: appThemeData[itemAppTheme].primaryColor,
                  boxShadow: [
                    BoxShadow(
                        color: Theme.of(context).primaryColorLight,
                        spreadRadius: 3),
                  ],
                ),
              ),
              onTap: () {
                BlocProvider.of<ThemeBloc>(context)
                    .add(ThemeChange(theme: itemAppTheme));
                Navigator.pop(context);
              },
            ),
          ]);
        },
      ),
    );
  }
}
