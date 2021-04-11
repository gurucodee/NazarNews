import 'dart:io';
import 'dart:async';
import 'package:NazarNewsTV/localization/local_languages.dart';
import 'package:NazarNewsTV/models/app_data.dart';
import 'package:NazarNewsTV/screens/global_widgets/error_message.dart';
import 'package:NazarNewsTV/services/api/api_service.dart';
import 'package:NazarNewsTV/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// final _webViewKey = GlobalKey<_LiveStreamState>();

class LiveStream extends StatefulWidget {

  @override
  _LiveStreamState createState() => _LiveStreamState();
}

class _LiveStreamState extends State<LiveStream> {

  var stream;
  bool webViewIsLoading = true;
  WebViewController _webViewController;
  final PagesUrl _endpoint = PagesUrl.stream;

  Future<void> _getData() async {
    setState(() {
      // Check if webViewIsLoading is true that means webview still not loaded
      if (!webViewIsLoading) {
        webViewIsLoading = true;
        _webViewController?.reload();
      }
      stream = apiService<NazarData>(_endpoint, NazarData);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("${getTranslated(context, 'Прямой эфир')}"),
        actions: [
          IconButton(
            iconSize: IconSize,
            splashColor: Theme.of(context).primaryColorLight,
            onPressed: () {
              _getData();
            },
            icon: Icon(
              Icons.refresh,
              color: Colors.white,
            ),
          )
        ],
      ),
      resizeToAvoidBottomInset: true,
      extendBody: true,
      body: FutureBuilder<NazarData>(
        future: stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data.data[0];
            if(!data['online']){
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Icon(
                    Icons.tv_off,
                      size: 60.0,
                      color: Colors.black12,
                    ),
                  ),
                  Text(
                    'На данный момент нет прямого эфира!',
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  )
                ],
              );
            } else {
              return Stack(
                  children: [
                    Container(
                      child:
                      WebView(
                        // key: _webViewKey,
                        initialUrl: Uri.dataFromString(
                            '<html><body><style>*{margin:0;padding:0;}iframe{width:100%;height:100%;}</style>${data["iframe"]}</body></html>',
                            mimeType: 'text/html').toString(),
                        javascriptMode: JavascriptMode.unrestricted,

                        onWebViewCreated: (WebViewController webViewController) {
                          // _webViewController.complete(webViewController);
                          _webViewController = webViewController;
                        },
                        onPageFinished: (finish) {
                          setState(() {
                            webViewIsLoading = false;
                          });
                        },
                      ),
                    ),
                    webViewIsLoading ? Center( child: CircularProgressIndicator(
                      backgroundColor: Theme.of(context).primaryColorLight
                    ),)
                        : Stack(),
                  ]
              );
            }
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