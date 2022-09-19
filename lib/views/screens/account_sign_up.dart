import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:group_button/group_button.dart';
import 'package:meworld/core/models/user_account_model.dart';
import 'package:meworld/core/repository/db_helper.dart';
import 'package:meworld/core/services/service_locator.dart';
import 'package:meworld/views/screens/authentication/signup_view.dart';
import 'package:meworld/views/screens/business%20forms/freelancer_form_view.dart';
import 'package:meworld/views/screens/business%20forms/gym_form_view.dart';
import 'package:meworld/views/screens/business%20forms/pharmacy_form_view.dart';
import 'package:meworld/views/screens/business%20forms/sports_center_form_view.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'business forms/health_consultant_view.dart';

class AccountSignUp extends ConsumerWidget {
  AccountSignUp({Key? key}) : super(key: key);
  final selectedType = StateProvider((ref) => 0);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Account"),
      ),
      body: Column(
        children: [
          const Text("Sign up as: "),
          ToggleSwitch(
            initialLabelIndex: ref.watch(selectedType),
            totalSwitches: 2,
            labels: const ['Business', 'User'],
            onToggle: (selected) {
              selected != null
                  ? ref.watch(selectedType) != selected
                      ? ref.watch(selectedType.notifier).state = selected
                      : null
                  : null;
            },
          ),
          Expanded(
            child: ref.watch(selectedType) == 0
                ? UserSignUpView()
                : _BusinessSignUpView(),
          )
        ],
      ),
    );
  }
}

class UserSignUpView extends StatelessWidget {
  UserSignUpView({Key? key}) : super(key: key);
  final List<int> userInterets = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Text("Select your interests"),
        GroupButton(
          isRadio: false,
          onSelected: (value, index, selected) {
            log("user selected $index has value of $selected");
            userInterets.contains(index)
                ? userInterets.remove(index)
                : userInterets.add(index);
          },
          buttons: [
            ...UserInterests.values.map((e) => describeEnum(e)).toList()
          ],
        ),
        ElevatedButton(
            onPressed: () async {
              var user = sl<FirebaseAuth>().currentUser;
              assert(user != null);
              var status = await sl<Database>().createUserAccount(
                  account: UserAccountModel(
                      userID: user!.uid,
                      interests: List.generate(
                          userInterets.length,
                          (index) =>
                              UserInterests.values[userInterets[index]])),
                  error: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: ListTile(
                      title: Text("Unable to create, try again later"),
                    )));
                  });
              if (status) GoRouter.of(context).go('/');
            },
            child: const Text("Skip for now"))
      ],
    );
  }
}

class _BusinessSignUpView extends ConsumerWidget {
  _BusinessSignUpView({Key? key}) : super(key: key);
  final selectedBusiness = StateProvider((ref) => BusinessTypes.gym);
  Widget view = const AvailabilityWidget();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //TODO: change to be gyms and consultants as oppposed to gym only
    return SingleChildScrollView(
      child: Column(
        children: [
          DropdownButton<BusinessTypes>(
              value: ref.watch(selectedBusiness),
              items: BusinessTypes.values
                  .map((e) => DropdownMenuItem<BusinessTypes>(
                      value: e, child: Text(describeEnum(e))))
                  .toList(),
              onChanged: (newValue) {
                newValue != null
                    ? ref.watch(selectedBusiness.notifier).state = newValue
                    : null;
                switch (newValue) {
                  case BusinessTypes.gym:
                    view = const AvailabilityWidget();
                    break;
                  case BusinessTypes.consultant:
                    view = HealthConsultantForm();
                    break;
                  case BusinessTypes.sportscenter:
                    view = const SportsCenterView();
                    break;
                  case BusinessTypes.pharmacy:
                    view = PharmacyFormView();
                    break;

                  case BusinessTypes.freelancer:
                    view = FreelancerFormView();
                    break;
                  default:
                    view = const AvailabilityWidget();
                }
              }),
          view,
        ],
      ),
    );
  }
}

enum UserInterests { sports, health, gym, shopping }

enum DaysOfWeek {
  sunday,
  monday,
  tuesday,
  wednesday,
  thurday,
  friday,
  saturday
}
