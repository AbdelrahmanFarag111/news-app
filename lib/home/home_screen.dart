import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projects/home/categories/categories.dart';
import 'package:projects/home/home_side_menu.dart';
import 'package:projects/home/news/news_fragment.dart';
import 'package:projects/home/settings/settings.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/background.png'))),
      child: Scaffold(
        drawer: Drawer(
          child: HomeSideMenu(onSideMenuItemClick),
        ),
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Center(child: Text('CocoNile News App')),
        ),
        body: CurrentWidget,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    CurrentWidget = CategoriesFragment(onCategoryClick);
  }

  late Widget CurrentWidget;

  void onCategoryClick(Category category) {
    CurrentWidget = NewsFragment(category);
    setState(() {});
  }

  void onSideMenuItemClick(int type) {
    if (type == HomeSideMenu.categories) {
      CurrentWidget = CategoriesFragment(onCategoryClick);
    } else if (type == HomeSideMenu.settings) {
      CurrentWidget = SettingsFragment();
    }
    Navigator.pop(context);
    setState(() {});
  }
}