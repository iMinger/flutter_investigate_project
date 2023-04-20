import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliverAppBarAndJumpGlobalKeyWidgetPage extends StatefulWidget {
  @override
  State<SliverAppBarAndJumpGlobalKeyWidgetPage> createState() {
    return _SliverAppBarAndJumpGlobalKeyWidgetPageState();
  }
}

class _SliverAppBarAndJumpGlobalKeyWidgetPageState extends State<SliverAppBarAndJumpGlobalKeyWidgetPage> {
  List<int> menus = [];
  List<Color> colors = [Colors.red, Colors.pink, Colors.blue, Colors.orange, Colors.deepPurpleAccent];
  final random = math.Random();
  bool isExpaned = true;
  ScrollController controller = ScrollController();
  bool shouldAppBarExpanded(double height) {
    return controller.hasClients && controller.offset > (height - kToolbarHeight);
  }

  int scrollToIndex = 0;
  GlobalObjectKey globalObjectKey = GlobalObjectKey(0);

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      if (shouldAppBarExpanded(MediaQuery.of(context).size.width)) {
        if (isExpaned == true) {
          setState(() {
            isExpaned = false;
          });
        }
      } else {
        if (isExpaned == false) {
          setState(() {
            isExpaned = true;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: CustomScrollView(
            controller: controller,
            slivers: [
              SliverAppBar(
                leading: GestureDetector(
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                expandedHeight: 300,
                pinned: true,
                floating: false,
                snap: false,
                title: isExpaned ? null : Text('SliverAppBarWithTitle'),
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: 300,
                        color: Colors.deepPurpleAccent,
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SingleChildScrollView(
                  child: Column(
                    children: _bodyListWidget(context),
                  ),
                ),
              ),
            ],
          )),
          _bottomButton(context),
        ],
      ),
    );

    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: CustomScrollView(
            controller: controller,
            slivers: <Widget>[
              SliverAppBar(
                leading: GestureDetector(
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                expandedHeight: 300,
                pinned: true,
                floating: false,
                snap: false,
                title: isExpaned ? null : Text('SliverAppBarWithTitle'),
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: 300,
                        color: Colors.deepPurpleAccent,
                      ),
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(_bodyListWidget(context)),
              ),
            ],
          )),
          _bottomButton(context),
        ],
      ),
    );
  }

  List<Widget> _bodyListWidget(BuildContext context) {
    List<Widget> lists = [];
    menus.clear();
    for (int i = 0; i < 100; i++) {
      menus.add(i);
    }
    for (int e in menus) {
      lists.add(Container(
        key: e == scrollToIndex ? globalObjectKey : null,
        height: 200,
        width: MediaQuery.of(context).size.width,
        color: colors[e % colors.length],
        child: Text(e.toString()),
      ));
    }
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
}
