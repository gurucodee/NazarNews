import 'package:share_plus/share_plus.dart';
import 'package:NazarNewsTV/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:NazarNewsTV/screens/youtube/widgets/video_actions.dart';

class YoutubeVideoItemBuild extends StatefulWidget {

  final Map<String, dynamic> video;

  YoutubeVideoItemBuild({required this.video});

  @override
  _YoutubeVideoItemBuildState createState() => _YoutubeVideoItemBuildState();
}

class _YoutubeVideoItemBuildState extends State<YoutubeVideoItemBuild> with SingleTickerProviderStateMixin {

  // Position each button according to it degree
  double getRadiansFromDegree(double degree) {
    double unitRadian = 57.295779513;
    return degree / unitRadian;
  }

  Function? shareVideo() {
    final RenderBox? box = context.findRenderObject() as RenderBox?;
    if (box != null) {
      Share.share(
        widget.video['url'],
        subject: widget.video['title'],
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
      );
    }
    return null;
  }

  // Create an animation controller to animate the video button actions
  late Animation rotationAnimation;
  late Animation degShareButtonTranslationAnimation;
  late Animation degPlayButtonTranslationAnimation;
  late AnimationController animationController;

  @override
  void initState(){

    // Animation controller
    animationController = AnimationController(
        vsync: this,
        duration: Duration(
            milliseconds: 250
        )
    );

    // One element animation
    degShareButtonTranslationAnimation = TweenSequence(
      [
        TweenSequenceItem<double>(
          tween: Tween<double>(
            begin: 0.0,
            end: 1.2
          ),
          weight: 75.0
        ),
        TweenSequenceItem<double>(
          tween: Tween<double>(
            begin: 1.4,
            end: 1.0
          ),
          weight: 25.0
        ),
      ]
    ).animate(animationController);

    degPlayButtonTranslationAnimation = TweenSequence(
        [
          TweenSequenceItem<double>(
              tween: Tween<double>(
                  begin: 0.0,
                  end: 1.4
              ),
              weight: 55.0
          ),
          TweenSequenceItem<double>(
              tween: Tween<double>(
                  begin: 1.4,
                  end: 1.0
              ),
              weight: 45.0
          ),
        ]
    ).animate(animationController);

    // This for a single animation
    // degOneTranslationAnimation = Tween(
    //   begin: 0.0,
    //   end: 1.0,
    // ).animate(animationController);

    // Rotation animation
    rotationAnimation = Tween<double>(
      begin: 180.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOut
      )
    );

    super.initState();

    animationController.addListener(() {
      setState(() {});
    });

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    _onLocationClick(BuildContext context, video) {
      Navigator.pushNamed(context, YoutubeVideoRoute,
          arguments: {"videoItem": video});
    }

    // final GlobalKey _menuKey = new GlobalKey();
    final _fixedHeight = MediaQuery.of(context).size.height / 3;

    return Container(
      height: _fixedHeight,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).primaryColorLight, width: 1.0,
          )
        ),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            color: Theme.of(context).primaryColorLight,
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: widget.video['thumbnail'],
              // placeholder: (context, url) => new CircularProgressIndicator(),
              errorWidget: (context, url, error) => new Icon(Icons.error),
            ),
          ),
          Container(
            // height: 60.0,
            width: MediaQuery.of(context).size.width,
            color: Colors.black54,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Positioned(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          IgnorePointer(
                            child: Container(
                              // comment or change to transparent color
                              // Set color if height is greater than zero
                              // color: Colors.black.withOpacity(1.0),
                              height: 0.0,
                              width: 350.0,
                            ),
                          ),
                          Transform.translate(
                            offset: Offset.fromDirection(getRadiansFromDegree(180), degShareButtonTranslationAnimation.value * -100),
                            child: Transform(
                              transform: Matrix4.rotationZ(getRadiansFromDegree(rotationAnimation.value))..scale(degShareButtonTranslationAnimation.value),
                              alignment: Alignment.center,
                              child: VideoActionButton(
                                color: Colors.blueGrey,
                                width: 60,
                                height: 60,
                                icon: Icon(
                                  Icons.swap_horizontal_circle,
                                  color: Colors.white,
                                ),
                                onClick: () {
                                  shareVideo();
                                },
                              ),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset.fromDirection(getRadiansFromDegree(180), degPlayButtonTranslationAnimation.value * 100),
                            child: Transform(
                              transform: Matrix4.rotationZ(getRadiansFromDegree(rotationAnimation.value))..scale(degPlayButtonTranslationAnimation.value),
                              alignment: Alignment.center,
                              child: VideoActionButton(
                                color: Colors.white,
                                width: 60,
                                height: 60,
                                icon: Icon(
                                  Icons.play_arrow_outlined,
                                  color: Theme.of(context).primaryColor,
                                ),
                                onClick: () {
                                  _onLocationClick(context, widget.video);
                                },
                              ),
                            ),
                          ),
                          Transform(
                            transform: Matrix4.rotationZ(getRadiansFromDegree(rotationAnimation.value)),
                            alignment: Alignment.center,
                            child: VideoActionButton(
                              color: Theme.of(context).primaryColor,
                              width: 60,
                              height: 60,
                              icon: Icon(
                                !animationController.isCompleted ? Icons.menu_open : Icons.close,
                                color: Colors.white,
                              ),
                              onClick: () {
                                if (animationController.isCompleted) {
                                  animationController.reverse();
                                } else {
                                  animationController.forward();
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.timer,
                        color: Colors.white,
                        size: 20.0,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        '${widget.video["duration"]}',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
