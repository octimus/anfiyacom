import 'package:anfiyacom/components/symptome.dart';
import 'package:anfiyacom/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MesuresPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Mesures barrières",
          style: TextStyle(color: Colors.black54),
        ),
        iconTheme: IconThemeData(color: Colors.black54),
        backgroundColor: Colors.white,
        foregroundColor: Color(0x7f7b7b),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 15),
        child: SafeArea(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Mesure(
                      title: "Se laver les mains\n régulièrement",
                      img: "assets/mesures/lave.svg",
                    ),
                    Mesure(
                      title:
                          "Garder une distance\nd'un mètre avec les\n autres",
                      img: "assets/mesures/distance.svg",
                    ),
                    Mesure(
                      title: "Eternuer ou tousser\ndans son coude",
                      img: "assets/mesures/cache-nez.svg",
                    ),
                    Mesure(
                      title: "Utiliser un mouchoir\n usage unique",
                      img: "assets/mesures/lave-mains.svg",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Mesure extends StatelessWidget {
  String title = "";
  String img = "";

  Mesure({this.title, this.img});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(
            img,
            width: 100,
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 22.0,
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
