import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'Teacherlogin.dart';

class FancyButton extends StatelessWidget {
  final VoidCallback eventsHandler;

  FancyButton(this.eventsHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      margin: EdgeInsets.only(top:10),
      child: RaisedButton(
        onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Teacherlogin()),
            );
          },
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
        padding: EdgeInsets.all(0.0),
        child: Ink(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.green, Colors.blue],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(30.0)),
          child: Padding(
            padding: const EdgeInsets.only(right: 0.0),
            child: Container(
              margin: EdgeInsets.only(right: 20.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/teacher.png'),
                    alignment: Alignment.centerRight,
                    fit: BoxFit.fitHeight),
              ),
              constraints: BoxConstraints(maxWidth: 280.0, minHeight: 50.0),
              alignment: Alignment.center,
              child: Text(
                "Teacher Login",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
