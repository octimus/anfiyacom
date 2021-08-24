import 'package:flutter/material.dart';

class Symptome extends StatelessWidget {
  String text;
  String img;

  Symptome({this.text, this.img});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: [
          Image(
            image: AssetImage(img),
            width: 100,
          ),
          SizedBox(
            width: 100,
            child: Text(
              text,
              textAlign: TextAlign.center,
              overflow: TextOverflow.clip,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black54,
              ),
            ),
          )
        ],
      ),
    );
  }
}
