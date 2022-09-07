import 'package:flutter/material.dart';
import 'package:meworld/views/widgets/textfields.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final List _exploreItems = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.withOpacity(0.4),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 24,
          horizontal: 16,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            const MeWordTextWidget(
              controller: null,
              hintText: 'Search for anything',
              textInputAction: TextInputAction.search,
              textInputType: TextInputType.text,
              suffixIcon: Icon(Icons.search),
            ),
            const SizedBox(
              height: 40,
            ),
            GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return const SizedBox();
                })
          ],
        ),
      ),
    );
  }
}

class ExploreCard extends StatelessWidget {
  const ExploreCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ExploreItems {
  // final String eventName;
}
