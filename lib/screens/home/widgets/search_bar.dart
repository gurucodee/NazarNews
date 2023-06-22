import 'package:NazarNewsTV/localization/local_languages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchHomeBar extends StatefulWidget {
  final bool searchClicked;
  final TextEditingController filterController;

  const SearchHomeBar(
      {Key? key,
      required this.filterController,
      this.searchClicked = false})
      : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchHomeBar> {
  @override
  Widget build(BuildContext context) {
    bool isSearchClicked = widget.searchClicked;
    final TextEditingController _filter = widget.filterController;

    return FlexibleSpaceBar(
      titlePadding: EdgeInsets.only(bottom: 10),
      centerTitle: true,
      title: isSearchClicked
          ? Container(
              alignment: Alignment.bottomCenter,
              constraints: BoxConstraints(minHeight: 40, maxHeight: 40),
              width: 220,
              child: CupertinoTextField(
                controller: _filter,
                keyboardType: TextInputType.text,
                placeholder: "${getTranslated(context, 'Поиск')}..",
                placeholderStyle: TextStyle(
                  color: Color(0xffC4C6CC),
                  fontSize: 14.0,
                ),
                prefix: Padding(
                  padding: const EdgeInsets.fromLTRB(9.0, 6.0, 9.0, 6.0),
                  child: Icon(
                    Icons.search,
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white,
                ),
              ),
            )
          : Text(""),

      //Image.network("https://scontent.fjrs1-3.fna.fbcdn.net/v/t1.0-9/90707494_2843540642400370_8486107270902448128_o.jpg?_nc_cat=100&ccb=2&_nc_sid=6e5ad9&_nc_ohc=YEhQ4gFixKIAX8vlRA_&_nc_ht=scontent.fjrs1-3.fna&oh=a6a719a15c8630822994263a066bcb01&oe=6028D493", fit: BoxFit.cover,)
      background: Image.asset(
        'assets/images/home_bg.png',
        fit: BoxFit.fill,
      ),
    );
  }
}
