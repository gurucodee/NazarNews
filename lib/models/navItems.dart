import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemData {
  final String title;
  final IconData icon;
  final String routeName;

  ItemData({required this.title, required this.icon, required this.routeName});

  static List<ItemData> getNavItems() {
    return [
      ItemData(
        title: 'Главная',
        icon: Icons.home,
        routeName: '/',
      ),
      ItemData(
        title: 'О нас',
        icon: Icons.info,
        routeName: '/about-route',
      ),
      ItemData(
        title: 'Темы',
        icon: Icons.layers,
        routeName: '/topics-route',
      ),
      ItemData(
        title: 'Архив',
        icon: Icons.archive,
        routeName: '/archive-route',
      ),
      ItemData(
        title: 'NazarTV',
        icon: Icons.live_tv,
        routeName: '/tv-route',
      ),
      ItemData(
        title: 'Прямой эфир',
        icon: Icons.online_prediction,
        routeName: '/streaming-route',
      ),
      ItemData(
        title: 'Настройки',
        icon: Icons.settings,
        routeName: '/settings-route',
      ),
    ];
  }
}
