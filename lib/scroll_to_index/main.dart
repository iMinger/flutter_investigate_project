import 'package:all_investigate_demo/scroll_to_index/scroll_to_global_key_page.dart';
import 'package:all_investigate_demo/scroll_to_index/scroll_to_index_library_page.dart';
import 'package:all_investigate_demo/scroll_to_index/scrollable_positiond_list_page.dart';
import 'package:flutter/material.dart';

class ScrollToIndexMain extends StatefulWidget {
  const ScrollToIndexMain({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ScrollToIndexMainState();
  }
}

class _ScrollToIndexMainState extends State<ScrollToIndexMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text('scroll_to_index'),
      ),
      body: ListView(
        children: [
          _buildScrollIndexWidget(context),
          _buildScrollablePositionedListPage(context),
          _buildScrollIndex3rdWidget(context),
        ],
      ),
    );
  }

  Widget _buildScrollIndexWidget(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return ScrollToGlabalKeyPage();
            }));
          },
          child: Container(
            height: 50,
            color: Colors.blue,
            alignment: Alignment.centerLeft,
            child: const Text('Jump to scroll to gloablkey widget'),
          ),
        ),
        Container(
          height: 1,
          color: Colors.grey,
        ),
      ],
    );
  }

  Widget _buildScrollablePositionedListPage(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return const ScrollablePositionedListPage();
            }));
          },
          child: Container(
            height: 50,
            color: Colors.blue,
            alignment: Alignment.centerLeft,
            child: const Text('Jump to scrollable positioned list page'),
          ),
        ),
        Container(
          height: 1,
          color: Colors.grey,
        ),
      ],
    );
  }

  Widget _buildScrollIndex3rdWidget(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return ScrollToIndexLibraryPage();
            }));
          },
          child: Container(
            height: 50,
            color: Colors.blue,
            alignment: Alignment.centerLeft,
            child: const Text('Jump to scroll to index page'),
          ),
        ),
        Container(
          height: 1,
          color: Colors.grey,
        ),
      ],
    );
  }
}
