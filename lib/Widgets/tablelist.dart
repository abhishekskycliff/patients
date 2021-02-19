import 'package:flutter/material.dart';

class TableList extends StatelessWidget {
  var text1, text2;

  TableList({this.text1, this.text2});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.45,
            //color: Colors.blue,
            child: Text(
              text1,
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.23,
            // color: Colors.blue,
            child: Text(
              text2,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      margin: const EdgeInsets.only(bottom: 20),
    );
  }
}
