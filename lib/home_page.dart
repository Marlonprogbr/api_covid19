import 'dart:convert';

import 'package:flutter/material.dart' ;
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

double totalCasos;
double totalMortes;
double totalCurados;
bool carregado = false;

getInfoVirus () async {
  String url = "http://coronavirusdata.herokuapp.com/";
  http.Response response;
  response = await http.get(url);
  if(response.statusCode == 200){
    var decodeJson = jsonDecode(response.body);
    return (decodeJson["paises"]["Brazil"]);
  }
}

@override
void initState(){
  super.initState();
  getInfoVirus().then((map){
   setState(() {
    totalCasos = map["totalCasos"];
    totalMortes = map ["totalMortes"];
    totalCurados = map["totalCurados"];
    carregado = true;
   });

    

  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Center(
      child: carregado ? Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text("Total de casos: " + totalCasos.toString(),
            style: TextStyle(
              fontSize: 40
            ),),
            Text("Total de mortes: " + totalMortes.toString(),
            style: TextStyle(
              fontSize: 40
            ),),
            Text("Total de curados: " + totalCurados.toString(),
            style: TextStyle(
              fontSize: 40
            ),),
            
          ],
        ),
      )
    ) 
    :Container(
      child: Text("Carregando...", style: TextStyle(
        fontSize: 50
      ),),
    ),
    ),
      
    );
  }
}