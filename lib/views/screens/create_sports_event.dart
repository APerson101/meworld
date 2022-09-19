import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_time_range/flutter_time_range.dart';
import 'package:go_router/go_router.dart';
import 'package:group_button/group_button.dart';

class CreateSportsEventView extends ConsumerWidget {
  CreateSportsEventView({Key? key}) : super(key: key);
  final TextEditingController nameController = TextEditingController();
  final selectedType = StateProvider((ref) => _eventType.single);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Create new sports event"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //name, location, date, time, payment
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      hintText: "Enter name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(19))),
                ),
              ),

              GroupButton<String>(
                  isRadio: false,
                  onSelected: (st, indx, val) {
                    ref.watch(selectedType.notifier).state = _eventType.values
                        .firstWhere((element) => describeEnum(element) == st);
                  },
                  buttons: [..._eventType.values.map((e) => describeEnum(e))]),
              _CalenderSelectorView(type: selectedType),
              ElevatedButton(
                  onPressed: () {
                    GoRouter.of(context).push('/eventLocations');
                  },
                  child: const Text("View available locations"))
            ],
          ),
        ));
  }
}

enum _eventType { single, multiday }

class _CalenderSelectorView extends ConsumerWidget {
  _CalenderSelectorView({Key? key, required this.type}) : super(key: key);
  StateProvider<_eventType> type;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var eventType = ref.watch(type);
    switch (eventType) {
      case _eventType.multiday:
        return ButtonBar(
          children: [
            ElevatedButton(
                onPressed: () async {
                  var range = await showDateRangePicker(
                      context: context,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(
                          DateTime.now().year, DateTime.now().month + 7));
                },
                child: const Text("Select start and end date")),
            //time
            ElevatedButton(
                onPressed: () async {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: TimeRangePicker(
                            initialFromHour: DateTime.now().hour,
                            initialFromMinutes: DateTime.now().minute,
                            initialToHour: DateTime.now().hour,
                            initialToMinutes: DateTime.now().minute,
                          ),
                        );
                      });
                },
                child: const Text("Select start and end time"))
          ],
        );
      case _eventType.single:
        return ButtonBar(
          children: [
            ElevatedButton(
                onPressed: () async {
                  var date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(
                          DateTime.now().year, DateTime.now().month + 7));
                },
                child: const Text("Select date and time")),
            //time
            ElevatedButton(
                onPressed: () async {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: TimeRangePicker(
                            initialFromHour: DateTime.now().hour,
                            initialFromMinutes: DateTime.now().minute,
                            initialToHour: DateTime.now().hour,
                            initialToMinutes: DateTime.now().minute,
                          ),
                        );
                      });
                },
                child: const Text("Select start and end time"))
          ],
        );
      default:
        return Container();
    }
  }
}
