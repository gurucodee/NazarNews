import 'package:NazarNewsTV/screens/global_widgets/error_message.dart';
import 'package:NazarNewsTV/screens/home/widgets/items_builder.dart';
import 'package:NazarNewsTV/screens/home/widgets/search_bar.dart';
import 'package:NazarNewsTV/services/user_message.dart';
import 'package:NazarNewsTV/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:share/share.dart';
import "package:flutter/material.dart";
import "package:NazarNewsTV/models/app_data.dart";
import 'package:NazarNewsTV/services/api/api_service.dart';
import 'package:NazarNewsTV/screens/global_widgets/drawerNavigation.dart';

class Home extends StatefulWidget {
  @override
  News createState() => News();
}

class News extends State<Home> {
  var homePosts;
  Icon _searchIcon = Icon(
    Icons.search,
    size: 28.0,
  );
  bool isSearchClicked = false;
  final String subject = 'NazarNews TV';
  final PagesUrl _endpoint = PagesUrl.home;
  final String website_url = 'https://nazarnews.org/';
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _filterContoller = new TextEditingController();

  Future<void> _getHomePosts() async {
    setState(() {
      homePosts = apiService<NazarData>(_endpoint, NazarData);
    });
  }

  void _searchPressed() {
    setState(() {
      if (_searchIcon.icon == Icons.search) {
        _searchIcon = Icon(
          Icons.close,
        );
        isSearchClicked = true;
      } else {
        _searchIcon = Icon(
          Icons.search,
        );
        isSearchClicked = false;
        _filterContoller.clear();
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getHomePosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: DrawerNavigationWidget(),
      extendBody: true,
      backgroundColor: Colors.white,
      body: WillPopScope(
        onWillPop: () async => await toastUserMsg(context, "Для подтверждения выхода, нажмите назад ещё раз"),
        child: RefreshIndicator(
          color: Theme.of(context).primaryColor,
          backgroundColor: Theme.of(context).primaryColorLight,
          displacement: RefreshIndicatorDisplacement,
          onRefresh: _getHomePosts,
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(80),
                    bottomRight: Radius.circular(80),
                  ),
                ),
                leading: InkWell(
                  onTap: () {
                    _scaffoldKey.currentState.openDrawer();
                  },
                  child: Icon(
                    Icons.menu_open_outlined,
                    size: 40.0,
                  ),
                ),
                backgroundColor: Theme.of(context).primaryColor,
                floating: false,
                pinned: true,
                snap: false,
                brightness: Brightness.dark,
                expandedHeight: 350.0,
                actions: <Widget>[
                  RawMaterialButton(
                    elevation: 0.0,
                    child: _searchIcon,
                    splashColor: Theme.of(context).primaryColorLight,
                    // fillColor: Theme.of(context).primaryColorLight,
                    onPressed: () {
                      _searchPressed();
                    },
                    constraints: BoxConstraints.tightFor(
                      width: 56,
                      height: 56,
                    ),
                    shape: CircleBorder(),
                  ),
                ],
                flexibleSpace: SearchBar(
                  filterController: _filterContoller,
                  searchClicked: isSearchClicked,
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Column(
                      children: [
                        FutureBuilder<NazarData>(
                          future: homePosts,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                itemCount: snapshot.data.data.length,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                itemBuilder: (context, index) {
                                  var data = snapshot.data.data[index];
                                  return HomeItemsBuilder(post: data);
                                },
                              );
                            } else if (snapshot.hasError) {
                              return Padding(
                                padding: EdgeInsets.all(30.0),
                                child: ErrorMessage(
                                  retrivedFunction: _getHomePosts,
                                ),
                              );
                            }
                            // By default, show a loading spinner.
                            return Padding(
                              padding: EdgeInsets.all(30.0),
                              child: Center(
                                child: CircularProgressIndicator(
                                  backgroundColor:
                                      Theme.of(context).primaryColorLight,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // Share App Button
      floatingActionButton: FloatingActionButton(
        tooltip: 'Share app',
        child: Icon(Icons.share),
        splashColor: Theme.of(context).primaryColorLight,
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          final RenderBox box = context.findRenderObject();
          Share.share(
            website_url,
            subject: subject,
            sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
          );
        },
      ),
    );
  }
}
