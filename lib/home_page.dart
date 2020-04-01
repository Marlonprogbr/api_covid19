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
    

  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      
    );
  }
}