import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:meworld/core/models/business_account_model.dart';
import 'package:meworld/core/repository/db_helper.dart';
import 'package:meworld/core/services/service_locator.dart';
import 'package:meworld/views/screens/account_sign_up.dart';
import 'package:time_range_picker/time_range_picker.dart';

class HealthConsultantForm extends StatelessWidget {
  HealthConsultantForm({Key? key}) : super(key: key);
//availability, pricing
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              hintText: 'Enter cost per hr',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(19))),
        ),
        const Text("Enter availability"),
        ...DaysOfWeek.values
            .map((e) => SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                height: 300,
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    DecoratedBox(
                      decoration: const BoxDecoration(color: Colors.amber),
                      child: Text(describeEnum(e)),
                    ),
                    _AvailabilityWidget()
                  ],
                ))))
            .toList(),
        ElevatedButton(
            onPressed: () {
              //create account
              sl<Database>().createBusinessAccount(
                  //TODO
                  businessAccount: BusinessAccountModel.fromJson({}),
                  error: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: ListTile(
                      title: Text(
                          "Failed to create account, please try again later"),
                    )));
                  });
              GoRouter.of(context).replace('/MainApp');
            },
            child: const Text("Finish Sign Up"))
      ],
    );
  }
}

class _AvailabilityWidget extends ConsumerWidget {
  _AvailabilityWidget({Key? key}) : super(key: key);
  final timesSelected = StateNotifierProvider<_SelectedTimes, List<RangedTime>>(
      (ref) => _SelectedTimes());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var list = ref.watch(timesSelected);
    return SingleChildScrollView(
      child: Column(
        children: [
          ...list
              .map((e) => ListTile(
                    title: Text(
                        '${e.startTime.toLocal().toIso8601String()} - ${e.endTime.toLocal().toIso8601String()}'),
                    trailing: IconButton(
                        onPressed: () {
                          ref
                              .watch(timesSelected.notifier)
                              .removeRange(list.indexOf(e));
                        },
                        icon: const Icon(Icons.remove)),
                  ))
              .toList(),
          ElevatedButton(
              onPressed: () async {
                TimeRange result = await showTimeRangePicker(
                  context: context,
                );

                var rangedTime = RangedTime(
                    startTime:
                        DateTime.tryParse(result.startTime.format(context))!,
                    endTime:
                        DateTime.tryParse(result.startTime.format(context))!);

                ref.watch(timesSelected.notifier).addRange(rangedTime);
              },
              child: const Text("Add time"))
        ],
      ),
    );
  }
}

class _SelectedTimes extends StateNotifier<List<RangedTime>> {
  _SelectedTimes() : super([]);

  addRange(RangedTime newTime) {
    state = [...state, newTime];
  }

  removeRange(int index) {
    state.removeAt(index);
    state = [...state];
  }
}
