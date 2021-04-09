import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageBanner extends StatelessWidget {
  // Private color
  final double height;
  final String imagePath;

  ImageBanner({@required this.imagePath, this.height = 200.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(height: this.height),
      decoration: BoxDecoration(color: Colors.grey),
      child: CachedNetworkImage(
        fit: BoxFit.fill,
        imageUrl: this.imagePath,
        // placeholder: (context, url) => new CircularProgressIndicator(),
        errorWidget: (context, url, error) => new Icon(Icons.error),
      ),
    );
  }
}
