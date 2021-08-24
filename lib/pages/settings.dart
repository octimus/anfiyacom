import 'package:anfiyacom/components/symptome.dart';
import 'package:anfiyacom/constants/app_constants.dart';
import 'package:anfiyacom/pages/about.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Paramètres",
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
                Container(
                  height: 300.0,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      ListTile(
                        leading: SvgPicture.asset("assets/langage.svg"),
                        title: Text("Langue"),
                        subtitle: Text("Français"),
                      ),
                      ListTile(
                        leading: SvgPicture.asset("assets/info.svg"),
                        title: Text("Apropos de l'application"),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => About()));
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
