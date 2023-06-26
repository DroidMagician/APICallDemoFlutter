
import 'package:apicalldemo/main.dart';
import 'package:flutter/material.dart';

import '../navigationDrawer/FirstFragment.dart';
import '../navigationDrawer/SecondFragment.dart';
import '../navigationDrawer/ThirdFragment.dart';

class MyBottomNavigation extends StatefulWidget {
  const MyBottomNavigation({Key? key}) : super(key: key);

  @override
  State<MyBottomNavigation> createState() => _MyBottomNavigationState();
}

class _MyBottomNavigationState extends State<MyBottomNavigation> {
  List<String> titleList = ["Favorite", "Music", "Places"];
  int _currentIndex = 0;
  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new FirstFragment();
      case 1:
        return new SecondFragment();
      case 2:
        return new ThirdFragment();

      default:
        return new Text("Error");
    }
  }
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(child:
    Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(titleList[_currentIndex]),
        actions: [
          GestureDetector(
              onTap: (){
                AppModel appModel = AppModel();
                appModel.changeDirection();
              },
              child: Center(child: Text("Change Language")))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        backgroundColor: colorScheme.surface,
        selectedItemColor: colorScheme.onSurface,
        unselectedItemColor: Colors.black12,
        selectedLabelStyle: textTheme.caption,
        unselectedLabelStyle: textTheme.caption,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: 'Favorites',
            icon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            label: 'Music',
            icon: Icon(Icons.music_note),
          ),
          BottomNavigationBarItem(
            label: 'Places',
            icon: Icon(Icons.location_on),
          ),
        ],
      ),
      body: _getDrawerItemWidget(_currentIndex),
    ));
  }
}
