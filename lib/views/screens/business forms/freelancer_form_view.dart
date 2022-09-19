import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:group_button/group_button.dart';
import 'package:meworld/views/screens/business%20forms/gym_form_view.dart';

class FreelancerFormView extends ConsumerWidget {
  FreelancerFormView({Key? key}) : super(key: key);
  final selectedService =
      StateProvider((ref) => FreelanceServices.personalshopper);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 1100,
      child: Column(
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width * .9,
              height: 100,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GroupButton<String>(
                      isRadio: false,
                      onSelected: (tx, st, tr) {
                        //
                        ref.watch(selectedService.notifier).state =
                            FreelanceServices.values.firstWhere(
                                (element) => describeEnum(element) == tx);
                      },
                      buttons: [
                        ...FreelanceServices.values
                            .map((e) => (describeEnum(e)))
                      ]))),
          const AvailabilityWidget(),
          const Divider(),
          const Text("Enter pricing "),
          const Divider(),
          SizedBox(
            width: MediaQuery.of(context).size.width * .9,
            height: 500,
            child: Column(
              children: [
                SizedBox(
                    child: Expanded(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: 'Enter service name',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          decoration: InputDecoration(
                              hintText: 'Enter service price',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20))),
                        ),
                      ),
                    ],
                  ),
                )),
                ElevatedButton(
                    onPressed: () {}, child: const Text("Add service"))
              ],
            ),
          ),
          ElevatedButton(
              onPressed: () {
                //
                GoRouter.of(context).go('/MainApp');
              },
              child: const Text("continue"))
        ],
      ),
    );
  }
}

enum FreelanceServices {
  refree,
  personaltrainer,
  personalshopper,
}
