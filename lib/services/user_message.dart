import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:NazarNewsTV/localization/local_languages.dart';

DateTime currentBackPressTime;

Future<bool> toastUserMsg(BuildContext context, String userMsg) async {
  DateTime now = DateTime.now();
  if (currentBackPressTime == null ||
      now.difference(currentBackPressTime) > Duration(seconds: 2)) {
    currentBackPressTime = now;
    Fluttertoast.showToast(
      msg: getTranslated(context, userMsg),
      textColor: Colors.black,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
    );
    return Future.value(false);
  }
  // Fluttertoast.cancel();
  return Future.value(true);
}
