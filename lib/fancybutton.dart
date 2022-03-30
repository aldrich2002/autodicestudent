import 'package:flutter/material.dart';
class FancyButton extends StatelessWidget {
  
  final VoidCallback eventsHandler;

  FancyButton(this.eventsHandler);

  @override
  Widget build(BuildContext context) {

    return Container(
     alignment: Alignment.center ,
     
      child: RaisedButton(
        
        
         shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
        onPressed:eventsHandler,
                          textColor: Colors.white,
                          color: Colors.red,
                          child: Text('Teachers Login'),
      
      ),
      
    );
  }
}