
var express = require("express");
var app = express();
app.use(express.json());
var sqlite3 = require('sqlite3').verbose();

var db = new sqlite3.Database('./DataBase/Reservation.db', (err) => {
    if (err) {
        console.error(err.message);
    }
    console.log('Connected to the Reservation Database.');
})
/*
3000번 포트로 대기
*/
app.listen(3000,(err)=>{
    console.log(3000);
});



/*
플러터 클라이언트에서 month/date/time에 해당하는 예약이 이미 존재하는지 확인하는 GET
존재하면 TRUE, 아니면 FALSE리턴
*/
app.get("/:month/:date/:time",(req,res) =>{
    let param = req.params;
    let findQuery = "SELECT * FROM RESERVATION WHERE MONTH = ? AND DATE = ? AND TIME = ?";
    db.get(findQuery,param.month,param.date,param.time,(err,row)=>{//month/date/time조합이 있나 DB검색
            if(!row)//이미 예약된 정보가 없는 경우
                res.send(false);
            else//이미 예약된 정보가 있는 경우
                res.send(true);
        }
    );
});

/*
플러터 클라이언트에서 NODEJS서버로 POST예약요청 처리
예약요청 JSON데이터는 req.body로 접근한다.
클라에서는 항상 해당 예약이 유효한 예약인지(같은달,같은날,같은시간에 이미 예약이 없는지)확인하고 POST할것
*/
app.post("/",(req,res) =>{
    let reservationData = req.body;
    let insertQuery = "INSERT INTO RESERVATION(month,date,time,name,id,phoneNumber,purpose,major,password) VALUES(?,?,?,?,?,?,?,?,?)";
    db.run(
        insertQuery,
        reservationData.month,
        reservationData.date,
        reservationData.time,
        reservationData.name,
        reservationData.id,
        reservationData.phoneNumber,
        reservationData.purpose,
        reservationData.major,
        reservationData.password,
        function (err) {
            //console.log(err);//에러내용보고싶으면 주석해제 ㄱ
        }
    );
    console.log(reservationData.month + "월" + reservationData.date + "일" + reservationData.time + "시 예약완료");
    res.send(true);
});
