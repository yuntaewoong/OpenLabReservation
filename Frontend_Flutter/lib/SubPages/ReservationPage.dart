
import 'package:flutter/material.dart';
import 'TimeSelectionPage.dart';
import 'DateSelectionPage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ReservationData
{
  String name = "";//이름
  int id = 0;//학번
  int phoneNumber = 0;//전화번호
  String purpose = "";//예약목적
  String major = "";//전공
  int password = 0;//비밀번호
}


ReservationData RESERVATION_DATA = ReservationData();


class ReservationPage extends StatelessWidget {
  ReservationPage(this.month,this.date,this.time);
  int month= 0;
  int date = 0;
  int time = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("예약 정보 입력",
            style: TextStyle(fontSize: 35.0))
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10.0,),
            const Text("이름 (name)",
               style: TextStyle(
                 fontSize: 25.0
               ),
            ),
            TextField(
              onChanged: (text) {
                RESERVATION_DATA.name = text;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "홍길동",
              ),
              style: const TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 10.0,),
            const Text("학번 (Student ID)",
              style: TextStyle(
                  fontSize: 25.0
              ),
            ),
            TextField(
              onChanged: (text) {
                RESERVATION_DATA.id = int.parse(text);
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "2022000000"
                ),
              style: const TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 10.0,),
            const Text("연락처 (Phone Number)",
              style: TextStyle(
                  fontSize: 25.0
              ),
            ),
            TextField(
              onChanged: (text) {
                RESERVATION_DATA.phoneNumber = int.parse(text);
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "01012345678",
                ),
              style: const TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 10.0,),
            const Text("대여 목적 (Usage Purpose)",
              style: TextStyle(
                  fontSize: 25.0
              ),
            ),
            TextField(
              onChanged: (text) {RESERVATION_DATA.purpose = text;},
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "ex) 조별과제 스터디, 세미나, 랩 미팅",
              ),
              style: const TextStyle(fontSize: 20.0),
              maxLines: 5
            ),
            const SizedBox(height: 10.0,),
            const Text("소속 (major)",
              style: TextStyle(fontSize: 25.0),
              maxLines: 5,
            ),
            TextField(
              onChanged: (text) {
                RESERVATION_DATA.major = text;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "ex) 유전생명공학과, 작물시스템유전학실험실",
              ),
              style: const TextStyle(fontSize: 20.0),
              maxLines: 2,
            ),
            const SizedBox(height: 10.0,),
            const Text("비밀번호 (Password)",
              style: TextStyle(
                  fontSize: 25.0
              ),
            ),
            TextField(
              onChanged: (text) {
                RESERVATION_DATA.password = int.parse(text);
              },
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                //hintText: "비밀번호",
              ),
              style: const TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 25.0,),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, // 같은 간격만큼 공간을 둠
            children: [
              ElevatedButton(
                onPressed: () async {

                  var data = {
                    "month" : this.month,
                    "date" : this.date,
                    "time" : this.time,
                    "name" : RESERVATION_DATA.name,
                    "id" : RESERVATION_DATA.id,
                    "phoneNumber" : RESERVATION_DATA.phoneNumber,
                    "purpose" : RESERVATION_DATA.purpose,
                    "major" : RESERVATION_DATA.major,
                    "password" : RESERVATION_DATA.password
                  };
                  var body = json.encode(data);
                  http.Response res = await http.post(Uri.parse("http://ec2-3-35-4-123.ap-northeast-2.compute.amazonaws.com:1666/"),
                      headers: {"Content-Type": "application/json"},
                      body: body
                  );
                  showDialog(
                      context: context,
                      barrierDismissible: true, // 바깥 영역 터치시 닫을지 여부
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Text("예약되었습니다."),
                          insetPadding: const  EdgeInsets.fromLTRB(0,80,0, 80),
                          actions: [
                            TextButton(
                              child: const Text('확인'),
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context)
                                    => const DateSelectionPage()));//날짜 선택 페이지로
                              },
                            ),
                          ],
                        );
                      }
                  );

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
                    minimumSize: Size(200,50),
                    textStyle: const TextStyle(
                        fontSize : 40.0
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
                    minimumSize: Size(200,50),
                    textStyle: const TextStyle(
                        fontSize : 40.0
                    )
                ),
              ),
            ]
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