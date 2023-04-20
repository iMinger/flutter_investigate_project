import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// note:  Scrollable.ensureVisible(GlobalObjectKey(scrollToIndex).currentContext!), this method is only could used in
// small listView, it means all widgets show in
// because the item in list out of screen will be destoryed, so need use SingleChildScrollView to wrap all item.
class ScrollToIndexPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ScrollToIndexPageState();
  }
}

class _ScrollToIndexPageState extends State<ScrollToIndexPage> {
  List<int> menus = [];
  List<Color> colors = [Colors.red, Colors.pink, Colors.blue, Colors.orange, Colors.deepPurpleAccent];
  int scrollToIndex = 4;
  GlobalObjectKey globalObjectKey = GlobalObjectKey(4);
  bool enableDrag = true;
  final random = math.Random();
  @override
  Widget build(BuildContext context) {
    menus.clear();
    for (int i = 0; i < 100; i++) {
      menus.add(i);
    }
    return Scaffold(
      appBar: AppBar(
          title: const Text('ScrollToIndex Test'),
          leading: GestureDetector(
            child: const Icon(
              Icons.arrow_back_ios,
            ),
            onTap: () => Navigator.of(context).pop(),
          )),
      body: _bodyWidget(),
    );
  }

  List<Widget> _bodyListSliver(BuildContext context) {
    List<Widget> lists = [];

    for (int e in menus) {
      lists.add(Container(
        key: e == scrollToIndex ? globalObjectKey : null,
        height: (200 * random.nextDouble()),
        width: MediaQuery.of(context).size.width,
        color: colors[e % colors.length],
        child: Text(e.toString()),
      ));
    }
    lists.add(_bottomButton(context));
    return lists;
  }

  Widget _bottomButton(
    BuildContext context,
  ) {
    // SliverToBoxAdapter
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      color: Colors.blue,
      height: 50,
      child: GestureDetector(
        child: const Text('scroll to 4 index'),
        onTap: () {
          // jump to index 4
          print('scrollToIndex == $scrollToIndex');
          if (globalObjectKey.currentContext != null) {
            Scrollable.ensureVisible(globalObjectKey.currentContext!, duration: Duration(milliseconds: 250), curve: Curves.fastOutSlowIn);
          }
        },
      ),
    );
  }

  Widget _bodyWidget() {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: SingleChildScrollView(
                  child: Column(
                    children: _bodyListSliver(context),
                  ),
                ),
              ),
            ],
          )),
          _bottomButton(context),
        ],
      ),
    );
  }
}

// SliverToBoxAdapter(child: _bottomButton(context))

// solution1: this is OK
// SingleChildScrollView(
//         child: Column(
//           children: _bodyListSliver(context),
//         ),
//       ),
//     )
