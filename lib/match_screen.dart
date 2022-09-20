import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:tinder_swipe_sample/utils/margins/x_margin.dart';
import 'package:tinder_swipe_sample/utils/margins/y_margin.dart';

import 'models/match_model.dart';
import 'widgets/svg_button.dart';

class MatchScreen extends StatefulWidget {
  const MatchScreen({super.key});

  @override
  State<MatchScreen> createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen> {
  /// Creating a list of SwipeItem objects.
  final List<SwipeItem> _swipeItems = <SwipeItem>[];

  /// A notifier that will notify the widget when the value changes.
  late ValueNotifier<MatchEngine?> _matchEngineNotifier;

  @override
  void initState() {
    super.initState();
    _initializeMatchEngine();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 26.0,
          ),
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 42,
                ),
              ),
              const YMargin(51),
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: _matchEngineNotifier,
                  builder: (_, matchEngine, __) {
                    return SwipeCards(
                      matchEngine: matchEngine!,
                      itemBuilder: (BuildContext context, int index) {
                        return Stack(
                          children: [
                            Container(
                              width: size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                color: Colors.black,
                                image: DecorationImage(
                                  image: CachedNetworkImageProvider(
                                    MatchModel.matches[index].imageUrl!,
                                  ),
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(0.4),
                                    BlendMode.darken,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(22.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    '${MatchModel.matches[index].name}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 28,
                                    ),
                                  ),
                                  const YMargin(3),
                                  Text(
                                    'Lives in ${MatchModel.matches[index].country}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18,
                                    ),
                                  ),
                                  const YMargin(3),
                                  Text(
                                    '${MatchModel.matches[index].milesAway} miles away',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                      onStackFinished: () {
                        _matchEngineNotifier.value = MatchEngine(
                          swipeItems: _swipeItems,
                        );
                      },
                      itemChanged: (SwipeItem item, int index) {},
                      upSwipeAllowed: true,
                      fillSpace: true,
                    );
                  },
                ),
              ),
              const YMargin(29),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgButton(
                    onPressed: () {
                      _matchEngineNotifier.value!.currentItem?.like();
                    },
                    svgPath: 'assets/svgs/match.svg',
                    size: 62,
                  ),
                  const XMargin(40),
                  SvgButton(
                    onPressed: () {},
                    svgPath: 'assets/svgs/star.svg',
                    size: 42,
                  ),
                  const XMargin(40),
                  SvgButton(
                    onPressed: () {
                      _matchEngineNotifier.value!.currentItem?.like();
                    },
                    svgPath: 'assets/svgs/not_match.svg',
                    size: 62,
                  ),
                ],
              ),
              const YMargin(20),
            ],
          ),
        ),
      ),
    );
  }

  void _initializeMatchEngine() {
    /// Creating a list of SwipeItem objects.
    for (int i = 0; i < MatchModel.matches.length; i++) {
      _swipeItems.add(
        SwipeItem(
          content: MatchModel.matches[i],
        ),
      );
    }

    _matchEngineNotifier = ValueNotifier(
      MatchEngine(
        swipeItems: _swipeItems,
      ),
    );
  }
}
