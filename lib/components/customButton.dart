import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class CustomButton extends StatelessWidget {
  final Color color;
  final String txt;
  final Function onPressed;
  IconData iconData;

  CustomButton({
    @required this.color,
    @required this.txt,
    @required this.onPressed,
    this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (iconData != null) ...[
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 8.0, 0),
                child: Icon(
                  iconData,
                  color: Colors.white,
                ),
              ),
            ],
            Text(
              txt,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
        decoration: kButtonDecoration.copyWith(
          color: color,
        ),
        height: 60,
      ),
    );
  }
}

class RoundedButtonFacebook extends CustomButton {
  RoundedButtonFacebook();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image(
            width: 50.0,
            image: AssetImage("images/icons/facebook_logo.png"),
          ),
          Text(
            "CONNEXION PAR FACEBOOK",
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.0,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Color(0xFF3479E8),
        borderRadius: BorderRadius.all(
          Radius.circular(50.0),
        ),
      ),
      height: kItemHeight,
      width: kItemWidth,
    );
  }
}
