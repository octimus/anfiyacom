import 'dart:convert';

import 'package:anfiyacom/pages/mesures.dart';
import 'package:anfiyacom/pages/symptoms.dart';
import 'package:anfiyacom/services/covid_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import "package:anfiyacom/services/actualite.dart";
import 'actualite.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Actualite aService = new Actualite();

  CovidData cService = new CovidData();

  dynamic infos = {};

  dynamic actualites = [];

  @override
  Widget build(BuildContext context) {
    this.aService.getActualites().then((value) {
      setState(() {
        this.actualites = jsonDecode(value.body);
      });
      print(this.actualites);
    });
    this.cService.getInfoGeneral().then((value) {
      setState(() {
        this.infos = jsonDecode(value.body)[0];
      });
    });
    return Container(
      color: Colors.white10,
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Données épidémiologiques",
                            textAlign: TextAlign.start,
                          ),
                          SvgPicture.asset(
                            'assets/virus.svg',
                            width: 24,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 50,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SvgPicture.asset(
                                    'assets/virus.svg',
                                    width: 48,
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (this.infos != null) ...[
                                    Text(
                                      "${infos["nbre_cas"] ?? "..."}",
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      "Total des cas",
                                      textAlign: TextAlign.start,
                                    ),
                                  ]
                                ],
                              ),
                            ],
                          ),
                          SvgPicture.asset(
                            'assets/chart-decrease.svg',
                            color: Colors.redAccent,
                            width: 24,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 50,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SvgPicture.asset(
                                    'assets/true.svg',
                                    width: 48,
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${infos["nbre_gueris"] ?? "..."}",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  Text(
                                    "Total des gueris",
                                    textAlign: TextAlign.start,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SvgPicture.asset(
                            'assets/chart-decrease.svg',
                            color: Colors.green,
                            width: 24,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MesuresPage(),
                            ),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SvgPicture.asset(
                                    'assets/glyph-hand.svg',
                                    color: Colors.red,
                                    width: 40,
                                  ),
                                ),
                                Text(
                                  "Mesures barriers",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(
                                  "assets/mesures/cache-nez.svg",
                                  width: 25,
                                ),
                                SvgPicture.asset(
                                  "assets/mesures/lave.svg",
                                  width: 25,
                                ),
                                SvgPicture.asset(
                                  "assets/mesures/lave-mains.svg",
                                  width: 25,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      TextButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    'assets/symptomes/1.jpg',
                                    width: 32,
                                  ),
                                ),
                                Text("Symptomes de la COVID-19"),
                              ],
                            ),
                            Icon(Icons.next_plan)
                          ],
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SymptomsPage(),
                              ));
                        },
                      ),
                      SizedBox(
                        height: 12,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 800,
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    var ac = this.actualites[index];
                    return TextButton(
                      child: Card(
                        elevation: 4,
                        child: Container(
                          padding: const EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12.0),
                                child: Text(
                                  ac["titre"],
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Image.network(
                                  "https://anfiyacom.octra.io/images/" +
                                      ac["image"]),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12.0),
                                child: Text(
                                  ac["description"],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ActualitePage(
                              actualite: ac,
                            ),
                          ),
                        );
                      },
                    );
                  },
                  itemCount: this.actualites.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
