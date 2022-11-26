
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'ReservationPage.dart';
import 'InformationPage.dart';
import 'DateSelectionPage.dart';
import 'package:http/http.dart' as http;


class TimeSelectionPage extends StatelessWidget {
  const TimeSelectionPage({Key? key}) : super(key: key);
  Future FetchReservation(int month,int date,int time) async{//fetch함수 : get함수 호출후 결과를 비동기로 받겠다
    var res = await http.get(Uri.parse(
        "http://10.0.2.2:3000/" +
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
        title: const Text("선택한 날짜 여기에 표시"),
        actions: <Widget>[]
      ),
      body: ListView(
      scrollDirection : Axis.vertical,
      children : <Widget> [
        for (int i=8; i < 10; i++)
          FutureBuilder(
            future: FetchReservation(7,3,i),//7월3일정보, 이 데이터는 다른 페이지에서 받아올것
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
                              builder: (context) => ReservationPage(7,3,i))
                      ); // MaterialPageRoute
                    }
                    else;
                  } // onTap
              );
            }
          ) ,

        for (int i=10; i < 24; i++)
          FutureBuilder(
              future: FetchReservation(7,3,i),//7월3일정보, 이 데이터는 다른 페이지에서 받아올것
              builder: (context,snap){
                if(!snap.hasData) return const CircularProgressIndicator();//아직 데이터가 안오면 빙글빙글 아이콘이 뜸
                return ListTile(
                    title: Text("$i:00 ~ $i:59", style: const TextStyle(fontSize: 30,)),
                    tileColor: snap.data == "true" ? Colors.red : Colors.green,
                    trailing: Icon(Icons.navigate_next, size: 40,),
                    onTap: () {
                      if (snap.data != "true") {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ReservationPage(7,3,i))
                        ); // MaterialPageRoute
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