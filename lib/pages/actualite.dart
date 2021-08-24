import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActualitePage extends StatelessWidget {
  dynamic actualite;
  ActualitePage({@required this.actualite});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(actualite != null ? actualite["titre"] : ""),
      ),
      body: SafeArea(
        child: Container(
          child: actualite != null
              ? Card(
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
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: Text(
                            actualite["titre"],
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Image.network("https://anfiyacom.octra.io/images/" +
                            actualite["image"]),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: Text(
                            actualite["description"],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              : Text("where ?"),
        ),
      ),
    );
  }
}
