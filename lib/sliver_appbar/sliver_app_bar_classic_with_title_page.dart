import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliverAppBarClassicWithTitlePage extends StatefulWidget {
  @override
  State<SliverAppBarClassicWithTitlePage> createState() {
    return _SliverAppBarClassicWithTitlePageState();
  }
}

class _SliverAppBarClassicWithTitlePageState extends State<SliverAppBarClassicWithTitlePage> {
  List<int> menus = [];
  List<Color> colors = [Colors.red, Colors.pink, Colors.blue, Colors.orange, Colors.deepPurpleAccent];
  final random = math.Random();
  bool isExpaned = true;
  ScrollController controller = ScrollController();
  bool shouldAppBarExpanded(double height) {
    return controller.hasClients && controller.offset > (height - kToolbarHeight);
  }

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
      body: CustomScrollView(
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
        height: (200 * random.nextDouble()),
        width: MediaQuery.of(context).size.width,
        color: colors[e % colors.length],
        child: Text(e.toString()),
      ));
    }
    return lists;
  }
}
