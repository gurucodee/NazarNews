import 'package:NazarNewsTV/screens/global_widgets/error_message.dart';
import 'package:NazarNewsTV/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:NazarNewsTV/models/app_data.dart';
import 'package:NazarNewsTV/services/api/api_service.dart';
import 'package:NazarNewsTV/screens/youtube/widgets/video_item.dart';

class FullScrollVideos extends StatefulWidget {
  @override
  _FullScrollVideosState createState() => _FullScrollVideosState();
}

class _FullScrollVideosState extends State<FullScrollVideos> {

  var YTVideos;
  final PagesUrl _endpoint = PagesUrl.youtube;

  Future<void> _getData() async {
    setState(() {
      YTVideos = apiService<NazarData>(_endpoint, NazarData);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {

    return RefreshIndicator(
      onRefresh: _getData,
      color: Theme.of(context).primaryColor,
      backgroundColor: Theme.of(context).primaryColorLight,
      displacement: RefreshIndicatorDisplacement,
      child: FutureBuilder<NazarData>(
        future: YTVideos,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.data.length,
              itemBuilder: (context, index) {
                var data = snapshot.data.data[index];
                return YoutubeVideoItemBuild(video: data);
              },
            );
            // return Text(snapshot.data);
          } else if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: EdgeInsets.all(30.0),
                child: ErrorMessage(retrivedFunction: _getData,),
              ),
            );
          }

          // By default, show a loading spinner.
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Theme.of(context).primaryColorLight
            ),
          );
        },
      ),
    );
  }
}
