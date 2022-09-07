import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.withOpacity(0.4),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 24,
          horizontal: 16,
        ),
        child: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Text('Welcome, '),
                    Text('Scammer!'),
                  ],
                ),
                Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: const Icon(Icons.chat_outlined))
              ],
            ),
            Container(
              height: 150,
              margin: const EdgeInsets.only(top: 30, bottom: 40),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('Wallet Balance: '),
                        Text('\$30 billion'),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          WalletBalanceWidgets(
                            icon: Icons.add,
                            title: 'ADD',
                          ),
                          WalletBalanceWidgets(
                            icon: Icons.remove,
                            title: 'REMOVE',
                          ),
                          WalletBalanceWidgets(
                            icon: Icons.history,
                            title: 'HISTORY',
                          ),
                          WalletBalanceWidgets(
                            icon: Icons.monetization_on,
                            title: 'LOAN',
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              alignment: WrapAlignment.center,
              children: [
                DashBoardCards(
                  title: 'Artisans',
                  icon: Icons.settings,
                  onPressed: () {
                    GoRouter.of(context).push('/artisanCategory');
                  },
                ),
                const DashBoardCards(
                    title: 'Health', icon: Icons.health_and_safety),
                DashBoardCards(
                  title: 'Sports',
                  icon: Icons.sports_baseball_rounded,
                  onPressed: () => GoRouter.of(context).push('/Sports'),
                ),
                const DashBoardCards(
                    title: 'Freelancer', icon: Icons.engineering),
                const DashBoardCards(
                  title: 'Logistics',
                  icon: Icons.car_rental,
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}

class WalletBalanceWidgets extends StatelessWidget {
  const WalletBalanceWidgets({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      behavior: HitTestBehavior.translucent,
      child: Container(
        height: 55,
        width: 80,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          Text(
            title,
            style: const TextStyle(color: Colors.white),
          )
        ]),
      ),
    );
  }
}

class DashBoardCards extends StatelessWidget {
  const DashBoardCards(
      {Key? key, required this.title, required this.icon, this.onPressed})
      : super(key: key);
  final String title;
  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPressed,
      behavior: HitTestBehavior.translucent,
      child: Container(
        height: size.height / 6,
        width: size.width / 2.25,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(icon), Text(title)]),
      ),
    );
  }
}
