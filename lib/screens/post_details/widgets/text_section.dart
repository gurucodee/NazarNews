import 'package:flutter/material.dart';

class TextSection extends StatelessWidget {
  // Private color
  // Color _color;

  final String _title;
  final String _body;

  static const double _hPad = 16.0;

  TextSection(this._title, this._body);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(_hPad, 32.0, _hPad, 4.0),
          child: Text(
            this._title,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(_hPad, 10.0, _hPad, _hPad),
          child: Text(
            this._body,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        )
      ],
    );
  }
}
