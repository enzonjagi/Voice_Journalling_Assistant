import 'package:flutter/material.dart';
import 'package:voice_journalling/walkthrough/static.dart';
import 'package:voice_journalling/walkthrough/walkthrough_item.dart';

class WalkthroughScreen extends StatefulWidget {
  const WalkthroughScreen({Key? key}) : super(key: key);

  @override
  State<WalkthroughScreen> createState() => _WalkthroughScreenState();
}

class _WalkthroughScreenState extends State<WalkthroughScreen> {
  @override
  Widget build(BuildContext context) {
    PageController _controller = PageController(initialPage: 0);

    return Scaffold(
        body: PageView.builder(
            physics: new NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            controller: _controller,
            itemCount: WALKTHROUGH_ITEMS.length,
            itemBuilder: (BuildContext context, int index) {
              return WalkthroughItem(
                  controller: _controller,
                  item: WALKTHROUGH_ITEMS[index],
                  index: index,
                  totalItem: WALKTHROUGH_ITEMS.length);
            }));
  }
}
