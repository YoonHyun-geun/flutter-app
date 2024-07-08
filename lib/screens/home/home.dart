import 'package:flutter/material.dart';
import 'package:planb/screens/home/detail.dart';

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
              borderRadius: BorderRadius.circular(5),
              side: const BorderSide(
                color: Color.fromARGB(255, 233, 233, 233),
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
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5), // 이미지에 둥근 모서리 적용
                        child: Image.network(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTtVUJDc4_gr8AZk2JsFijSFp4TH1Ed4BC3e8dPIJ1zmW2sA2W4ZMFXA_JGw&s', // 이미지 URL을 적절히 변경하세요
                          fit: BoxFit.cover,
                          width: 100,
                          height: 100,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '거창파크골프장(제6구장) $index',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'NanumSquare', // Roboto 폰트 적용
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              '경상남도 거창군 가조면 일부리 1121-1 $index.',
                              style: const TextStyle(
                                fontSize: 16,
                                fontFamily: 'NanumSquare', // Roboto 폰트 적용
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
