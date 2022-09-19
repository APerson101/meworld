import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PharmacyFormView extends StatelessWidget {
  PharmacyFormView({Key? key}) : super(key: key);
  final TextEditingController licenseNumberController = TextEditingController();
  final TextEditingController storeCategoryNumberController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //e commerce and services provided, license also

        TextField(
            controller: licenseNumberController,
            decoration: InputDecoration(
                hintText: "Enter license number",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ))),

        TextField(
            controller: storeCategoryNumberController,
            decoration: InputDecoration(
                hintText: "Enter category of items in store",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ))),
        ElevatedButton(
            onPressed: () {
              GoRouter.of(context).push('/StoreForm',
                  extra: int.parse(storeCategoryNumberController.text));
            },
            child: const Text("Next"))
      ],
    );
  }
}
