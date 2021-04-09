import 'package:NazarNewsTV/localization/local_languages.dart';
import 'package:NazarNewsTV/models/app_data.dart';
import 'package:NazarNewsTV/screens/archive/widgets/grid_items.dart';
import 'package:NazarNewsTV/screens/global_widgets/error_message.dart';
import 'package:NazarNewsTV/services/api/api_service.dart';
import 'package:NazarNewsTV/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostsArchive extends StatefulWidget {
  @override
  _PostsArchiveState createState() => _PostsArchiveState();
}

class _PostsArchiveState extends State<PostsArchive> {
  var archive;
  final PagesUrl _endpoint = PagesUrl.archive;

  Future<void> _getData() async {
    setState(() {
      archive = apiService<NazarData>(_endpoint, NazarData);
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
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("${getTranslated(context, 'Архив')}"),
      ),
      body: FutureBuilder<NazarData>(
        future: archive,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
                padding: SliverGridPadding,
                itemCount: snapshot.data.data.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  var data = snapshot.data.data[index];
                  return ArchiveBuilder(archive: data);
                });
          } else if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: EdgeInsets.all(30.0),
                child: ErrorMessage(
                  retrivedFunction: _getData,
                ),
              ),
            );
          }
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
