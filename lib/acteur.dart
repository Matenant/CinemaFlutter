import 'dart:convert';
import 'dart:io';
import 'package:http/io_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'film.dart';
import 'drawer.dart';

class ActorPage extends StatefulWidget {
  @override
  ActorPageState createState() => new ActorPageState();
}

class ActorPageState extends State<ActorPage> {
  List acteurs;
  Future<String> getData() async {
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);

    var reponse = await http.get("https://iutsd.zapto.org/api/actor");

    this.setState(() {
      acteurs = json.decode(reponse.body);
    });
    return "ok";
  }

  @override
  void initState() {
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cinema"),
      ),
      drawer: Menu(),
      body: Center(
        child: ListView.builder(
          itemCount: acteurs == null ? 0 : acteurs.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: CircleAvatar(
                radius: 18,
                child: ClipOval(
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/loading.gif',
                    image:
                        "https://res.cloudinary.com/lp-amio/image/upload/v1602704451/actor/${acteurs[index]["id"]}",
                  ),
                ),
              ),
              title: Text(acteurs[index]["name"]),
              subtitle: Text(acteurs[index]["dob"]),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ActorDetailPage(acteurs[index]["id"]),
                  ),
                );
              },
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            label: "Accueil",
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.person),
            label: "Compte",
          ),
        ],
      ),
    );
  }
}
