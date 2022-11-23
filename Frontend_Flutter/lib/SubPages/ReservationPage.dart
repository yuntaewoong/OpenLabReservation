
import 'package:flutter/material.dart';
import 'TimeSelectionPage.dart';
import 'DateSelectionPage.dart';

class ReservationPage extends StatelessWidget {
  const ReservationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("예약 정보 입력")
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "이름",
              ),
              style: TextStyle(fontSize: 20),
            ),
            const TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "학번"
                ),
              style: TextStyle(fontSize: 20),
            ),
            const TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "연락처",
                ),
              style: TextStyle(fontSize: 20),
            ),
             const TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "대여목적",
              ),
              style: TextStyle(fontSize: 20),
              maxLines: 5,
            ),
            const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "소속",
                ),
                style: TextStyle(fontSize: 20),
            ),
            const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "비밀번호",
                ),
                style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              onPressed: (){// 버튼 클릭시 실행되는 함수
              },
              child: Text('예약하기'),
              //ElevatedButton 은 backgroundColor 속성이 없다.
              //ElevatedButton 에서는 primary 속성이 배경색을 담당한다.
              style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  shape: RoundedRectangleBorder(
                    // shape : 버튼의 모양을 디자인 하는 기능
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  elevation: 0.0,
                  minimumSize: Size(400,50),
                  textStyle: const TextStyle(
                      fontSize : 80.0
                  )
              ),
            ),
            ElevatedButton(
              onPressed: (){// 버튼 클릭시 실행되는 함수
                Navigator.pop(context);
                /*Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const TimeSelectionPage())//날짜 선택 페이지로
                  );*/
              },
              child: Text('돌아가기'),
              //ElevatedButton 은 backgroundColor 속성이 없다.
              //ElevatedButton 에서는 primary 속성이 배경색을 담당한다.
              style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  shape: RoundedRectangleBorder(
                    // shape : 버튼의 모양을 디자인 하는 기능
                      borderRadius: BorderRadius.circular(10.0)
                  ),
                  elevation: 0.0,
                  minimumSize: Size(400,50),
                  textStyle: const TextStyle(
                      fontSize : 80.0
                  )
              ),
            ),
          ]
        )
      )
    );
  }
  /*@override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: (){// 버튼 클릭시 실행되는 함수
                },
                child: Text('예약하기'),
                //ElevatedButton 은 backgroundColor 속성이 없다.
                //ElevatedButton 에서는 primary 속성이 배경색을 담당한다.
                style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    shape: RoundedRectangleBorder(
                      // shape : 버튼의 모양을 디자인 하는 기능
                        borderRadius: BorderRadius.circular(10.0)
                    ),
                    elevation: 0.0,
                    minimumSize: Size(400,50),
                    textStyle: const TextStyle(
                        fontSize : 80.0
                    )
                ),
              ),
              ElevatedButton(
                onPressed: (){// 버튼 클릭시 실행되는 함수
                  Navigator.pop(context);
                  /*Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const TimeSelectionPage())//날짜 선택 페이지로
                  );*/
                },
                child: Text('돌아가기'),
                //ElevatedButton 은 backgroundColor 속성이 없다.
                //ElevatedButton 에서는 primary 속성이 배경색을 담당한다.
                style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    shape: RoundedRectangleBorder(
                      // shape : 버튼의 모양을 디자인 하는 기능
                        borderRadius: BorderRadius.circular(10.0)
                    ),
                    elevation: 0.0,
                    minimumSize: Size(400,50),
                    textStyle: const TextStyle(
                        fontSize : 80.0
                    )
                ),
              ),
            ],
          ),
        )
    );
  }*/
}