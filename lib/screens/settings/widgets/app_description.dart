import 'dart:io';
import 'package:NazarNewsTV/localization/local_languages.dart';
import 'package:NazarNewsTV/screens/settings/app_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class ApplicationDescription extends StatefulWidget {

  final PackageInfo info;

  const ApplicationDescription({Key? key, required this.info}) : super(key: key);

  @override
  _ApplicationDescriptionState createState() => _ApplicationDescriptionState();
}

class _ApplicationDescriptionState extends State<ApplicationDescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getTranslated(context, 'О приложении')),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: CircleAvatar(
                  radius: 100,
                  child: Image.asset(
                      'assets/icon/icon.jpg',
                    fit: BoxFit.fill,
                    scale: 0.9,
                  ), //Text
                ), //CirlceAvatar
              ),
            ), //Center
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  color: Colors.grey,
                  padding: EdgeInsets.symmetric(vertical: 35, horizontal: 25),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "${widget.info.appName}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white
                        ),
                      ),
                      SizedBox(height: 25),
                      Text(
                        "${ getTranslated(context, 'Версия') + ' ' + widget.info.version}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          letterSpacing: 1.2,
                          fontWeight: FontWeight.normal,
                          fontSize: 18,
                            color: Colors.white
                        ),
                      ),
                      SizedBox(height: 25),
                      Text(
                        "${Platform.operatingSystem.toUpperCase()} \n ${Platform.version}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            letterSpacing: 1.2,
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                            color: Colors.white
                        ),
                      ),
                      SizedBox(height: 25),
                      Text(
                        "${ getTranslated(context, 'Название пакета') + ' ' + widget.info.packageName}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            letterSpacing: 1.2,
                            fontWeight: FontWeight.normal,
                            fontSize: 18,
                            color: Colors.white
                        ),
                      ),
                      SizedBox(height: 25),
                      Text(
                        "${getTranslated(context, 'Разработка')}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        "GuruCode",
                        style: TextStyle(
                          color: Colors.white54,
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        "reznov110@gmail.com",
                        style: TextStyle(
                            color: Colors.white54,
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
