
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

//예약 정보를 서버에서 불러왔다고 가정
Map data = {
  "month" : "11",
  "date" : "29",
  "time" : "10",
  "name" : "홍길동",
  "id" : "2022000000",
  "phoneNumber" : "01041758781",
  "purpose" : "조별과제",
  "major" : "유전생명공학과",
  "password" : "0000",
};

String name = data["name"];
String s_name = name.replaceAll(RegExp(r'.(?=.{1})'),'*');


class CancelPage extends StatelessWidget {
  CancelPage(this.month, this.date, this.time);

  int month = 0;
  int date = 0;
  int time = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("예약 확인",
                style: TextStyle(fontSize: 25.0))
        ),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20.0,),
                  const Text("이름",
                    style: TextStyle(
                        fontSize: 15.0
                    ),
                  ),
                  const SizedBox(height: 10.0,),
                  Text(data["name"].replaceRange(1, 2, '*' * 1),
                    style: const TextStyle(
                      fontSize: 20,
                    ),

                  ),
                  const SizedBox(height: 20.0,),
                  const Text("학번",
                    style: TextStyle(
                        fontSize: 15.0
                    ),
                  ),
                  const SizedBox(height: 10.0,),
                  Text(data["id"].replaceRange(4, 8, '*' * 4),
                    style: const TextStyle(
                        fontSize: 20),
                  ),
                  const SizedBox(height: 20.0,),
                  const Text("연락처",
                    style: TextStyle(
                        fontSize: 15.0
                    ),
                  ),
                  const SizedBox(height: 10.0,),
                  Text(data["phoneNumber"].replaceRange(3, 7, '*' * 4),
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 20.0,),
                  /*const Text("대여 목적",
                    style: TextStyle(
                        fontSize: 15.0
                    ),
                  ),
                  const SizedBox(height: 10.0,),
                  const Text("**************",
                    style: TextStyle(fontSize: 20),
                    maxLines: 5,
                  ),
                  const SizedBox(height: 20.0,),*/
                  const Text("소속",
                    style: TextStyle(
                        fontSize: 15.0
                    ),
                  ),
                  const SizedBox(height: 10.0,),
                  Text(data["major"],
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 20.0,),
                  const Text("비밀번호",
                    style: TextStyle(
                        fontSize: 15.0
                    ),
                  ),
                  const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      //hintText: "비밀번호",
                    ),
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 40.0,),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // 같은 간격만큼 공간을 둠
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            //예약 취소 정보를 서버에 전송할 코드가 여기에 필요
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (
                                    context) => const DateSelectionPage())
                            ); //날짜 선택 페이지로 돌아감
                          },

                          child: Text('예약취소'),
                          //ElevatedButton 은 backgroundColor 속성이 없다.
                          //ElevatedButton 에서는 primary 속성이 배경색을 담당한다.
                          style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                              shape: RoundedRectangleBorder(
                                // shape : 버튼의 모양을 디자인 하는 기능
                                  borderRadius: BorderRadius.circular(10.0)
                              ),
                              elevation: 0.0,
                              minimumSize: const Size(200, 50),
                              textStyle: const TextStyle(
                                  fontSize: 40.0
                              )
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () { // 버튼 클릭시 실행되는 함수
                            Navigator.pop(context);
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
                              minimumSize: const Size(200, 50),
                              textStyle: const TextStyle(
                                  fontSize: 40.0
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
}
