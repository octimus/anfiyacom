import 'package:anfiyacom/components/symptome.dart';
import 'package:anfiyacom/constants/app_constants.dart';
import 'package:flutter/material.dart';

class SymptomsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Symptômes",
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
                Center(
                  child: Text(
                    "Les symptômes de la COVID-19",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Symptome(
                      text: "Fièvre",
                      img: "assets/symptomes/7.jpg",
                    ),
                    Symptome(
                      text: "Toux",
                      img: "assets/symptomes/1.jpg",
                    ),
                    Symptome(
                      text: "Nez qui coule",
                      img: "assets/symptomes/2.jpg",
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Symptome(
                      text: "Douleurs musculaires",
                      img: "assets/symptomes/3.jpg",
                    ),
                    Symptome(
                      text: "Maux de gorge",
                      img: "assets/symptomes/4.jpg",
                    ),
                    Symptome(
                      text: "Essoufflement",
                      img: "assets/symptomes/5.jpg",
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Symptome(
                      text: "Perte de l'odorat",
                      img: "assets/symptomes/6.jpg",
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
