import 'dart:convert';
import 'dart:io';
import 'package:http/io_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'acteur.dart';

void main() {
  runApp(MaterialApp(title: "Cinema", home: ActorPage()));
}



class CinemaApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: ListView(children: <Widget>[
      Container(
          height: 50,
          child: Text('Film 1',
              style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold),
              textScaleFactor: 2)),
      Container(
          height: 50,
          child: ListTile(
              leading: Image.asset('images/rambo.jpg'),
              title: Text('Rambo'),
              subtitle: Text("Sylvester Stallone"))),
      Container(
          height: 50,
          child: ListTile(
              leading: Icon(
                Icons.movie,
                color: Colors.green,
              ),
              title: Text('Rocky')))
    ]));

    /* //Basic
    Center(
        child: Text(
      "Hola chiquitito",
      textScaleFactor: 0.6,
    )); */
  }
}
