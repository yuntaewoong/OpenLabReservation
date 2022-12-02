
import 'package:flutter/material.dart';
import 'TimeSelectionPage.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';


class DateSelectionPage extends StatelessWidget {
  const DateSelectionPage({Key? key}) : super(key: key);

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
                    MaterialPageRoute(builder: (context) => const TimeSelectionPage())//날짜 선택 페이지로
                );
              },
              child: Text('달력에서 날짜 선택'),
              //ElevatedButton 은 backgroundColor 속성이 없다.
              //ElevatedButton 에서는 primary 속성이 배경색을 담당한다.
              style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
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
            ),
            TableCalendar(
              firstDay: DateTime.utc(2021, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: DateTime.now(),
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay; // update `_focusedDay` here as well
                });
              },
            )
          ],
        ),
      )
  );
}
}















