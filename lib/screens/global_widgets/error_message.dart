import 'package:NazarNewsTV/localization/local_languages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorMessage extends StatefulWidget {

  final dynamic retrivedFunction;

  const ErrorMessage({Key key, this.retrivedFunction}) : super(key: key);

  @override
  _ErrorMessageState createState() => _ErrorMessageState();
}

class _ErrorMessageState extends State<ErrorMessage> {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Icon(
            Icons.public_off_outlined,
            size: 60.0,
            color: Colors.black12,
          ),
        ),
        SizedBox(height: 20.0),
        Text(
          '${getTranslated(context, 'Потеряно подключение к серверу, проверьте подключение к интернету!')}',
          style: TextStyle(
            color: Colors.black54,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10.0),
        OutlineButton(
          splashColor: Theme.of(context).primaryColorLight,
          color: Colors.white,
          onPressed: () {
            widget.retrivedFunction();
          },
          child: Text('${getTranslated(context, 'Повторите попытку')}'),
        ),
      ],
    );
  }
}
