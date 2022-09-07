import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:meworld/core/models/sporting_event_model.dart';

class SportsView extends StatelessWidget {
  const SportsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: SportsEventsLoadingView()));
  }
}

class SportsEventsLoadingView extends ConsumerWidget {
  const SportsEventsLoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(loadSportsEventProvider).when(
        data: (events) => _SportsEventView(events: events),
        error: (er, sr) {
          log(sr.toString());
          return const Center(child: Text("Unknown Error"));
        },
        loading: () => const Material(
            child: Center(child: CircularProgressIndicator.adaptive())));
  }
}

class _SportsEventView extends ConsumerWidget {
  _SportsEventView({Key? key, required this.events}) : super(key: key);
  final List<SportsEvent> events;
  final currentChip = StateProvider((ref) => 0);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListTile(
              title: const FlutterLogo(),
              leading: BackButton(
                onPressed: () => GoRouter.of(context).pop(),
              ),
              trailing: SizedBox(
                width: 200,
                child: ButtonBar(
                  children: [
                    TextButton(
                        onPressed: () {}, child: const Text("create event")),
                    IconButton(
                        onPressed: () {
                          GoRouter.of(context).push('/SportsSearch');
                        },
                        icon: const Icon(Icons.search))
                  ],
                ),
              )),
          SizedBox(
            height: 100,
            width: MediaQuery.of(context).size.width * .9,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ChoiceChip(
                    label: const Text('all'),
                    onSelected: (selected) => selected
                        ? ref.watch(currentChip.notifier).state = 0
                        : null,
                    selected: ref.watch(currentChip) == 0),
                ChoiceChip(
                    label: const Text("one-off"),
                    onSelected: (selected) => selected
                        ? ref.watch(currentChip.notifier).state = 1
                        : null,
                    selected: ref.watch(currentChip) == 1),
                ChoiceChip(
                    label: const Text('live'),
                    onSelected: (selected) => selected
                        ? ref.watch(currentChip.notifier).state = 3
                        : null,
                    selected: ref.watch(currentChip) == 3),
                ChoiceChip(
                    label: const Text('football'),
                    onSelected: (selected) => selected
                        ? ref.watch(currentChip.notifier).state = 4
                        : null,
                    selected: ref.watch(currentChip) == 4),
                ChoiceChip(
                    label: const Text('athletics'),
                    onSelected: (selected) => selected
                        ? ref.watch(currentChip.notifier).state = 5
                        : null,
                    selected: ref.watch(currentChip) == 5),
              ],
            ),
          ),
          ...events
              .map((event) => SizedBox(
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(event.name),
                      Text(event.description),
                      Text(event.location),
                      Text(event.startTime.toIso8601String()),
                      Text(event.endTime.toIso8601String()),
                      const Divider()
                    ],
                  )))
              .toList()
        ],
      ),
    );
  }
}

final loadSportsEventProvider = FutureProvider((ref) async {
  return Future.delayed(const Duration(seconds: 1), () {
    return List.generate(
        20,
        (index) => SportsEvent(
            name: 'Event name',
            location: 'Somewhere in Abuja',
            eventType: SportingEventTypes.oneOff,
            description: 'Match between the boys having fun or something',
            startTime: DateTime.now(),
            endTime: DateTime(2022, 9, 7, 20)));
  });
});
