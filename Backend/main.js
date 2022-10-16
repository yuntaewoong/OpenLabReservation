
var express = require("express");
var app = express();

app.get("/",(req,res) =>{
    res.json({
        "key":"value"
    });
});

app.listen(3000,(err)=>{
    console.log(3000);
});