import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ArtisanCategoryDetails extends StatelessWidget {
  const ArtisanCategoryDetails({super.key});
  static List<Artisans> ff = [
    Artisans(
      name: 'Abdul Scammer',
      age: '12',
      available: true,
      gender: 'Male',
      rating: 3,
      description: 'Omo, this guy will scam you,\nif you are not careful...',
      picture: const Icon(Icons.person),
    ),
    Artisans(
      name: 'Abdul Scammer Boss',
      age: '21',
      available: false,
      gender: 'Male',
      rating: 3,
      description: 'Omo, this guy will scam you,\nif you are not careful...',
      picture: const Icon(Icons.person),
    ),
    Artisans(
      name: 'Abdul Scammer',
      age: '30',
      available: true,
      gender: 'Male',
      description: 'Omo, this guy will scam you,\nif you are not careful...',
      rating: 3,
      picture: const Icon(Icons.person),
    ),
    Artisans(
      name: 'Abdul Scammer',
      age: '12',
      available: true,
      gender: 'Male',
      description: 'Omo, this guy will scam you,\nif you are not careful...',
      rating: 3,
      picture: const Icon(Icons.person),
    ),
    Artisans(
      name: 'Abdul Scammer',
      age: '12',
      available: true,
      gender: 'Male',
      description: 'Omo, this guy will scam you,\nif you are not careful...',
      rating: 3,
      picture: const Icon(Icons.person),
    ),
    Artisans(
      name: 'Abdul Scammer',
      age: '12',
      available: true,
      gender: 'Male',
      description: 'Omo, this guy will scam you,\nif you are not careful...',
      rating: 3,
      picture: const Icon(Icons.person),
    ),
    Artisans(
      name: 'Abdul Scammer',
      age: '12',
      available: true,
      gender: 'Male',
      description: 'Omo, this guy will scam you,\nif you are not careful...',
      rating: 3,
      picture: const Icon(Icons.person),
    ),
    Artisans(
      name: 'Abdul Scammer',
      age: '12',
      available: true,
      gender: 'Male',
      description: 'Omo, this guy will scam you,\nif you are not careful...',
      rating: 3,
      picture: const Icon(Icons.person),
    ),
    Artisans(
      name: 'Abdul Scammer',
      age: '12',
      available: true,
      gender: 'Male',
      description: 'Omo, this guy will scam you,\nif you are not careful...',
      rating: 3,
      picture: const Icon(Icons.person),
    ),
    Artisans(
      name: 'Abdul Scammer',
      age: '12',
      available: true,
      gender: 'Male',
      description: 'Omo, this guy will scam you,\nif you are not careful...',
      rating: 3,
      picture: const Icon(Icons.person),
    )
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
                  padding: const EdgeInsets.all(4.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    shadowColor: Colors.yellow,
                    elevation: 10,
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      onTap: () => GoRouter.of(context).push(
                        '/artisanCategory/categoryDetails/artisanDetails',
                        extra: ff[index],
                      ),
                      tileColor:
                          ff[index].available ? Colors.blue : Colors.grey,
                      leading: ff[index].picture,
                      title: Text(ff[index].name),
                      subtitle: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            Text('${ff[index].gender} '),
                            RatingBar(
                              maxRating: 5,
                              initialRating: ff[index].rating.toDouble(),
                              onRatingUpdate: (double value) {},
                              itemSize: 11,
                              ratingWidget: RatingWidget(
                                full: const Icon(Icons.star),
                                empty: const Icon(Icons.star),
                                half: const Icon(Icons.star),
                              ),
                            )
                          ],
                        ),
                      ),
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

class Artisans {
  final String name;
  final String age;
  final bool available;
  final String gender;
  final int rating;
  final Widget picture;
  final String description;

  Artisans({
    required this.name,
    required this.age,
    required this.available,
    required this.gender,
    required this.rating,
    required this.picture,
    required this.description,
  });
}
