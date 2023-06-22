import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeVideoModal extends StatefulWidget {
  final Map<String, dynamic> video;

  YoutubeVideoModal({required this.video});

  @override
  _YoutubeVideoModalState createState() => _YoutubeVideoModalState();
}

class _YoutubeVideoModalState extends State<YoutubeVideoModal> {

  @override
  Widget build(BuildContext context) {

    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: widget.video['vid'],
      flags: YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
          enableCaption: false,
          controlsVisibleAtStart: true,
          captionLanguage: 'ru',
          startAt: 0
      ),
    );

    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,
      ),
      builder: (context, player) {
        return Column(
          children: [
            // some widgets
            Expanded(
              child: player,
            )
            //some other widgets
          ],
        );
      },
    );
  }
}