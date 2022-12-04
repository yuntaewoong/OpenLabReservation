
import 'package:flutter/material.dart';
import 'TimeSelectionPage.dart';
import 'DateSelectionPage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

int password  =0;

class CancelPage extends StatelessWidget {
  CancelPage(this.month, this.date, this.time);

  int month = 0;
  int date = 0;
  int time = 0;

  Future FetchReservation(int month,int date,int time) async{//fetch함수 : get함수 호출후 결과를 비동기로 받겠다
    var res = await http.get(Uri.parse(
        "http://ec2-3-35-4-123.ap-northeast-2.compute.amazonaws.com:1666/info/" +
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
            title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text("예약 정보 확인",
                    style: TextStyle(fontSize: 25.0)
                ),
                Text("(Verify reservation)",
                    style: TextStyle(fontSize: 20.0)
                ),
              ],
            )
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
                        const Text(" 이름 (Name)",
                          style: TextStyle(
                              fontSize: 25.0
                          ),
                        ),
                        const SizedBox(height: 20.0,),
                        Text("  " + snap.data["name"].replaceRange(1, 2,
                            '*' * 1),
                          style: const TextStyle(
                            fontSize: 20.0,
                          ),

                        ),
                        const SizedBox(height: 20.0,),
                        const Text(" 학번 (Student ID)",
                          style: TextStyle(
                              fontSize: 25.0
                          ),
                        ),
                        const SizedBox(height: 20.0,),
                        Text("  " +snap.data["id"].toString().replaceRange(4,
                            8, '*' * 4),
                          style: const TextStyle(
                              fontSize: 20.0),
                        ),
                        const SizedBox(height: 20.0,),
                        const Text(" 연락처 (Phone Number)",
                          style: TextStyle(
                              fontSize: 25.0
                          ),
                        ),
                        const SizedBox(height: 20.0,),
                        Text("  " + "0" + snap.data["phoneNumber"].toString().replaceRange(3, 7, '*' * 4),
                          style: const TextStyle(fontSize: 20),
                        ),
                        const SizedBox(height: 20.0,),
                        const Text(" 소속 (Major)",
                          style: TextStyle(
                              fontSize: 25.0
                          ),
                        ),
                        const SizedBox(height: 20.0,),
                        Text("  " + snap.data["major"],
                          style: const TextStyle(fontSize: 20),
                        ),
                        const SizedBox(height: 25.0,),
                        const Text(" 비밀번호 (Password)",
                          style: TextStyle(
                              fontSize: 20.0
                          ),
                        ),
                        TextField(
                          onChanged: (text) {
                            password = int.parse(text);
                          },
                          obscureText: true,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            //hintText: "비밀번호",
                          ),
                          style: const TextStyle(fontSize: 20),
                        ),
                        const SizedBox(height: 20.0,),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            // 같은 간격만큼 공간을 둠
                            children: [
                              ElevatedButton(
                                onPressed: () async {

                                    if(password == snap.data["password"]) {
                                      var data = {
                                        "month": this.month,
                                        "date": this.date,
                                        "time": this.time
                                      };
                                      var body = json.encode(data);
                                      http.Response res = await http.post(
                                          Uri.parse(
                                              "http://ec2-3-35-4-123.ap-northeast-2.compute.amazonaws.com:1666/delete"),
                                          headers: {
                                            "Content-Type": "application/json"
                                          },
                                          body: body
                                      );
                                      showDialog(
                                          context: context,
                                          barrierDismissible: true, // 바깥 영역 터치시 닫을지 여부
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              content: Text("예약이 취소되었습니다.\nReservation canceled."),
                                              insetPadding: const  EdgeInsets.fromLTRB(0,80,0, 80),
                                              actions: [
                                                TextButton(
                                                  child: const Text('확인'),
                                                  onPressed: () {
                                                    Navigator.push(context,
                                                        MaterialPageRoute(builder: (context) =>
                                                        const DateSelectionPage())
                                                    );
                                                  },
                                                ),
                                              ],
                                            );
                                          }
                                      );

                                    }//
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text("예약취소",
                                        style: TextStyle(fontSize: 40.0)
                                    ),
                                    const Text("(Cancel reservation)",
                                        style: TextStyle(fontSize: 20.0)
                                    ),
                                  ],
                                ),
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
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text("돌아가기",
                                        style: TextStyle(fontSize: 40.0)
                                    ),
                                    const Text("(Go backward)",
                                        style: TextStyle(fontSize: 20.0)
                                    ),
                                  ],
                                ),
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
                        const SizedBox(height: 20.0),
                      ]
                  );
                }
            )
        )
    );
  }
}
