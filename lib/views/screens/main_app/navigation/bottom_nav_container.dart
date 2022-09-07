import 'package:flutter/material.dart';

enum BottomNav { home, explore, notification, profile }

class BottomNavItem {
  const BottomNavItem({
    required this.label,
    required this.asset,
    required this.activeAsset,
    required this.nav,
    required this.body,
  });

  final String label;
  final IconData asset;
  final String activeAsset;
  final BottomNav nav;
  final Widget body;

  static final bottomNavItems = <BottomNavItem>[
    const BottomNavItem(
      label: 'Home',
      activeAsset: 'Home',
      asset: Icons.home,
      nav: BottomNav.home,
      body: Center(child: Text('data')),
    ),
    const BottomNavItem(
      label: 'Explore',
      activeAsset: 'Explore',
      asset: Icons.search,
      nav: BottomNav.explore,
      body: Center(
        child: Text('Explore'),
      ),
    ),
    const BottomNavItem(
      label: 'Notifications',
      activeAsset: 'Notifications',
      asset: Icons.notifications,
      nav: BottomNav.notification,
      body: Center(
        child: Text('Notifications'),
      ),
    ),
    const BottomNavItem(
      label: 'Profile',
      activeAsset: 'Profile',
      asset: Icons.person,
      nav: BottomNav.profile,
      body: Center(
        child: Text('Profile'),
      ),
    ),
  ];
}
