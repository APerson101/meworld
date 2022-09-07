import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SportsSearchView extends StatelessWidget {
  const SportsSearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
          child: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BackButton(
                  onPressed: (() => GoRouter.of(context).pop()),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 350,
                    height: 50,
                    child: TextFormField(
                      decoration: const InputDecoration(
                          hintText: 'Search', border: OutlineInputBorder()),
                    ),
                  ),
                ),
              ],
            ),
            const TabBar(
                labelColor: Colors.grey,
                labelStyle: TextStyle(color: Colors.black),
                tabs: [
                  Tab(text: 'shopping'),
                  Tab(text: 'venue'),
                  Tab(text: 'event'),
                ]),
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width * 0.9,
                child: const TabBarView(
                    children: [_ShoppingView(), _Venue(), _EventsResult()]))
          ],
        ),
      )),
    );
  }
}

class _ShoppingView extends StatelessWidget {
  const _ShoppingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("SHOPPING"));
  }
}

class _Venue extends StatelessWidget {
  const _Venue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("VENUE"));
  }
}

class _EventsResult extends StatelessWidget {
  const _EventsResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("EVENTS OR SOMETHING"),
    );
  }
}
