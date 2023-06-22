import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialINavtems {
  final String title;
  final IconData icon;
  final Color color;

  SocialINavtems({required this.title, required this.icon, required this.color});

  static List<SocialINavtems> getSocialIitems() {
    return [
      // Whatsapp
      SocialINavtems(
        icon: FontAwesomeIcons.whatsapp,
        title: '996 702 82-22-97',
        color: Colors.green[700]!,
      ),
      // Facebook
      SocialINavtems(
        icon: FontAwesomeIcons.facebook,
        title: 'NazarNews_TV',
        color: Colors.blue[500]!,
      ),
      // Instagram
      SocialINavtems(
        icon: FontAwesomeIcons.instagram,
        title: '@NazarNews',
        color: Colors.purple[600]!,
      ),
      // Twitter
      SocialINavtems(
        icon: FontAwesomeIcons.twitter,
        title: '@NazarTV',
        color: Colors.blue[400]!,
      )
    ];
  }
}
