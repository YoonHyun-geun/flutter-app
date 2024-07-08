import 'package:flutter/material.dart';
import 'package:planb/screens/home/home.dart';
import 'package:planb/screens/my/my.dart';
import 'package:planb/screens/review/review.dart';
import 'package:planb/screens/score/score.dart';
import 'package:planb/screens/search/search.dart';

void main() {
  runApp(const FlutterApp());
}

class FlutterApp extends StatelessWidget {
  const FlutterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = [
    HomeBody(),
    ReviewsPage(),
    ScorePage(),
    SearchPage(),
    MyPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.account_balance), // 로고 아이콘을 적절히 변경하세요
          onPressed: () {
            // Handle logo icon press
            print('Logo icon pressed');
          },
          tooltip: 'Logo',
        ),
        // title: const Text('White Tone App'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black, // Text color for AppBar
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Handle alarm icon press
              print('Alarm icon pressed');
            },
            tooltip: 'Notifications',
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // Handle settings icon press
              print('Settings icon pressed');
            },
            tooltip: 'Settings',
          ),
        ],
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.rate_review),
            label: '리뷰',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: '스코어',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '검색',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'MY',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 84, 85, 85),
        unselectedItemColor: const Color.fromARGB(255, 201, 201, 201),
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
      backgroundColor: Colors.white, // Background color for the body
    );
  }
}
