import 'package:flutter/material.dart';
import 'package:flutter_project/view/favorite_page.dart';
import 'package:flutter_project/view/front_page.dart';
import 'package:flutter_project/view/explore_page.dart';
import 'package:flutter_project/view/setting_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  //For bottom navigator
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _viewOptions = <Widget>[
    FrontPage(),
    ExplorePage(),
    FavoritePage(),
    SettingPage()
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Template'),
        actions: <Widget>[
          IconButton(
              onPressed: (){},
              icon: const Icon(Icons.search_rounded)
          ),
          IconButton(
              onPressed: (){},
              icon: const Icon(Icons.notifications_none_outlined)
          ),
          IconButton(
            onPressed: (){
              //check token
              //if exist and not expire then go to user account view
              //else go to login view
              Navigator.pushNamed(context, "LoginPage");
            },
            icon: const Icon(Icons.person),
          )
        ],
      ),
      body:  _viewOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,),
            label: '首頁',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined),
            label: '探索',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: '收藏',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '設定'
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        selectedItemColor: Colors.blueAccent,
        onTap: _onItemTapped,
      ),
    );
  }
}
