
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
              ElevatedButton(
                onPressed: (){// 버튼 클릭시 실행되는 함수
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DateSelectionPage())//날짜 선택 페이지로
                  );
                },
                child: Text('예약'),
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
                      fontSize : 80.0
                    )
                ),
              )
            ],
          ),
        )
    );
  }
}

Widget build(BuildContext context) {
  return MaterialApp(
    title: 'Welcome to Flutter',
    home: Container( //컨테이너로 감싼다.
      decoration: BoxDecoration( //decoration 을 준다.
          image: DecorationImage(
              image: AssetImage("C:\Users\82108\Downloads\University_Seal_01_JPG_2021"), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent, //스캐폴드에 백그라운드를 투명하게 한다.
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text('My App'),
          centerTitle: true,
          leading: IconButton(
              icon: Icon(
                Icons.list,
                color: Colors.white,
              ),
              onPressed: () {}),
        ),
      ),
    ),
  );
}