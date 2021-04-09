import 'package:NazarNewsTV/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/style.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:NazarNewsTV/screens/global_widgets/image_banner.dart';

class PostDetail extends StatefulWidget {
  final String id;
  final Map<String, dynamic> post;

  PostDetail({this.id, this.post});

  @override
  _PostDetailState createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {

  _PostDetailState();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  floating: false,
                  pinned: false,
                  snap: false,
                  expandedHeight: 250.0,
                  // title: Text('Post Detail'),
                  flexibleSpace: FlexibleSpaceBar(
                    background: ImageBanner(
                      imagePath: widget.post['lg_image']
                    ),
                  ),
                  actions: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.bookmark_border),
                      tooltip: 'Add to favorite',
                      iconSize: IconSize,
                      onPressed: () { /* ... */ },
                    ),
                    IconButton(
                      icon: const Icon(Icons.format_size),
                      tooltip: 'Font size',
                      iconSize: IconSize,
                      onPressed: () { /* ... */ },
                    ),
                    IconButton(
                      icon: const Icon(Icons.swap_horizontal_circle),
                      tooltip: 'Share post',
                      iconSize: IconSize,
                      onPressed: () { /* ... */ },
                    ),
                  ]
                ),
                SliverPadding(
                  padding: EdgeInsets.all(20.0),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child: Text(
                            widget.post['title'].toUpperCase(),
                            style: Theme.of(context)
                              .textTheme
                              .headline1
                              .copyWith(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                          ),
                        ),
                        Text(
                          widget.post['dtime'].toUpperCase(),
                          style: Theme.of(context).textTheme.subtitle1.copyWith(
                            color: Theme.of(context).primaryColor
                          ),
                        ),
                        Divider(
                          color: Theme.of(context).primaryColor
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                              Html(
                                data: widget.post['html_data'].toString(),
                                style: {
                                  "p": Style(
                                    fontWeight: FontWeight.w300,
                                    fontSize: FontSize(20.0),
                                  ),
                                },
                                onLinkTap: (link) {
                                  print(link);
                                },
                              ),
                            ],
                        ),
                      ]
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  // _loadHtmlFromPost({String htmlText}) async {
  //   _htmlDataViewController.loadUrl( Uri.dataFromString(
  //       htmlText,
  //       mimeType: 'text/html',
  //       encoding: Encoding.getByName('utf-8')
  //   ).toString());
  // }

  // Get posts facts
  // List<Widget> textSections(Post location) {
  //   return location.facts
  //       .map((fact) => TextSection(fact.title, fact.text))
  //       .toList();
  // }
}
