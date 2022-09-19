import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_time_range/flutter_time_range.dart' as tr;
import 'package:go_router/go_router.dart';
import 'package:meworld/core/models/business_account_model.dart';
import 'package:meworld/core/repository/db_helper.dart';
import 'package:meworld/core/services/service_locator.dart';
import 'package:meworld/views/screens/account_sign_up.dart';
import 'package:meworld/views/screens/authentication/signup_view.dart';
import 'package:time_range_picker/time_range_picker.dart';

final _gymAvailabilityMap =
    StateProvider<Map<DaysOfWeek, RangedTime>>((ref) => {});

class AvailabilityWidget extends ConsumerWidget {
  const AvailabilityWidget({Key? key}) : super(key: key);
  final int count = 0;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 400,
      width: MediaQuery.of(context).size.width * .9,
      child: Column(
        children: [
          const Text('select availability'),
          SizedBox(
            height: 100,
            child: ListView(scrollDirection: Axis.horizontal, children: [
              ...DaysOfWeek.values
                  .map((e) => ChoiceChip(
                        onSelected: (selected) {
                          ref.watch(availableDays.notifier).changeState(e);
                        },
                        label: Text(describeEnum(e)),
                        selected: ref.watch(availableDays).contains(e),
                      ))
                  .toList()
            ]),
          ),
          Expanded(
            child: Column(children: [
              ...ref.watch(availableDays).map((e) {
                var startTime = StateProvider((ref) => TimeOfDay.now());
                var endtime = StateProvider((ref) => TimeOfDay.now());
                var range = StateProvider<TimeRange?>((ref) => null);
                return Row(
                  children: [
                    Text(describeEnum(e)),
                    ElevatedButton(
                        onPressed: () async {
                          await showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: SizedBox(
                                    width: 400,
                                    height: 400,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: tr.TimeRangePicker(
                                        initialFromHour: DateTime.now().hour,
                                        initialFromMinutes:
                                            DateTime.now().minute,
                                        initialToHour: DateTime.now().hour,
                                        initialToMinutes: DateTime.now().minute,
                                        onSelect: (start, end) {
                                          ref.watch(startTime.notifier).state =
                                              start;
                                          ref.watch(endtime.notifier).state =
                                              end;
                                          ref.watch(range.notifier).state =
                                              TimeRange(
                                                  startTime:
                                                      ref.watch(startTime),
                                                  endTime: ref.watch(endtime));
                                          Navigator.of(context).pop();
                                        },
                                        onCancel: () =>
                                            Navigator.of(context).pop(),
                                      ),
                                    ),
                                  ),
                                );
                              });

                          String starthr = ref.watch(range)!.startTime.hour < 10
                              ? '0${ref.watch(range)!.startTime.hour}'
                              : "${ref.watch(range)!.startTime.hour}";
                          String endHr = ref.watch(range)!.endTime.hour < 10
                              ? '0${ref.watch(range)!.endTime.hour}'
                              : "${ref.watch(range)!.endTime.hour}";
                          String startmin =
                              ref.watch(range)!.startTime.minute < 10
                                  ? '0${ref.watch(range)!.startTime.minute}'
                                  : "${ref.watch(range)!.startTime.minute}";
                          String endmin = ref.watch(range)!.endTime.minute < 10
                              ? '0${ref.watch(range)!.endTime.minute}'
                              : "${ref.watch(range)!.endTime.minute}";
                          ref.watch(_gymAvailabilityMap)[e] = RangedTime(
                            startTime: DateTime.parse(
                                '2022-02-01 $starthr:$startmin:00'),
                            endTime:
                                DateTime.parse('2022-02-01 $endHr:$endmin:00'),
                          );
                        },
                        child: Text(ref.watch(range) == null
                            ? "Pick Time"
                            : ref.watch(range).toString())),
                  ],
                );
              }).toList()
            ]),
          ),
          ElevatedButton(
              onPressed: () {
                GoRouter.of(context).push('/GymPricing');
              },
              child: const Text("Next"))
        ],
      ),
    );
  }
}

