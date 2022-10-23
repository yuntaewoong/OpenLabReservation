
import 'package:flutter/material.dart';
import 'ReservationPage.dart';
import 'InformationPage.dart';
import 'DateSelectionPage.dart';

class TimeSelectionPage extends StatelessWidget {
  const TimeSelectionPage({Key? key}) : super(key: key);

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
                      MaterialPageRoute(builder: (context) => const ReservationPage())//날짜 선택 페이지로
                  );
                },
                child: Text('비어 있는 시간'),
                //ElevatedButton 은 backgroundColor 속성이 없다.
                //ElevatedButton 에서는 primary 속성이 배경색을 담당한다.
                style: ElevatedButton.styleFrom(
                    primary: Colors.green,
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
              ElevatedButton(
                onPressed: (){// 버튼 클릭시 실행되는 함수
                  Navigator.push(
                      context,
                     MaterialPageRoute(builder: (context) => const InformationPage())//날짜 선택 페이지로
                  );
                },
                child: Text('이미 예약된 시간'),
                //ElevatedButton 은 backgroundColor 속성이 없다.
                //ElevatedButton 에서는 primary 속성이 배경색을 담당한다.
                style: ElevatedButton.styleFrom(
                    primary: Colors.red,
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
              ElevatedButton(
                onPressed: (){// 버튼 클릭시 실행되는 함수
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const DateSelectionPage())//날짜 선택 페이지로
                  );
                },
                child: Text('날짜 선택으로'),
                //ElevatedButton 은 backgroundColor 속성이 없다.
                //ElevatedButton 에서는 primary 속성이 배경색을 담당한다.
                style: ElevatedButton.styleFrom(
                    primary: Colors.pinkAccent,
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
              )
            ],
          ),
        )
    );
  }
}