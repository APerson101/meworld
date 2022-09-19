import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meworld/core/models/business_account_model.dart';
import 'package:meworld/core/repository/db_helper.dart';
import 'package:meworld/core/services/service_locator.dart';
import 'package:meworld/views/screens/account_sign_up.dart';
import 'package:meworld/views/screens/authentication/signup_view.dart';

import 'gym_form_view.dart';

class SportsCenterView extends ConsumerWidget {
  const SportsCenterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
        child: SingleChildScrollView(
      child: Column(children: [
        const AvailabilityWidget(),
        FacilitiesPricingWidget(),
        ElevatedButton(
            onPressed: () async {
              await sl<Database>().createBusinessAccount(
                  businessAccount: BusinessAccountModel(
                      type: BusinessTypes.sportscenter,
                      availability: [
                        BusinessDayAvailabilityModel(
                            day: DaysOfWeek.monday,
                            times: [
                              RangedTime(
                                  startTime: DateTime.now(),
                                  endTime: DateTime.now())
                            ]),
                        BusinessDayAvailabilityModel(
                            day: DaysOfWeek.monday,
                            times: [
                              RangedTime(
                                  startTime: DateTime.now(),
                                  endTime: DateTime.now())
                            ])
                      ],
                      name: "name",
                      description: 'description',
                      location: const BusinessLocationModel(
                          longitude: 343,
                          latitude: 43243,
                          location: 'location'),
                      moreInfo: 'moreInfo',
                      imageurls: ['re'],
                      vidoeurls: ['fsd'],
                      businessID: sl<FirebaseAuth>().currentUser!.uid),
                  error: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: ListTile(
                      title: Text("Unable to create"),
                    )));
                  });
            },
            child: const Text("Create Sports business")),
        const SizedBox(
          height: 40,
        )
      ]),
    ));
  }
}

class FacilitiesPricingWidget extends ConsumerWidget {
  FacilitiesPricingWidget({Key? key}) : super(key: key);
  final _pricings =
      StateProvider<Map<SportsFacilities, SportsPaymentOptions>>((ref) => {});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * .9,
      child: Column(
        children: [
          SizedBox(
            height: 100,
            child: ListView(
                scrollDirection: Axis.horizontal,
                children: SportsFacilities.values.map((e) {
                  return ChoiceChip(
                      onSelected: (selected) => {
                            ref
                                .watch(availableFacilities.notifier)
                                .changeState(e),
                            ref.watch(_pricings).containsKey(e)
                                ? ref.watch(_pricings.notifier).state.remove(e)
                                : ref
                                    .watch(_pricings.notifier)
                                    .state
                                    .addAll({e: SportsPaymentOptions.perHr})
                          },
                      label: Text(describeEnum(e)),
                      selected: ref.watch(availableFacilities).contains(e));
                }).toList()),
          ),
          ...ref.watch(availableFacilities).map((facility) {
            var pricing = StateProvider((ref) => SportsPaymentOptions.perHr);
            debugPrint(describeEnum(ref.watch(pricing)));
            return SizedBox(
              height: 100,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(children: [
                  Text(describeEnum(facility)),
                  SizedBox(
                    height: 50,
                    width: 300,
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          suffix: DropdownButton<SportsPaymentOptions>(
                              value: ref.watch(_pricings)[facility],
                              items: SportsPaymentOptions.values
                                  .map((e) => DropdownMenuItem(
                                        value: e,
                                        child: Text(describeEnum(e)),
                                      ))
                                  .toList(),
                              onChanged: (newSelectedItem) => {
                                    ref
                                        .watch(_pricings.notifier)
                                        .state[facility] = newSelectedItem!,
                                    debugPrint(ref
                                        .watch(_pricings)[facility]
                                        .toString())
                                  }),
                          hintText: "Enter Booking price"),
                    ),
                  )
                ]),
              ),
            );
          }).toList()
        ],
      ),
    );
  }
}

class AvailableFacilities extends StateNotifier<List<SportsFacilities>> {
  AvailableFacilities() : super([]);
  changeState(SportsFacilities day) {
    state.contains(day)
        ? {
            state.remove(day),
            state = [...state]
          }
        : state = [...state, day];
  }
}

final availableFacilities =
    StateNotifierProvider<AvailableFacilities, List<SportsFacilities>>(
        (ref) => AvailableFacilities());

enum SportsFacilities {
  indoorfootball,
  basketball,
  multipurpose,
  outdoorfootball,
  lawntennis,
  tabletennis,
  squash,
  swimmingpool,
  cricket,
  rugby,
  multipurposefield
}

enum SportsPaymentOptions { perHr, perDay, perSession }
