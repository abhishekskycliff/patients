import 'package:doctorapp/values/strings/strings.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ContainerWidget extends StatelessWidget{

  var textvalue,icon;
  ContainerWidget({this.textvalue, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 40, right: 40, top: 20),
      color: HexColor("#FBE4D2"),
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.blue,
            size: 40,
          ),
          SizedBox(
            width: 30,
          ),
          Text(
            textvalue,
            style: TextStyle(
              color: Colors.blue,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }

}