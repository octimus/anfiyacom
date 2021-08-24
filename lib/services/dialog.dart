import 'package:flutter/material.dart';

class OctiDialog {
  BuildContext context;
  OctiDialog({this.context});
  bool runTimer = true;

  void openDialog(Widget title, Widget content, List<Widget> buttons) {
    // flutter defined function
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0))),
          title: title,
          content: Container(
            child: content,
          ),
          actions: buttons,
        );
      },
    ).then((value) {
      print("dialog response : " + value);
    }).catchError((onError) {
      print("show dialog error : " + onError.toString());
    });
  }

  Future<dynamic> dismiss() {
    runTimer = false;
    try {
      Navigator.of(context).pop();
    } catch (e, s) {
      print("erreur dismissing, retrying ...");
      Navigator.of(context).pop();
      print(e.toString());
      print(s.toString());
    }
    print("ttt");
  }

  Future<dynamic> show(Text title, Text body,
      [List<Widget> buttons, Function timerCallback]) {
    if (buttons == null && timerCallback != null) {
      buttons = [];
    } else {
      buttons = [
        RaisedButton(
          color: Colors.red,
          child: Text(
            "Fermer",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ];
    }

    Widget content = Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          body,
        ],
      ),
    );

    // flutter defined function
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: title,
          content: content,
          actions: buttons,
        );
      },
    );
  }
}
