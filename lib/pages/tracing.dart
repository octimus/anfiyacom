import 'dart:convert';
import 'dart:typed_data';

import 'package:anfiyacom/contacts_utils.dart';
import 'package:anfiyacom/services/covid_data.dart';
import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:http/http.dart';
import 'package:permission_handler/permission_handler.dart';

class Tracing extends StatefulWidget {
  @override
  _TracingState createState() => _TracingState();
}

class _TracingState extends State<Tracing> {
  List<dynamic> contamines = [];
  CovidData covid = CovidData();
  void initState() {
    super.initState();
    askContactsPermission().then((value) => {});
    this.covid.getContamines().then((value) {
      this.contamines = jsonDecode(value.body);
      print(this.contamines);
    });
  }

  String message = "";
  Iterable<Contact> contacts = [];
  bool loading = true;
  void getContacts() async {
    // Get all contacts on device
    // contacts = await ContactsService.getContacts();

    // Get all contacts without thumbnail (faster)
    Iterable<Contact> listContacts =
        await ContactsService.getContacts(withThumbnails: true);
    setState(() {
      loading = false;
      contacts = listContacts;
    });

    print(listContacts);
  }

  Future askContactsPermission() async {
    final permission = await ContactUtils.getContactPermission();
    switch (permission) {
      case PermissionStatus.granted:
        getContacts();
        break;
      case PermissionStatus.permanentlyDenied:
        setState(() {
          this.message =
              "Nous n'avons pas la permission d'accèder à vos contacts";
        });
        ;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: loading
          ? Column(
              children: [
                Image.asset(
                  "assets/scan.gif",
                  height: 250,
                  width: 250,
                ),
                Text("Nous scannons vos contactes...")
              ],
            )
          : ListView.builder(
              itemBuilder: (BuildContext context, i) {
                Contact c = contacts.elementAt(i);
                print(c.avatar);
                return ListTile(
                  leading: c.avatar.length > 0
                      ? Image.memory(c.avatar)
                      : Icon(Icons.people),
                  title: Text(c.displayName ?? ""),
                  subtitle: Text(c.phones.first.value ?? ""),
                  trailing: Text(
                    "non contaminé(e)",
                    style: TextStyle(color: Colors.greenAccent),
                  ),
                );
              },
              itemCount: contacts.length,
            ),
    ));
  }
}
