import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ArtisanCategories extends StatelessWidget {
  const ArtisanCategories({super.key});

  static List ff = [
    'Electricians',
    'Plumbers',
    'Carpenters',
    'Cleaners',
    'Laundry',
    'Security',
    'Mechanics',
    'Hair Stylists',
    'Make-up Artists',
    'Event Planners',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Categories'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 12,
          ),
          child: Column(
            children: [
              ...List.generate(
                10,
                (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListTile(
                      onTap: () => GoRouter.of(context)
                          .push('/artisanCategory/categoryDetails'),
                      title: Text(ff[index]),
                      trailing: const Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ));
  }
}
