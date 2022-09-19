import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meworld/core/models/ecommerce_model.dart';

class EcommerceFormView extends StatelessWidget {
  EcommerceFormView({Key? key, required this.numberOfProducts})
      : super(key: key);
  final int numberOfProducts;
  final List<_CommerceForm> items = [];
  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView(children: [
        ...List.generate(numberOfProducts, (index) {
          var newlyCreated = _CommerceForm();
          items.add(newlyCreated);
          return Padding(
              padding: const EdgeInsets.all(8.0), child: newlyCreated);
        }),
        ElevatedButton(
            onPressed: () {
              for (var model in items) {
                print(model.getObject().toJson());
              }
            },
            child: const Text("continue"))
      ]),
    );
  }
}

class _CommerceForm extends ConsumerWidget {
  _CommerceForm({Key? key}) : super(key: key);
  final TextEditingController name = TextEditingController();
  final TextEditingController quantity = TextEditingController();
  final TextEditingController information = TextEditingController();
  final TextEditingController price = TextEditingController();
  final selectedImages = StateProvider<List<XFile>?>((ref) => null);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * .9,
        height: 500,
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                    controller: name,
                    decoration: InputDecoration(
                        hintText: "Product Name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))))),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                    controller: quantity,
                    decoration: InputDecoration(
                        hintText: "quantity",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))))),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                    controller: price,
                    decoration: InputDecoration(
                        hintText: "price",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))))),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                    controller: information,
                    decoration: InputDecoration(
                        hintText: "more information",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))))),
            ElevatedButton(
                onPressed: () async {
                  ref.watch(selectedImages.notifier).state =
                      await ImagePicker().pickMultiImage();
                },
                child: const Text("select Images")),
            ref.watch(selectedImages) != null
                ? Padding(
                    padding: const EdgeInsets.all(8),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * .9,
                      height: 120,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          ...ref
                              .watch(selectedImages)!
                              .map((e) => SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: Image(image: NetworkImage(e.path)),
                                  ))
                              .toList()
                        ],
                      ),
                    ),
                  )
                : Container(),
            const Divider()
          ],
        ));
  }

  ItemModel getObject() {
    return ItemModel(
        total: int.parse(quantity.text),
        name: name.text,
        price: double.parse(price.text),
        id: 'test id',
        description: information.text,
        imageurls: ['']);
  }
}
