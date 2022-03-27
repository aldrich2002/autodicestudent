import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget{ 
   Widget build(BuildContext context) {
    return MaterialApp(
    
      theme: ThemeData(
       appBarTheme: AppBarTheme(
       color: const Color(0xFF151026),
    )),
    home:Scaffold(
    
      appBar:AppBar(
        title:Text('Autodice education'),
      ),
    body:Column(
      
      children: [

        RaisedButton(child: Text("Teacher Login"),onPressed:null ),
        RaisedButton(child: Text("Student Login"),onPressed:null),
    
      ],
    ),
    
     
    
    
    ),
    );
    // return MaterialApp(home:Text('Hello World'),);
  }
}

  


