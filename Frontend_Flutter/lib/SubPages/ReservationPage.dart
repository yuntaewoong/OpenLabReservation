
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
        title: Text("예약 정보 입력")
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10.0,),
            const Text("이름",
               style: TextStyle(
                 fontSize: 15.0
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
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10.0,),
            const Text("학번",
              style: TextStyle(
                  fontSize: 15.0
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
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10.0,),
            const Text("연락처",
              style: TextStyle(
                  fontSize: 15.0
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
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10.0,),
            const Text("대여 목적",
              style: TextStyle(
                  fontSize: 15.0
              ),
            ),
            TextField(
              onChanged: (text) {
                RESERVATION_DATA.purpose = text;
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "ex) 조별과제 스터디, 세미나, 랩 미팅",
              ),
              style: const TextStyle(fontSize: 20),
              maxLines: 5,
            ),
            /*DropdownButton(
              value: _selectedValue
              items: _valueList.map(
                  (value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    );
                  }
                ).toList(),
                onChanged: (value) {
                  setState() {
                  value = value;
                  });
                },

            ),*/
            const SizedBox(height: 10.0,),
            const Text("소속",
              style: TextStyle(
                  fontSize: 15.0
              ),
            ),
            TextField(
              onChanged: (text) {
                RESERVATION_DATA.major = text;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "ex) 유전생명공학과, 작물시스템유전학실험실",
              ),
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10.0,),
            const Text("비밀번호",
              style: TextStyle(
                  fontSize: 15.0
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
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 40.0,),
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
                  http.Response res = await http.post(Uri.parse("http://10.0.2.2:3000/"),
                      headers: {"Content-Type": "application/json"},
                      body: body
                  );
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const DateSelectionPage())
                  );//날짜 선택 페이지로
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