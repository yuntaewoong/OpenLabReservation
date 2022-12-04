
//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'ReservationPage.dart';
import 'CancelPage.dart';
import 'InformationPage.dart';
import 'DateSelectionPage.dart';
import 'package:http/http.dart' as http;


class TimeSelectionPage extends StatelessWidget {
  TimeSelectionPage(this.month,this.date);
  int month;
  int date;

  Future FetchReservation(int month,int date,int time) async{//fetch함수 : get함수 호출후 결과를 비동기로 받겠다
    var res = await http.get(Uri.parse(
        "http://ec2-3-35-4-123.ap-northeast-2.compute.amazonaws.com:1666/" +
        month.toString() + "/" +
        date.toString() + "/" +
        time.toString()
    ));//10.0.2.2는 가상머신 호스트의 IP를 의미
    return res.body;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Text("시간 선택",
                style: TextStyle(fontSize: 25.0)
            ),
            Text("(Select time)",
                style: TextStyle(fontSize: 20.0)
            ),
          ],
        ),
        actions: <Widget>[]
      ),
      body: ListView(
      scrollDirection : Axis.vertical,
      children : <Widget> [
        for (int i=8; i < 10; i++)
          FutureBuilder(
            future: FetchReservation(this.month,this.date,i),
            builder: (context,snap){
              if(!snap.hasData) return const CircularProgressIndicator();//아직 데이터가 안오면 빙글빙글 아이콘이 뜸
              return ListTile(
                  title: Text(
                      "0$i:00 ~ 0$i:59", style: const TextStyle(fontSize: 30,)),
                  tileColor: snap.data == "true" ? Colors.red : Colors.green,
                  trailing: Icon(Icons.navigate_next, size: 40,),
                  onTap: () {
                      if (snap.data != "true") {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ReservationPage(this.month,this.date,i)
                            )
                        ); // MaterialPageRoute
                      }
                      else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CancelPage(this.month,this.date,i)
                          )
                        );
                      }
                    }// onTap
              );
            }
          ) ,

        for (int i=10; i < 24; i++)
          FutureBuilder(
              future: FetchReservation(this.month,this.date,i),
              builder: (context,snap){
                if(!snap.hasData) return const CircularProgressIndicator();//아직 데이터가 안오면 빙글빙글 아이콘이 뜸
                return ListTile(
                    title: Text("$i:00 ~ $i:59", style: const TextStyle(fontSize: 30,)),
                    tileColor: snap.data == "true" ? Colors.red : Colors.green,
                    trailing: Icon(Icons.navigate_next, size: 40,),
                    onTap: () {
                      if(this.month == 12 && this.date ==8 && (i == 15 || i ==11)) {
                        showDialog(
                            context: context,
                            barrierDismissible: true, // 바깥 영역 터치시 닫을지 여부
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Text("4시간 연속 예약은 불가능합니다."),
                                insetPadding: const  EdgeInsets.fromLTRB(0,80,0, 80),
                                actions: [
                                  TextButton(
                                    child: const Text('확인'),
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context)
                                          => const DateSelectionPage()));
                                    },
                                  ),
                                ],
                              );
                            }
                        );
                      }
                      else{
                        if (snap.data != "true") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ReservationPage(this.month,this.date,i))
                          ); // MaterialPageRoute
                        }
                        else {
                          Navigator.push(
                              context,
                            MaterialPageRoute(builder: (context) => CancelPage(this.month,this.date,i))
                          );
                        };
                      }
                    } // onTaP
                );
              }
          )
    ]
    )
    );
  }
}