import 'package:flutter/material.dart';
import 'package:meworld/views/screens/main_app/navigation/bottom_nav_container.dart';

class MeWorldBottomAppBAr extends StatefulWidget {
  const MeWorldBottomAppBAr({Key? key}) : super(key: key);

  @override
  State<MeWorldBottomAppBAr> createState() => _MeWorldBottomAppBArState();
}

class _MeWorldBottomAppBArState extends State<MeWorldBottomAppBAr> {
  int _currentPage = 0;
  BottomNavItem? bottomNavItem;
  @override
  Widget build(BuildContext context) {
    List<Widget> items = [
      const Center(
        child: Text('Home'),
      ),
      const Center(
        child: Text('Explore'),
      ),
      const Center(
        child: Text('Notifications'),
      ),
      const Center(
        child: Text('Profile'),
      ),
    ];
    return Scaffold(
      body: items[_currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPage,
        onTap: (index) {
          _currentPage = index;
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
