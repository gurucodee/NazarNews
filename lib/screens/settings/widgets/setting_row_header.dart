import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsHeader extends StatefulWidget {
  final double iconSize;
  final String headerText;
  final IconData headerIcon;

  const SettingsHeader({Key key, this.headerIcon, this.headerText, this.iconSize}) : super(key: key);

  @override
  _SettingsHeaderState createState() => _SettingsHeaderState();
}

class _SettingsHeaderState extends State<SettingsHeader> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 15.0),
          child: Row(
            children: [
              Icon(
                widget.headerIcon,
                color: Theme.of(context).primaryColor,
              ),
              SizedBox(width: 8,),
              Text(
                "${widget.headerText}",
                style: TextStyle(
                  fontSize: widget.iconSize,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ),
        Divider(
          height: 15,
          thickness: 1,
        ),
        SizedBox(height: 10,)
      ],
    );
  }
}
