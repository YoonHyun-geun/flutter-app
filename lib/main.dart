import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = [
    HomeBody(),
    MyReviewsPage(),
    MyStatsPage(),
    MyProfilePage(),
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
            icon: const Icon(Icons.settings),
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
        backgroundColor: Colors.grey.shade200, // 배경색을 옅은 회색으로 설정
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
            label: '기록',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'MY',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
      ),
      backgroundColor: Colors.white, // Background color for the body
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(index: index),
              ),
            );
          },
          child: Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side: const BorderSide(
                color: Colors.grey,
                width: 1,
              ),
            ),
            margin: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTtVUJDc4_gr8AZk2JsFijSFp4TH1Ed4BC3e8dPIJ1zmW2sA2W4ZMFXA_JGw&s', // 이미지 URL을 적절히 변경하세요
                        fit: BoxFit.cover,
                        width: 100,
                        height: 100,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '거창파크골프장(제6구장) $index',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Roboto', // Roboto 폰트 적용
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              '경상남도 거창군 가조면 일부리 1121-1 $index.',
                              style: const TextStyle(
                                fontSize: 16,
                                fontFamily: 'Roboto', // Roboto 폰트 적용
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.thumb_up, size: 16),
                      const SizedBox(width: 5),
                      Text('${index * 10}'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class DetailScreen extends StatelessWidget {
  final int index;

  const DetailScreen({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Screen'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black, // Text color for AppBar
      ),
      body: Center(
        child: Text(
          'Detail Screen for item $index',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class MyReviewsPage extends StatelessWidget {
  const MyReviewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'My Reviews Page',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class MyStatsPage extends StatelessWidget {
  const MyStatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Statistics Page',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'My Profile Page',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
