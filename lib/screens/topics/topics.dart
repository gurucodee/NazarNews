import 'package:NazarNewsTV/localization/local_languages.dart';
import 'package:NazarNewsTV/models/app_data.dart';
import 'package:NazarNewsTV/screens/global_widgets/error_message.dart';
import 'package:NazarNewsTV/screens/topics/widgets/topic.dart';
import 'package:NazarNewsTV/services/api/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostTopics extends StatefulWidget {
  @override
  _PostTopicsState createState() => _PostTopicsState();
}

class _PostTopicsState extends State<PostTopics> {

  var topics;
  final PagesUrl _endpoint = PagesUrl.topics;

  Future<void> _getData() async {
    setState(() {
      topics = apiService<NazarData>(_endpoint, NazarData);
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("${getTranslated(context, 'Темы')}"),
      ),
      extendBody: true,
      body: Container(
        child: FutureBuilder<NazarData>(
          future: topics,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.data.length,
                itemBuilder: (context, index) {
                  var data = snapshot.data.data[index];
                  return SingleTopic(topic: data);
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
      ),
    );
  }
}
