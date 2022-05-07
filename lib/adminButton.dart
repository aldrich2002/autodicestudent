
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'adminPage.dart';

class adminButton extends StatelessWidget {
  final VoidCallback eventsHandlerAdmin;
  adminButton(this.eventsHandlerAdmin);


  @override
  Widget build(BuildContext context) {
    return Container(


      alignment: Alignment.bottomRight ,
      child:
      
      
      
       IconButton(
         iconSize: 72,
          icon: const Icon(Icons.supervised_user_circle ),
          tooltip: 'Admin',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyApp()),
            );


           },
        ),
      
    );
  }
}