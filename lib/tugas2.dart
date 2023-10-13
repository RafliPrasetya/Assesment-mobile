import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drakor Saat Ini',
      home: Scaffold(
          backgroundColor: Color.fromARGB(255, 251, 206, 202),
          appBar: AppBar(
            title: Text('Drakor '),
            backgroundColor: Color.fromARGB(255, 69, 60, 98),
          ),
          body: Column(
            children: <Widget>[
              Image.network(
                  'https://1.bp.blogspot.com/-Gea54DA0u3g/Xv18-emL3II/AAAAAAAAHmE/s9mBlcXnHDsW4MU6D0Knr13CG8G0LSN1gCLcBGAsYHQ/s1600/Its%2BOkay%2Bto%2BNot%2BBe%2BOkay%2Bepisode%2B1.jpg'),
              Text(
                'Its Okay to Not Be Okay',
                style:
                    TextStyle(fontSize: 24, fontFamily: "Serif", height: 2.0),
              ),
              Text('By RafLee'),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Image.network(
                      'https://akcdn.detik.net.id/visual/2020/06/10/its-okay-to-not-be-okay_169.jpeg?w=650'),
                  Image.network(
                      'https://akcdn.detik.net.id/visual/2020/08/09/its-okay-to-not-be-okay_43.jpeg?w=720&q=90'),
                ],
              )
            ],
          )),
    );
  }
}
