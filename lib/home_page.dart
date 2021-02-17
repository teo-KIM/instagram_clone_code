import 'package:flutter/material.dart';
import 'package:instagram_clone_code/screens/feed_screen.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<BottomNavigationBarItem> btmNavItems = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
    BottomNavigationBarItem(icon: Icon(Icons.place), label: ''),
    BottomNavigationBarItem(icon: Icon(Icons.info), label: ''),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
    BottomNavigationBarItem(icon: Icon(Icons.youtube_searched_for), label: ''),
  ];

  List<Widget> _screens = [
    FeedScreen(),
    Container(
      color: Colors.amber,
    ),
    Container(
      color: Colors.greenAccent,
    ),
    Container(
      color: Colors.yellowAccent,
    ),
    Container(
      color: Colors.purpleAccent,
    ),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: btmNavItems,
        currentIndex: _selectedIndex,
        onTap: _btmNavAction,
        selectedItemColor: Colors.black87,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }

  void _btmNavAction(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
