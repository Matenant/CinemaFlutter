import 'dart:convert';
import 'dart:io';
import 'package:http/io_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'drawer.dart';

class ActorDetailPage extends StatefulWidget {
  final String actorID;
  ActorDetailPage(this.actorID);

  @override
  ActorDetailPageState createState() => new ActorDetailPageState();
}

class ActorDetailPageState extends State<ActorDetailPage> {
  List films;
  Future<String> getData() async {
    final ioc = new HttpClient();
    ioc.badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
    final http = new IOClient(ioc);

    var reponse =
        await http.get("https://iutsd.zapto.org/api/actor/${widget.actorID}");

    this.setState(() {
      var acteur = json.decode(reponse.body);
      films = List.from(acteur["data"]["roles"]);
    });
    return "ok";
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
          itemCount: films == null ? 0 : films.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: CircleAvatar(
                radius: 18,
                child: ClipOval(
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/loading.gif',
                    image:
                        "https://res.cloudinary.com/lp-amio/image/upload/v1602711916/movie/${films[index]["id"]}",
                  ),
                ),
              ),
              title: Text(films[index]["title_original"]),
              subtitle: Text(films[index]["year"]),
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
