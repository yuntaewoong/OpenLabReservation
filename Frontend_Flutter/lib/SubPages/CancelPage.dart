
import 'package:flutter/material.dart';
import 'TimeSelectionPage.dart';
import 'DateSelectionPage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;



class CancelPage extends StatelessWidget {
  CancelPage(this.month, this.date, this.time);

  int month = 0;
  int date = 0;
  int time = 0;

  Future FetchReservation(int month,int date,int time) async{//fetch함수 : get함수 호출후 결과를 비동기로 받겠다
    var res = await http.get(Uri.parse(
        "http://10.0.2.2:3000/info/" +
            month.toString() + "/" +
            date.toString() + "/" +
            time.toString()
    ));//10.0.2.2는 가상머신 호스트의 IP를 의미
    return jsonDecode(res.body);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("예약 확인",
                style: TextStyle(fontSize: 25.0))
        ),

        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child:FutureBuilder(
                future: FetchReservation(this.month,this.date,this.time),
                builder: (context,snap) {
                  if (!snap.hasData)
                    return const CircularProgressIndicator(); //아직 데이터가 안오면 빙글빙글 아이콘이 뜸
                  return Column(
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
                        Text(snap.data["name"].replaceRange(1, 2, '*' * 1),
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
                        Text(snap.data["id"].toString().replaceRange(4, 8, '*' * 4),
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
                        Text("0" + snap.data["phoneNumber"].toString().replaceRange(3, 7, '*' * 4),
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
                        Text(snap.data["major"],
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
                        const SizedBox(height: 290.0,),
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
                                        borderRadius: BorderRadius.circular(
                                            10.0)
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
                                        borderRadius: BorderRadius.circular(
                                            10.0)
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
                  );
                }
            )
        )
    );
  }
}
