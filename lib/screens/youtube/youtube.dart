import 'package:NazarNewsTV/localization/local_languages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:NazarNewsTV/screens/youtube/widgets/full_scroll.dart';

class YouTubeVideos extends StatefulWidget {
  @override
  _YouTubeVideosState createState() => _YouTubeVideosState();
}

class _YouTubeVideosState extends State<YouTubeVideos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("${getTranslated(context, 'NazarTV')}"),
      ),
      body: FullScrollVideos(),
    );
  }
}