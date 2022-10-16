import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {//main함수, 프로그램의 시작
  runApp(MaterialApp(home: MyApp(),));
}
class MyApp extends StatefulWidget{// MyApp이라는 위젯 선언
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{// MyApp의 State선언

  Future fetch() async{//fetch함수 : get함수 호출후 결과를 비동기로 받겠다
    var res = await http.get(Uri.parse("http://10.0.2.2:3000/"));//10.0.2.2는 가상머신 호스트의 IP를 의미
    return json.decode(res.body);//받은 데이터를 json으로 변환
  }

  @override
  Widget build(BuildContext context){//State가 만들어낼 위잿 정의
    return Scaffold(//Scaffold를 만듦
      body: Center(//정중앙에
        child: FutureBuilder(//비동기 함수가 리턴하는 Future값을 보여준다. 
          future: fetch(),//fetch비동기 함수로 Future값을 가져오겠다
          builder: (context,snap){
            if(!snap.hasData) return const CircularProgressIndicator();//아직 데이터가 안오면 빙글빙글 아이콘이 뜸
            return Text(snap.data['key'].toString());//데이터 오면 Text로 만들어 출력
          }
        ),
      ),
    );
  }
}
