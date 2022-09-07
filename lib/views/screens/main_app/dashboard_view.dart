import 'package:flutter/material.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 24,
          horizontal: 16,
        ),
        child: Column(children: [
          Container(
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Text('Wallet Balance: '),
                      Text('\$30 billion'),
                    ],
                  ),
                  Row(
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
                  )
                ],
              ),
            ),
          )
        ]),
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
        height: 50,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Column(children: [Icon(icon), Text(title)]),
      ),
    );
  }
}
