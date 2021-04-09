import "package:flutter/material.dart";
import 'package:NazarNewsTV/screens/post_details/widgets/post_tile.dart';

class TileOverLay extends StatelessWidget {
  final Map<String, dynamic> post;

  TileOverLay(this.post);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 12,
          // padding: EdgeInsets.symmetric(vertical: 1.0),
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.9),),
          child: PostTile(post: post, darkTheme: true),
        ),
      ],
    );
  }
}
