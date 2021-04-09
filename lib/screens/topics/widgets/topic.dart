import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SingleTopic extends StatelessWidget {

  final Map<String, dynamic> topic;
  SingleTopic({this.topic});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print(topic['slug']);
      },
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(
                Icons.category,
                size: 40,
              ),
              title: Text(
                topic['name'].toUpperCase(),
                style: TextStyle(
                    fontSize: 18.0,
                    height: 1.5,
                  color: Theme.of(context).primaryColor
                ),
              ),
              subtitle: Text(
                'Всего новостей: ${topic['posts_count'].toString()}',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
