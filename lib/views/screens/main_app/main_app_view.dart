import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:meworld/core/repository/db_helper.dart';
import 'package:meworld/core/services/service_locator.dart';
import 'package:meworld/views/screens/account_sign_up.dart';
import 'package:meworld/views/screens/main_app/dashboard_view.dart';
import 'package:meworld/views/screens/main_app/navigation/bottom_nav_container.dart';
import 'package:meworld/views/screens/main_app/notifications_view.dart';
import 'package:meworld/views/screens/main_app/profile_view.dart';
import 'package:meworld/views/screens/main_app/search_view.dart';

final authStateStream = StreamProvider.autoDispose<AuthStates>(
    (ref) => Stream.value(AuthStates.login));

enum AuthStates { login, accountCreate, home }

class MainAppViewer extends ConsumerWidget {
  MainAppViewer({Key? key}) : super(key: key);
  final accountExists =
      FutureProvider((ref) async => sl<Database>().accountExists());
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(accountExists).when(
        data: (userExists) {
          return userExists ? const MainAppView() : AccountSignUp();
        },
        error: (er, st) => const Material(child: Text("Error loading")),
        loading: () =>
            const Material(child: CircularProgressIndicator.adaptive()));
  }
}

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
      floatingActionButton: IconButton(
          onPressed: () async {
            //create sporting event
            GoRouter.of(context).push('/createSportsEvent');
          },
          icon: const Icon(Icons.create)),
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
