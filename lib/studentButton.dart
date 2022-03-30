import 'package:flutter/material.dart';
class studentButton extends StatelessWidget {
  
  final VoidCallback eventsHandlerstudent;

studentButton(this.eventsHandlerstudent);

  @override
  Widget build(BuildContext context) {

    return Container(
     alignment: Alignment.center ,

      child: RaisedButton(onPressed:eventsHandlerstudent, shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                          textColor: Colors.white,
                          color: Colors.blueGrey,
                          child: Text('Students Login'),
                          
      
      ),
      
    );
  }
}