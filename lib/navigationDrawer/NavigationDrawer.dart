import 'package:apicalldemo/navigationDrawer/DrawerItem.dart';
import 'package:apicalldemo/navigationDrawer/FirstFragment.dart';
import 'package:apicalldemo/navigationDrawer/SecondFragment.dart';
import 'package:apicalldemo/navigationDrawer/ThirdFragment.dart';
import 'package:flutter/material.dart';

class MyNavigationDrawer extends StatefulWidget {
  final drawerItems = [
    new DrawerItem("Fragment 1", Icons.rss_feed),
    new DrawerItem("Fragment 2", Icons.local_pizza),
    new DrawerItem("Fragment 3", Icons.info)
  ];
  @override
  State<MyNavigationDrawer> createState() => _MyNavigationDrawerState();
}

class _MyNavigationDrawerState extends State<MyNavigationDrawer> {
  int _selectedDrawerIndex = 0;

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

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {

    var statusBarHeight = MediaQuery.of(context).padding.top;
    var appBarHeight = kToolbarHeight;

    var drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(
          new ListTile(
            leading: new Icon(d.icon),
            title: new Text(d.title),
            selected: i == _selectedDrawerIndex,
            onTap: () => _onSelectItem(i),
          )
      );
    }
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Text("My Drawer Demo"),),
          drawer: Container(
            //padding: EdgeInsets.only(top:  appBarHeight + 1),
            child: Drawer(
              // Add a ListView to the drawer. This ensures the user can scroll
              // through the options in the drawer if there isn't enough vertical
              // space to fit everything.
              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Text('Left Drawer Header'),
                  ),
                  Column(children: drawerOptions)
                ],
              ),
            ),
          ),
          endDrawer: Container(
            //padding: EdgeInsets.only(top:  appBarHeight + 1),
            child: Drawer(
              // Add a ListView to the drawer. This ensures the user can scroll
              // through the options in the drawer if there isn't enough vertical
              // space to fit everything.
              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Text('Right Drawer Header'),
                  ),
                  Column(children: drawerOptions)
                ],
              ),
            ),
          ),
          body:_getDrawerItemWidget(_selectedDrawerIndex),
        )
    );
  }
}
