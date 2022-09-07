import 'package:flutter/material.dart';
import 'package:meworld/views/widgets/textfields.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final List<ExploreItems> _exploreItems = [
    ExploreItems(
        eventName: 'Scammer', picture: Icons.pan_tool_sharp, isVideo: false),
    ExploreItems(
        eventName: 'Abdul', picture: Icons.pan_tool_sharp, isVideo: true),
    ExploreItems(
        eventName: 'Scammer', picture: Icons.pan_tool_sharp, isVideo: true),
    ExploreItems(
        eventName: 'Abdul', picture: Icons.pan_tool_sharp, isVideo: false),
    ExploreItems(
        eventName: 'Scammer', picture: Icons.pan_tool_sharp, isVideo: true),
    ExploreItems(
        eventName: 'Abdul', picture: Icons.pan_tool_sharp, isVideo: false),
    ExploreItems(
        eventName: 'Scammer', picture: Icons.pan_tool_sharp, isVideo: true),
    ExploreItems(
        eventName: 'Abdul', picture: Icons.pan_tool_sharp, isVideo: false),
    ExploreItems(
        eventName: 'Scammer', picture: Icons.pan_tool_sharp, isVideo: false),
  ];
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
            Expanded(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: _exploreItems.length,
                  itemBuilder: (context, index) {
                    return ExploreCard(exploreItems: _exploreItems[index]);
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class ExploreCard extends StatelessWidget {
  const ExploreCard({super.key, required this.exploreItems});
  final ExploreItems exploreItems;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: exploreItems.isVideo ? 150 : 100,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Icon(exploreItems.picture),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(exploreItems.eventName),
            ],
          ),
        ],
      ),
    );
  }
}

class ExploreItems {
  final String eventName;
  final IconData picture;
  final bool isVideo;

  ExploreItems({
    required this.eventName,
    required this.picture,
    required this.isVideo,
  });
}
