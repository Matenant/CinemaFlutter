import 'dart:convert';
import 'dart:io';
import 'package:http/io_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;

class Menu extends StatelessWidget {
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: <Widget>[
        DrawerHeader(
          child: Text("Cinema"),
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
        ),
        ListTile(
          leading: new Icon(Icons.person_outline),
          title: Text("Acteurs"),
        ),
        ListTile(
          leading: new Icon(Icons.local_movies_rounded),
          title: Text("Films"),
        ),
        ListTile(
          leading: new Icon(Icons.money),
          title: Text("Acheter"),
        ),
        ListTile(
          leading: new Icon(Icons.monetization_on_rounded),
          title: Text("Vendre"),
        ),
      ],
    ));
  }
}
