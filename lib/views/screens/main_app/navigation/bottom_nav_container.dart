import 'package:flutter/material.dart';
import 'package:meworld/views/screens/main_app/navigation/navigator.dart';
import 'package:meworld/views/screens/main_app/navigation/routes.dart';

enum BottomNav { home, explore, notification, profile }

class BottomNavigationContainer extends StatefulWidget {
  const BottomNavigationContainer({
    Key? key,
    required this.currentNav,
  }) : super(key: key);

  final int currentNav;

  @override
  State<BottomNavigationContainer> createState() =>
      _BottomNavigationContainerState();
}

class _BottomNavigationContainerState extends State<BottomNavigationContainer> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.currentNav;
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: (index) {
        _selectedIndex = index;
        final bottomNavItem = BottomNavItem.bottomNavItems[_selectedIndex];
        AppNavigator.pushToRoute(
          context,
          AppRoutes.tab(bottomNavTab: bottomNavItem.nav).path,
        );
      },
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 12,
      unselectedFontSize: 12,
      unselectedItemColor: Colors.black,
      items: [
        ...BottomNavItem.bottomNavItems.map(
          (item) => BottomNavigationBarItem(
            icon: Icon(
              item.asset,
              color: Colors.grey,
            ),
            activeIcon: Icon(
              item.asset,
              color: Colors.purple,
            ),
            label: item.label,
          ),
        ),
      ],
    );
  }
}

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
