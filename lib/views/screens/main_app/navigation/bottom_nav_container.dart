import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:routelift/src/features/navigation/navigator.dart';
import 'package:routelift/src/features/navigation/routes.dart';
import 'package:routelift/src/features/send_package/presentation/screens/pickup_details/pickup_details.dart';
import 'package:routelift/src/shared/utils/utils.dart';

enum BottomNav { home, delivery, reports, profile }

class BottomNavigationContainer extends StatefulWidget {
  const BottomNavigationContainer({
    Key? key,
    required this.currentNav,
  }) : super(key: key);

  final BottomNav currentNav;

  @override
  State<BottomNavigationContainer> createState() =>
      _BottomNavigationContainerState();
}

class _BottomNavigationContainerState extends State<BottomNavigationContainer> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = BottomNavItem.bottomNavItems.indexWhere(
      (bottomNav) => bottomNav.nav == widget.currentNav,
    );
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
            icon: SvgPicture.asset(
              item.asset,
              color: appColors.grey500,
            ),
            activeIcon: SvgPicture.asset(
              item.activeAsset,
              color: appColors.purple,
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
  final String asset;
  final String activeAsset;
  final BottomNav nav;
  final Widget body;

  static final bottomNavItems = <BottomNavItem>[
    BottomNavItem(
      label: 'Home',
      activeAsset: icHome,
      asset: icHome,
      nav: BottomNav.home,
      body: const PickupDetails(),
    ),
    BottomNavItem(
      label: 'Delivery',
      activeAsset: icDelivery,
      asset: icDelivery,
      nav: BottomNav.delivery,
      body: const Center(
        child: Text('Delivery'),
      ),
    ),
    BottomNavItem(
      label: 'Reports',
      activeAsset: icReports,
      asset: icReports,
      nav: BottomNav.reports,
      body: const Center(
        child: Text('Reports'),
      ),
    ),
    BottomNavItem(
      label: 'Profile',
      activeAsset: icProfile,
      asset: icProfile,
      nav: BottomNav.profile,
      body: const Center(
        child: Text('Profile'),
      ),
    ),
  ];
}