class GymPricingView extends StatelessWidget {
  const GymPricingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          const TextField(
            decoration: InputDecoration(hintText: 'Enter price'),
          ),
          const Divider(),
          const TextField(
            decoration: InputDecoration(hintText: 'Enter price'),
          ),
          const TextField(
            decoration: InputDecoration(hintText: 'Enter price'),
          ),
          const TextField(
            decoration: InputDecoration(hintText: 'Enter price'),
          ),
          const TextField(
            decoration: InputDecoration(hintText: 'Enter price'),
          ),
          const TextField(
            decoration: InputDecoration(hintText: 'Enter price'),
          ),
          const TextField(
            decoration: InputDecoration(hintText: 'Enter price'),
          ),
          const TextField(
            decoration: InputDecoration(hintText: 'Enter price'),
          ),
          ElevatedButton(
              onPressed: () {
                GoRouter.of(context).push('/GymDetails');
              },
              child: const Text("Next"))
        ],
      ),
    );
  }
}

class AvailableDays extends StateNotifier<List<DaysOfWeek>> {
  AvailableDays()
      : super(List.generate(
            DaysOfWeek.values.length, (index) => DaysOfWeek.values[index]));
  changeState(DaysOfWeek day) {
    state.contains(day)
        ? {
            state.remove(day),
            state = [...state]
          }
        : state = [...state, day];
  }
}

final availableDays = StateNotifierProvider<AvailableDays, List<DaysOfWeek>>(
    (ref) => AvailableDays());

class GymDetails extends ConsumerWidget {
  GymDetails({Key? key}) : super(key: key);
  final availablefeatures =
      StateNotifierProvider<AvailableFeatures, List<bool>>(
          (ref) => AvailableFeatures());
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      const Text("Select all that applies to your gym"),
      Expanded(
        child: ListView(scrollDirection: Axis.horizontal, children: [
          ...GymFeatures.values
              .map((feature) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ChoiceChip(
                        onSelected: (selected) => ref
                            .watch(availablefeatures.notifier)
                            .changeState(
                                GymFeatures.values.indexOf(feature), selected),
                        label: Text(describeEnum(feature)),
                        selected: ref.watch(availablefeatures)[
                            GymFeatures.values.indexOf(feature)]),
                  ))
              .toList()
        ]),
      ),
      const TextField(
        decoration: InputDecoration(hintText: "Add notes about your gym"),
      ),
      ElevatedButton(
          onPressed: () async {
            //create gym
            var ava = ref.watch(_gymAvailabilityMap);
            var availability = (List.generate(
                ava.length,
                (index) => BusinessDayAvailabilityModel(
                    day: ava.keys.toList()[index],
                    times: [ava.values.toList()[index]])));
            // return;
            var state = await sl<Database>().createBusinessAccount(
                businessAccount: BusinessAccountModel(
                    type: BusinessTypes.gym,
                    availability: availability,
                    name: 'name',
                    description: 'description',
                    location: const BusinessLocationModel(
                        longitude: 4.4, latitude: 4.4, location: "location"),
                    moreInfo: 'moreInfo',
                    imageurls: List.generate(2, (index) => 'null'),
                    vidoeurls: List.generate(2, (index) => 'null'),
                    businessID: sl<FirebaseAuth>().currentUser!.uid),
                error: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: ListTile(
                    title: Text("Failed to create"),
                  )));
                });

            if (state) GoRouter.of(context).push('/');
          },
          child: const Text("Continue")),
      const SizedBox(height: 40)
    ]));
  }
}

class AvailableFeatures extends StateNotifier<List<bool>> {
  AvailableFeatures() : super(List.filled(7, false));
  changeState(int position, bool value) {
    state[position] = value;
    state = [...state];
  }
}

enum GymFeatures { women, pool, treadmill, weights, boxing, bikes, chairs }
