import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:tech_blog/models/fake_data.dart';
import 'package:tech_blog/my_colors.dart';
import 'package:tech_blog/my_string.dart';
import 'package:tech_blog/view/childScrollView.dart';
import 'package:tech_blog/view/profile.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 17;
    List<Widget> mainScreenPage = [
      buildSingleChildScrollView(size, bodyMargin),
      ProfileScreen(),
    ];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Icons.menu,
                color: Colors.black54,
                size: 25,
              ),
              Image.asset(
                "assets/img/logo.png",
                height: size.height / 13.6,
              ),
              const Icon(
                CupertinoIcons.search,
                color: Colors.black54,
                size: 25,
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            Center(
              child: Positioned.fill(
                child: mainScreenPage[selectedPageIndex],
              ),
            ),
            BottomNavigation(
              size: size,
              bodyMargin: bodyMargin,
              changeScreen: (int value) {
                setState(() {
                  selectedPageIndex = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}





class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    Key? key,
    required this.size,
    required this.bodyMargin,
    required this.changeScreen,
  }) : super(key: key);

  final Size size;
  final double bodyMargin;
  final Function(int) changeScreen;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Container(
        height: size.height / 16,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: GradiantColors.bottomNavBackgroand,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
          child: Container(
            height: size.height / 8,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                gradient: LinearGradient(
                  colors: GradiantColors.bottomNav,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () => changeScreen(0),
                  icon: const ImageIcon(
                    AssetImage(
                      "assets/img/home.png",
                    ),
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const ImageIcon(
                    AssetImage(
                      "assets/img/barg.png",
                    ),
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () => changeScreen(1),
                  icon: const ImageIcon(
                    AssetImage(
                      "assets/img/user.png",
                    ),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
