import 'package:anfiyacom/components/customButton.dart';
import 'package:anfiyacom/components/textField.dart';
import 'package:flutter/material.dart';

class Add extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              image: AssetImage("assets/covid-19-5321659_960_720.png"),
              width: 128,
            ),
            CustomTextField(hint: "Nom", onChanged: (value) {}),
            CustomTextField(hint: "Prénom", onChanged: (value) {}),
            CustomTextField(hint: "Numéro de téléphone", onChanged: (value) {}),
            CustomTextField(hint: "NIN", onChanged: (value) {}),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Né(e) le "),
                Padding(
                  child: Container(
                    child: CustomTextField(hint: "jj", onChanged: () {}),
                    width: 50,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 12),
                ),
                Padding(
                  child: Container(
                    child: CustomTextField(hint: "mm", onChanged: () {}),
                    width: 50,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 12),
                ),
                Padding(
                  child: Container(
                    child: CustomTextField(hint: "aa", onChanged: () {}),
                    width: 50,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 12),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Sexe"),
                DropdownButton(
                  items: [
                    DropdownMenuItem(
                      value: "féminin",
                      child: Container(
                        child: Text("Féminin"),
                      ),
                    ),
                    DropdownMenuItem(
                      value: "masculin",
                      child: Container(
                        child: Text("Masculin"),
                      ),
                    ),
                  ],
                  onChanged: (value) {},
                ),
              ],
            ),
            CustomButton(
              txt: "Enregistrer",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
