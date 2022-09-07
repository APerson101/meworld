import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:meworld/views/screens/main_app/artisans/category_details.dart';
import 'package:meworld/views/widgets/textfields.dart';

class ArtisanDetails extends StatefulWidget {
  const ArtisanDetails({super.key, required this.artisans});
  final Artisans artisans;

  @override
  State<ArtisanDetails> createState() => _ArtisanDetailsState();
}

class _ArtisanDetailsState extends State<ArtisanDetails> {
  List<ArtisanReview> reviews = [
    ArtisanReview('scam', 3, 'description', const Icon(Icons.thumb_up)),
    ArtisanReview('mmer', 4, 'description', const Icon(Icons.thumb_up)),
    ArtisanReview('wash', 2, 'description', const Icon(Icons.thumb_up)),
    ArtisanReview('meow', 1, 'description', const Icon(Icons.thumb_down)),
    ArtisanReview('publicly', 4, 'description', const Icon(Icons.thumb_up)),
    ArtisanReview('shame', 1, 'description', const Icon(Icons.thumb_down)),
  ];
  double _expanded = 0;
  int _pageState = 0;
  DateTime? dateTime;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    switch (_pageState) {
      case 0:
        _expanded = size.height;
        break;
      case 1:
        _expanded = 20;
        break;
      default:
    }
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ElevatedButton(
            onPressed: (() {
              setState(() {
                _pageState = 1;
              });
            }),
            child: Text('Hire ${widget.artisans.name}'),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: widget.artisans.picture,
                    title: Text(widget.artisans.name),
                    subtitle: Text(widget.artisans.age),
                  ),
                  Text(
                    widget.artisans.description,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Reviews:'),
                      Text('View All'),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      ...reviews.map(
                        (e) => Padding(
                          padding: const EdgeInsets.only(bottom: 14),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            elevation: 10,
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              leading: e.picture,
                              title: Text(e.name),
                              subtitle: Text(e.description),
                              trailing: RatingBar(
                                maxRating: 5,
                                initialRating: e.rating,
                                onRatingUpdate: (double value) {},
                                itemSize: 11,
                                glowColor: Colors.amber,
                                unratedColor: Colors.grey,
                                direction: Axis.horizontal,
                                ignoreGestures: true,
                                ratingWidget: RatingWidget(
                                  full: const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  empty: const Icon(Icons.star),
                                  half: const Icon(Icons.star),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            AnimatedContainer(
              color: Colors.amber,
              duration: const Duration(seconds: 1),
              transform: Matrix4.translationValues(0, _expanded, 0),
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const MeWordTextFormField(
                    label: 'Duration',
                    textfield: MeWordTextWidget(
                      controller: null,
                      hintText: 'Duration',
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MeWordTextFormField(
                      label: 'Date',
                      textfield: GestureDetector(
                          onTap: () => showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: (DateTime(DateTime.now().year,
                                      DateTime.now().month, 30)))
                              .then((value) => value = dateTime),
                          child: Text(dateTime.toString()))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ArtisanReview {
  final String name;
  final double rating;
  final String description;
  final Widget picture;

  ArtisanReview(this.name, this.rating, this.description, this.picture);
}
