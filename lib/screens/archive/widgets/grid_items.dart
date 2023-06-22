import 'package:NazarNewsTV/localization/local_languages.dart';
import 'package:flutter/material.dart';

class ArchiveBuilder extends StatelessWidget {

  final Map<String, dynamic> archive;

  ArchiveBuilder({required this.archive});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('${this.archive['year']}');
      },
      child: Stack(
          alignment: Alignment.bottomCenter,
          fit: StackFit.loose,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).primaryColor,
                boxShadow: [
                  BoxShadow(color: Theme.of(context).secondaryHeaderColor, spreadRadius: 3),
                ],
              ),
              child: Center(
                child: Text(
                  '${this.archive['year']}',
                  style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white
                  ),
                ),
              ),
            ),
            Container(
              height: 40.0,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Text(
                  '${getTranslated(context, 'Новостей') + ' ' + this.archive['count'].toString()}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
              ),
            )
          ]
      ),
    );
  }
}
