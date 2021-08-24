import 'package:anfiyacom/pages/add.dart';
import 'package:anfiyacom/pages/centers.dart';
import 'package:anfiyacom/pages/home.dart';
import 'package:anfiyacom/pages/settings.dart';
import 'package:anfiyacom/pages/tracing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_svg/svg.dart';
import 'constants/app_constants.dart';
import 'package:bluetooth_enable/bluetooth_enable.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: app_name,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: app_name),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _current_index = 0;
  List<Widget> tabs = [
    Home(),
    // Add(),
    Tracing(),
    Centers(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Request to turn on Bluetooth within an app
    BluetoothEnable.enableBluetooth.then((value) {
      print("iiiiiiiiiii");
      print(value);
      if (value == "true") {
        FlutterBlue flutterBlue = FlutterBlue.instance;
        // Start scanning
        flutterBlue.startScan(timeout: Duration(seconds: 4));

        // Listen to scan results
        var subscription = flutterBlue.scanResults.listen((results) {
          // do something with scan results
          for (ScanResult r in results) {
            print('${r.device.name} found! rssi: ${r.rssi}');
          }
        });
        //Bluetooth has been enabled
        // Stop scanning
        flutterBlue.stopScan();
      } else if (value == "false") {
        //Bluetooth has not been enabled
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image(
              image: AssetImage('assets/efoicom.png'),
              width: 45,
            ),
            Text(
              app_name,
              style: TextStyle(color: Colors.black54),
            ),
            Row(
              children: [
                FlatButton(
                  child: Icon(
                    Icons.settings,
                    color: Colors.black54,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SettingsPage(),
                        ));
                  },
                )
              ],
            )
          ],
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black54,
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _current_index,
          backgroundColor: Colors.white,
          showUnselectedLabels: true,
          unselectedItemColor: Colors.black45,
          showSelectedLabels: true,
          selectedItemColor: Colors.greenAccent,
          selectedIconTheme: IconThemeData(color: Colors.greenAccent),
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/chart.svg',
                width: 24,
              ),
              label: 'Accueil',
            ),
            /*BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/virus-icons.svg',
                width: 24,
              ),
              label: 'Enregistrement',
            ),*/
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/radioactive.svg',
                width: 24,
              ),
              label: 'Contacts',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/map.svg',
                width: 24,
              ),
              label: 'Centres',
            ),
          ],
          onTap: (index) {
            setState(() {
              _current_index = index;
            });
          }),
      body: tabs[_current_index],
    );
  }
}
