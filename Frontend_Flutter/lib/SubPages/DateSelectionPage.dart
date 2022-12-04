
import 'package:flutter/material.dart';
import 'TimeSelectionPage.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';


class DateSelectionPage extends StatelessWidget {
  const DateSelectionPage({Key? key}) : super(key: key);

  @override
Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text("날짜 선택",
                  style: TextStyle(fontSize: 25.0)
              ),
              Text("(Select date)",
                  style: TextStyle(fontSize: 20.0)
              ),
            ],
          )
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 50.0),
            TableCalendar(
              firstDay: DateTime.utc(2021, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: DateTime.now(),
              onDaySelected: (selectedDay, focusedDay) {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TimeSelectionPage(selectedDay.month,selectedDay.day))//날짜 선택 페이지로
                );
              },
            )
          ],
        ),
      )
  );
}
}















