import 'package:flutter/material.dart';
import './fancybutton.dart';
import './studentButton.dart';

void main() {
  runApp(MyApp());
}
void _LoginTeacher(){
print("jello");

}

void _LoginStudent(){
print("Hello");

}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
home: Scaffold(
  backgroundColor: Colors.amber,
  appBar: AppBar(backgroundColor:Colors.black ,
  title:Text('Autodice'),
  ),
  body: Column(children: [
  FancyButton(_LoginTeacher),
  studentButton(_LoginStudent),

   
   
   
  ]
  
  
  ),
  )











    );
  }
}
