import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'HomePage.dart'; // 假设 HomePage.dart 包含了 HomePage、AIPage 和 SettingsPage 类
import 'chat_screen.dart';
import 'UserCenterPage.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  late int currentPage;
  late TabController tabController;

  @override
  void initState() {
    currentPage = 0;
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      setState(() {
        currentPage = tabController.index;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BottomBar(
          fit: StackFit.expand,
          borderRadius: BorderRadius.circular(30), // 圆弧边
          duration: Duration(milliseconds: 500),
          curve: Curves.decelerate,
          showIcon: true,
          width: MediaQuery.of(context).size.width * 0.8,
          barColor: Colors.blue, // 导航栏背景颜色
          start: 2,
          end: 0,
          offset: 10,
          barAlignment: Alignment.bottomCenter,
          iconHeight: 30,
          iconWidth: 30,
          reverse: false,
          hideOnScroll: true,
          scrollOpposite: false,
          onBottomBarHidden: () {},
          onBottomBarShown: () {},
          body: (context, controller) => TabBarView(
            controller: tabController,
            physics: const BouncingScrollPhysics(),
            children: [
              HomePage(),
              ChatScreen(initialMessage: 'Hello! Nice to meet you!'),
              UserCenterPage(),
            ],
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              TabBar(
                controller: tabController,
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                tabs: [
                  Tab(
                    icon: Icon(Icons.home,
                        color: currentPage == 0 ? Colors.white : Colors.grey),
                  ),
                  Tab(
                    icon: Icon(Icons.computer,
                        color: currentPage == 1 ? Colors.white : Colors.grey),
                  ),
                  Tab(
                    icon: Icon(Icons.settings,
                        color: currentPage == 2 ? Colors.white : Colors.grey),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
