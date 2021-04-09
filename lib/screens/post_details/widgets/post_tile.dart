import "package:flutter/material.dart";
import "package:NazarNewsTV/styles.dart";

class PostTile extends StatelessWidget {

  final bool darkTheme;
  final Map<String, dynamic> post;

  PostTile({this.post, this.darkTheme = false});

  @override
  Widget build(BuildContext context) {
    final textColor = this.darkTheme ? TextColorLight : TextColorDark;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: DefaultPaddingHorz),
      height: LocationTileHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            post['title'].toUpperCase(),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: Theme.of(context)
                .textTheme
                .headline1
                .copyWith(color: textColor),
          ),
          Text(
            post['dtime'].toUpperCase(),
            style: Theme.of(context).textTheme.subtitle1.copyWith(
              color: Theme.of(context).primaryColor
            ),
          ),
        ],
      ),
    );
  }
}
