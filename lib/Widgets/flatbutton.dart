import 'package:flutter/material.dart';

class Flatbutton extends StatelessWidget{

  var button,icon;

  Flatbutton({this.button,this.icon});

  @override
  Widget build(BuildContext context) {
    return     FlatButton(
      onPressed: button,
      child: Container(
        child: Icon(
          icon,
          size: 40,
          color: Colors.white,
        ),
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(50)),
        width: 70,
        height: 70,
      ),
    );
  }

}