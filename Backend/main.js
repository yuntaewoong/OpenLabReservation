
var express = require("express");
var app = express();
var sqlite3 = require('sqlite3').verbose();

var db = new sqlite3.Database('./DataBase/Reservation.db', (err) => {
    if (err) {
        console.error(err.message);
    }
    console.log('Connected to the Reservation Database.');
})

db.close((err) => {
    if (err) {
        return console.error(err.message);
    }
    console.log('Close the database connection.');
});



app.get("/",(req,res) =>{
    res.json({
        "key":"value"
    });
});

app.listen(3000,(err)=>{
    console.log(3000);
});