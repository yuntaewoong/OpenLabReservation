
import 'package:flutter/material.dart';

import 'SubPages/DateSelectionPage.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NewButton',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MainPage(),
    );
  }
}
class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                const Text("생명과학대학 오픈랩",
                style: TextStyle(
                    fontSize: 40.0
                ),
              ),
              const Text("예약 시스템",
                style: TextStyle(
                    fontSize: 40.0
                ),
              ),
              const SizedBox(height: 20),
              const Text("College of Life sciences",
                style: TextStyle(
                    fontSize: 25.0
                ),
              ),
              const SizedBox(height: 5),
              const Text("Openlab reservation",
                style: TextStyle(
                    fontSize: 25.0
                ),
              ),
              const SizedBox(height: 40.0),
              const Image(
                image: AssetImage("assets/KyungHee.jpg"),
                fit: BoxFit.cover,
                color: Colors.white,
                colorBlendMode: BlendMode.darken,
              ),
              ElevatedButton(
                onPressed: (){// 버튼 클릭시 실행되는 함수
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DateSelectionPage())//날짜 선택 페이지로
                  );
                },
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('예약하기'),
                      Text("(Touch to start reservation)",
                          style: TextStyle(
                              fontSize: 25.0
                          )
                      )
                    ]
                ),
                //ElevatedButton 은 backgroundColor 속성이 없다.
                //ElevatedButton 에서는 primary 속성이 배경색을 담당한다.
                style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    shape: RoundedRectangleBorder(
                      // shape : 버튼의 모양을 디자인 하는 기능
                        borderRadius: BorderRadius.circular(10.0)
                    ),
                    elevation: 0.0,
                    minimumSize: Size(400,100),
                    textStyle: const TextStyle(
                        fontSize : 40.0
                    )
                ),
              ),
            ],
          ),
        )
    );
  }
}





