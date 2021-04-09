import 'package:NazarNewsTV/app.dart';
import 'package:NazarNewsTV/screens/global_widgets/image_banner.dart';
import 'package:NazarNewsTV/screens/post_details/widgets/tile_overlay.dart';
import 'package:flutter/cupertino.dart';

class HomeItemsBuilder extends StatelessWidget {

  final Map<String, dynamic> post;
  HomeItemsBuilder({this.post});

  _onLocationClick(BuildContext context, Map<String, dynamic> postItem) {
    Navigator.pushNamed(context, PostDetailRoute,
        arguments: {"pid": postItem['pid'], "post": postItem});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onLocationClick(context, post),
      child: Container(
        height: 245.0,
        child: Stack(
          children: [
            ImageBanner(imagePath: post['lg_image'], height: 245.0),
            TileOverLay(post),
          ],
        ),
      ),
    );
  }
}
