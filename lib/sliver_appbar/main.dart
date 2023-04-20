import 'package:all_investigate_demo/sliver_appbar/sliver_app_bar_and_jump_global_key_widget_page.dart';
import 'package:all_investigate_demo/sliver_appbar/sliver_app_bar_classic_page.dart';
import 'package:all_investigate_demo/sliver_appbar/sliver_app_bar_classic_with_title_page.dart';
import 'package:flutter/material.dart';

class SliverAppBarPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SliverAppBarPage();
  }
}

class _SliverAppBarPage extends State<SliverAppBarPage> {
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
        title: const Text('SliverAppBar senario'),
      ),
      body: ListView(
        children: [
          _buildSliverAppBarPage(context),
          _buildSliverAppBarWithTitlePage(context),
          _buildSliverAppBarAndJumpGloablKeyWidget(context),
        ],
      ),
    );
  }

  Widget _buildSliverAppBarPage(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return SliverAppBarClassicPage();
            }));
          },
          child: Container(
            height: 50,
            color: Colors.blue,
            alignment: Alignment.centerLeft,
            child: const Text('SliverAppBar classic scenario'),
          ),
        ),
        Container(
          height: 1,
          color: Colors.grey,
        ),
      ],
    );
  }

  Widget _buildSliverAppBarWithTitlePage(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return SliverAppBarClassicWithTitlePage();
            }));
          },
          child: Container(
            height: 50,
            color: Colors.blue,
            alignment: Alignment.centerLeft,
            child: const Text('SliverAppBar classic with Title'),
          ),
        ),
        Container(
          height: 1,
          color: Colors.grey,
        ),
      ],
    );
  }

  Widget _buildSliverAppBarAndJumpGloablKeyWidget(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return SliverAppBarAndJumpGlobalKeyWidgetPage();
            }));
          },
          child: Container(
            height: 50,
            color: Colors.blue,
            alignment: Alignment.centerLeft,
            child: const Text('SliverAppBar class animation and jump to globalkey widget'),
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
