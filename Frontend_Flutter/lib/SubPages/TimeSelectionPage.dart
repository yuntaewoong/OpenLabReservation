
import 'package:flutter/material.dart';
import 'ReservationPage.dart';
import 'InformationPage.dart';
import 'DateSelectionPage.dart';

class TimeSelectionPage extends StatelessWidget {
  const TimeSelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(


      appBar: AppBar(
        title: Text("선택한 날짜 여기에 표시"),
      ),
      body: ListView(
      scrollDirection : Axis.vertical,
      children : <Widget> [
        for (num i=8; i < 10; i++)
          ListTile(
            title: Text("0$i:00 ~ 0$i:59"),
            tileColor: Colors.red,
            trailing: Icon(Icons.navigate_next),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ReservationPage())
              ); // MaterialPageRoute
            }, // onTap
          ),
        for (num i=10; i < 24; i++)
          ListTile(
              title: Text("$i:00 ~ $i:59"),
              tileColor: Colors.green,
              trailing: Icon(Icons.navigate_next),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ReservationPage())
                ); // MaterialPageRoute
              }, // onTP
          ),
    ]
    )
    );
  }
}