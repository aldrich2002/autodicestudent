import 'package:autodice/adminButton.dart';
import 'package:flutter/material.dart';
import './fancybutton.dart';
import './studentButton.dart';
import './Teacherlogin.dart';

void main() {
  runApp(MyApp());
}

void _printw() {
  print("Hello");
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(fontFamily: 'Raleway'),
        home: Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.blue[900],
                title: Text('SmartByte Computer Education'),
                centerTitle: true),
            body: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Colors.blue, Colors.white])),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/sbyte.png',
                            height: 200, width: 200),
                        FancyButton(_printw),
                        SizedBox(height: 10),
                        studentButton(_printw),
                        Padding(
                          padding: const EdgeInsets.only(top: 100.0),
                          child: Container(
                           
                              child: Column(children:[adminButton(_printw)]) ),
                        )
                     
                      ],
                    ),
                  
                  ),
                  
                ),
               
              ),
            )));
  }
}
