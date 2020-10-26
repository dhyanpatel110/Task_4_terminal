
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

    var cmd;
    var webdata;
    
    
    myweb(cmd) async{
      var url = "http://192.168.43.93/cgi-bin/web2.py?x=${cmd}";
      var r = await http.get(url);
      
      setState(() {
      webdata = r.body;
    });

    }
  /*var db = ["dhyan", "kirit", "patel"];
  var index = 0;
  click() {
    setState(() {
      index++;
    });
    print('clicked._._._._');
    print("indexed changed");
    print(index);
  }*/
 
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: Text('Application'),
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height*0.5,
          width: MediaQuery.of(context).size.width*0.5,
          color: Colors.grey,
          child: Column(
            children: <Widget>[
              Text("Enter ur linux cmd :"),
              
              TextField(
                onChanged: (value){
                  cmd = value;
                },
              ),
              
              FlatButton(
                onPressed: (){
                  myweb(cmd);
                }, 
                child: Text('click'),),
              Text(webdata ?? "output is coming .."),
            ],
          ),
        ),
      ),
    );
  }
}

