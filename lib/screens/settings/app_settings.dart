import 'dart:io';
import 'package:NazarNewsTV/app.dart';
import 'package:NazarNewsTV/localization/local_languages.dart';
import 'package:NazarNewsTV/screens/settings/widgets/setting_row_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

import '../../app.dart';

class AppSettings extends StatefulWidget {
  @override
  _AppSettingsState createState() => _AppSettingsState();
}

class _AppSettingsState extends State<AppSettings> {
  final double _listFontSize = 18;
  final double _containerPadding = 16;
  bool _switchNotificationValue = false;

  final Icon _arrowIcon = Icon(
    Icons.keyboard_arrow_right,
    color: Colors.grey[600],
  );

  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
  );

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  _onLocationClick(
      BuildContext context, String routeWidget, [Map<String, dynamic> info]) {
    Navigator.pushNamed(context, routeWidget, arguments: info ?? null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(),// title: Text('App Settings'),
      body: Container(
        padding: EdgeInsets.only(
            left: _containerPadding, top: 25, right: _containerPadding),
        child: ListView(
          children: [
            Text(
              getTranslated(context, 'Настройки'),
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SettingsHeader(
              iconSize: _listFontSize,
              headerIcon: Icons.verified_outlined,
              headerText: getTranslated(context, 'Версия'),
            ),
            buildSettingsRow(context, rowText: getTranslated(context, 'Выберите рубрики'),
                rowCallBack: () {
              print('Hello world!');
            }),
            buildSettingsRow(context, rowText: getTranslated(context, 'Язык'), rowCallBack: () {
              _onLocationClick(context, AppSettingsLanguagesRoute);
            }),
            SettingsHeader(
              iconSize: _listFontSize,
              headerIcon: Icons.phonelink_setup_outlined,
              headerText: getTranslated(context, 'Приложение'),
            ),
            buildSettingsRow(context, rowText: getTranslated(context, "Размер шрифта"),
                rowCallBack: () {
                _onLocationClick(context, AppSettingsFontSizeRoute);
            }),
            buildSettingsRow(context, rowText: getTranslated(context, "Поменять тему"),
                rowCallBack: () {
                _onLocationClick(context, AppSettingsChangeThemeRoute);
            }),
            buildSettingsRow(context,
                rowText: getTranslated(context, 'Уведомления'), isNotification: true, rowCallBack: () {
              print('Hello world!');
            }),
            buildSettingsRow(context, rowText: getTranslated(context, 'Управление данными'),
                rowCallBack: () {
              print('Hello world!');
            }),
            SettingsHeader(
              iconSize: _listFontSize,
              headerIcon: Icons.privacy_tip_outlined,
              headerText: getTranslated(context, 'Приватность'),
            ),
            buildSettingsRow(context, rowText: getTranslated(context, 'Соглашение'), rowCallBack: () {
              print('Hello world!');
            }),
            buildSettingsRow(context, rowText: getTranslated(context, 'Политика конфиденциальности'),
                rowCallBack: () {
              print('Hello world!');
            }),
            buildSettingsRow(
              context,
              noIcon: true,
              rowText: getTranslated(context, 'О приложении'),
                rowCallBack: () {
              _onLocationClick(context, AppSettingsDescriptionRoute,
                  {'appInfo': _packageInfo});
              // print(_packageInfo.version);
              // print(_packageInfo.appName);
              // print(_packageInfo.buildNumber);
              // print(_packageInfo.packageName);
              // print('Running on ${Platform.operatingSystem.toUpperCase()} ${Platform.operatingSystemVersion} ${Platform.localeName} ${Platform.version}');
            }),
          ],
        ),
      ),
    );
  }

  GestureDetector buildSettingsRow(
    BuildContext context, {
    String rowText,
    Function rowCallBack,
    bool noIcon = false,
    bool isNotification = false,
  }) {
    return GestureDetector(
      onTap: () {
        rowCallBack();
      },
      child: InkWell(
        highlightColor: Theme.of(context).primaryColorLight,
        splashColor: Theme.of(context).primaryColorLight,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                rowText,
                style: TextStyle(
                  fontSize: _listFontSize,
                  fontWeight: FontWeight.w300,
                  color: Colors.grey[600],
                ),
              ),
              if (noIcon)
                Text(
                  'v${_packageInfo.version}',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                )
              else if (isNotification)
                Transform.scale(
                  scale: 0.7,
                  child: CupertinoSwitch(
                    activeColor: Theme.of(context).primaryColor,
                    value: _switchNotificationValue,
                    onChanged: (bool value) {
                      setState(() {
                        _switchNotificationValue = value;
                        print('Notifications $_switchNotificationValue');
                      });
                    },
                  ),
                )
              else
                _arrowIcon
            ],
          ),
        ),
      ),
    );
  }
}
