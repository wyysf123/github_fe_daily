import 'package:flutter/material.dart';
import 'global_config.dart';
import 'comm_page.dart';

class BeCategory extends StatefulWidget {
  BeCategory(this.title);
  String title;
  @override
  _BeCategoryState createState() => _BeCategoryState();
}

class _BeCategoryState extends State<BeCategory> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Widget tabbar(){
    double width = MediaQuery.of(context).size.width / 4;
    return new TabBar(
        isScrollable: true,
        labelColor: GlobalConfig.dark == true ? new Color(0xFF63FDD9) : Colors.blue,
        unselectedLabelColor: GlobalConfig.dark == true ? Colors.white : Colors.black,
        labelPadding: EdgeInsets.only(right: 0,left: 0),
        tabs: [
          Container(
            child: Tab(text: 'Java'),
            width: width,
          ),
          Container(
            child: Tab(text: 'Python'),
            width: width,
          ),
          Container(
            child: Tab(text: 'Go'),
            width: width,
          ),
          Container(
            child: Tab(text: 'Rust'),
            width: width,
          )
        ]
    );
  }

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
            bottom: tabbar(),
          ),
          body: TabBarView(
              children: [
                CommonPage('Java'),
                CommonPage('Python'),
                CommonPage('Go'),
                CommonPage('Rust')
              ]
          ),
        )
    );
  }
}
