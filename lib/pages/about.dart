import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("À propos de nous"),
      ),
      body: Container(
        child: Column(
          children: [
            Image.asset("assets/cover.jpg"),
            SizedBox(
              height: 20,
            ),
            Text(
                "Le projet a pour objectif Création d'une plateforme solidaire entre les femmes des communautés les plus vulnérables et les femmes entrepreneures en zone urbaine, afin de répondre aux défis induits par la crise du COVID19, et notamment ceux liés à l’insécurité alimentaire.\n\nLa plateforme cible les femmes entrepreneures et les femmes rurales surtout les personnes les plus vulnérables tous secteurs confondus, afin de leur permettre de développer leurs activités à travers la plateforme et d’avoir une meilleure visibilité ou une cartographie des produits et services dans l’ensemble du territoire. Ainsi sera initié la mise en place d’une économie solidaire, formelle et plus résiliente.")
          ],
        ),
      ),
    );
  }
}
