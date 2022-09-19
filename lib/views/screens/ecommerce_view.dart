import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class EcommerceView extends StatelessWidget {
  const EcommerceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Text("Does your gym sell things? "),
          ButtonBar(
            children: [
              ElevatedButton(
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                  child: const Text("NO")),
              ElevatedButton(
                  onPressed: () {
                    GoRouter.of(context).push('/Commerce');
                  },
                  child: const Text("YES")),
            ],
          )
        ],
      ),
    );
  }
}

class CommerceView extends ConsumerWidget {
  CommerceView({Key? key}) : super(key: key);
  final numbers = StateProvider((ref) => 1);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              onChanged: (number) => int.parse(number) > 1
                  ? ref.watch(numbers.notifier).state = int.parse(number)
                  : null,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter Number of products',
              ),
            ),
            const Divider(),
            ...List.generate(ref.watch(numbers), (index) => ProductSelection()),
            const Divider(),
            ElevatedButton(
                onPressed: () {
                  GoRouter.of(context).push('/GymDetails');
                },
                child: const Text("next"))
          ],
        ),
      ),
    );
  }
}

class ProductSelection extends ConsumerWidget {
  ProductSelection({Key? key}) : super(key: key);
  final selectedImages = StateProvider<List<XFile>?>((ref) => null);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const TextField(
          decoration: InputDecoration(hintText: "Enter product name"),
        ),
        const TextField(
          decoration: InputDecoration(hintText: "Enter product description"),
        ),
        const TextField(
          decoration: InputDecoration(hintText: "Enter product quantity"),
        ),
        const TextField(
          decoration: InputDecoration(hintText: "Enter price"),
        ),
        const TextField(
          decoration: InputDecoration(hintText: "Add notes"),
        ),
        ElevatedButton(
            onPressed: () async {
              ref.watch(selectedImages.notifier).state =
                  await ImagePicker().pickMultiImage();
            },
            child: const Text("Select Image(s)")),
        ref.watch(selectedImages) != null
            ? SizedBox(
                width: MediaQuery.of(context).size.width * .9,
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ...ref
                        .watch(selectedImages)!
                        .map((e) => Image.network(e.path))
                        .toList()
                  ],
                ),
              )
            : Container()
      ],
    );
  }
}
