import 'package:flutter/material.dart';
import 'package:meworld/views/screens/main_app/dashboard_view.dart';
import 'package:meworld/views/screens/main_app/navigation/bottom_nav_container.dart';
import 'package:meworld/views/screens/main_app/notifications_view.dart';
import 'package:meworld/views/screens/main_app/profile_view.dart';
import 'package:meworld/views/screens/main_app/search_view.dart';

class MainAppView extends StatefulWidget {
  const MainAppView({Key? key}) : super(key: key);

  @override
  State<MainAppView> createState() => _MainAppViewState();
}

class _MainAppViewState extends State<MainAppView> {
  int _currentPage = 0;
  BottomNavItem? bottomNavItem;
  @override
  Widget build(BuildContext context) {
    List<Widget> items = [
      const DashboardView(),
      const ExploreScreen(),
      const NotificationsView(),
      const ProfileView(),
    ];
    return Scaffold(
      body: items[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPage,
        onTap: (index) {
          _currentPage = index;
          setState(() {});
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
      ),
    );
  }
}
