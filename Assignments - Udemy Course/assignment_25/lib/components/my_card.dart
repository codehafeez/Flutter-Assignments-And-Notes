import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {

  MyCard({required this.icon, required this.labelTxt});
  final IconData icon;
  final String labelTxt;

  @override
  Widget build(BuildContext context) {
    return
      Row(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.all(15),
              child: Column(
                children: [
                  SizedBox(height:40),
                  Icon(
                    icon,
                    size: 80,
                  ),
                  Text(
                    labelTxt,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 200,
              width: 170,
            ),
          ),
        ],
      );
  }
}
