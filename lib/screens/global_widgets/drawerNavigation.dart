import 'package:NazarNewsTV/localization/app_localization.dart';
import 'package:NazarNewsTV/localization/local_languages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/cupertino.dart';
import 'package:NazarNewsTV/models/navItems.dart';
import 'package:NazarNewsTV/models/socialItems.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DrawerNavigationWidget extends StatelessWidget {
  const DrawerNavigationWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _navItems = ItemData.getNavItems();
    final _socialItems = SocialINavtems.getSocialIitems();

    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  color: Colors.green,
                  child: DrawerHeader(
                    margin: EdgeInsets.zero,
                    padding: EdgeInsets.zero,
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                      image: DecorationImage(
                        image: AssetImage('assets/images/header_bg.jpg'),
                        fit: BoxFit.cover,
                        alignment: Alignment.bottomLeft,
                      ),
                    ),
                    child: Container(
                      height: 50.0,
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width / 1.5,
                      child: CachedNetworkImage(
                        colorBlendMode: BlendMode.lighten,
                        color: Theme.of(context).primaryColor.withOpacity(0.4),
                        fit: BoxFit.fill,
                        width: 40.0,
                        height: 40.0,
                        imageUrl: 'https://nazarnews.org/static/img/ico.png',
                        placeholder: (context, url) =>
                            new CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            new Icon(Icons.error),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    color: Theme.of(context).primaryColor,
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      // scrollDirection: Axis.vertical,
                      itemCount: _navItems.length,
                      itemBuilder: (context, index) =>
                          _itemBuilder(context, _navItems[index]),
                    ),
                  ),
                  flex: 2,
                ),
                Expanded(
                  child: Container(
                    color: Theme.of(context).primaryColor,
                    child: ListView.builder(
                      padding: EdgeInsets.only(top: 10.0),
                      itemCount: _socialItems.length,
                      itemBuilder: (context, index) =>
                          _socialItemsBuilder(context, _socialItems[index]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _socialItemsBuilder(BuildContext context, SocialINavtems item) {
    return ListTile(
      dense: true,
      leading: CircleAvatar(
        backgroundColor: Theme.of(context).primaryColorLight,
        child: FaIcon(
          item.icon,
          color: item.color,
        ),
      ),
      title: Text(
        '${item.title}',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, ItemData item) {
    final _textStyle = TextStyle(
      color: Colors.white,
      fontSize: 20,
    );

    return Padding(
      padding: EdgeInsets.only(bottom: 10.0),
      child: ListTile(
        leading: Icon(
          item.icon,
          color: Colors.white,
          size: 35,
        ),
        title: Text(
          getTranslated(context, item.title).toUpperCase(),
          style: _textStyle,
        ),
        onTap: () {
          Navigator.pop(context);
          Navigator.pushNamed(context, item.routeName);
        },
      ),
    );
  }
}
