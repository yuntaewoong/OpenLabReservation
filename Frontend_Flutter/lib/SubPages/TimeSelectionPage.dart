
import 'package:flutter/material.dart';
import 'ReservationPage.dart';
import 'InformationPage.dart';
import 'DateSelectionPage.dart';
var reservation = [true, true, true, false, false, false, false, false, true,
  true, true, false, false, false, false, false];

class TimeSelectionPage extends StatelessWidget {
  const TimeSelectionPage({Key? key}) : super(key: key);

  Color colors(int i) { //예약 상황에 따라 다른 색갈로 버튼을 표시
    Color col;
    if(reservation[i]) {col = Colors.red;}
    else {col = Colors.green;}
    return col;
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
          ListTile(
              title: Text(
                  "0$i:00 ~ 0$i:59", style: const TextStyle(fontSize: 30,)),
              tileColor: colors(i - 8),
              trailing: Icon(Icons.navigate_next, size: 40,),
              onTap: () {
                if (!reservation[i - 8]) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ReservationPage())
                  ); // MaterialPageRoute
                }
                else;
              } // onTap
          ),

        for (int i=10; i < 24; i++)
          ListTile(
              title: Text("$i:00 ~ $i:59", style: const TextStyle(fontSize: 30,)),
              tileColor: colors(i-8),
              trailing: Icon(Icons.navigate_next, size: 40,),
              onTap: () {
                if (!reservation[i - 8]) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ReservationPage())
                  ); // MaterialPageRoute
                }
              } // onTaP
          ),
    ]
    )
    );
  }
}