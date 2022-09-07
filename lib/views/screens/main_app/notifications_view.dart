import 'package:flutter/material.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
      ),
      body: const _Notifications(),
    );
  }
}

class _Notifications extends StatelessWidget {
  const _Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView(children: [
        ...List.generate(
            10,
            (index) => Card(
                  child: ListTile(
                    onTap: () {},
                    leading: const Icon(Icons.notifications),
                    title: const Text("You have a new message from Body Gym"),
                  ),
                ))
      ]),
    );
  }
}
