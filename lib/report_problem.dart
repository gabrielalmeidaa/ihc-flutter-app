// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:ihc_project/details.dart';
import 'package:ihc_project/dropdown_list.dart';
import 'package:ihc_project/main.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ReportProblemScreen extends StatelessWidget {

  var currIndex = 0;

  ReportProblemScreen(idNum){
    currIndex = idNum;
  }

  Widget textSection = Container(
  padding: const EdgeInsets.all(32),
  child: Text(
    'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.',
    softWrap: true,
    ),
  );

  Widget buildTitleSection(name){
    return Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Escolha o problema ocorrido na lista abaixo!',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                )
              ],
            ),
          ),
          /*3*/
        ],
      ),
    );
  } 

  @override
  Widget build(BuildContext context) {

    Widget buttonSection = Container(
      padding: const EdgeInsets.only(top: 20) ,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ButtonBar(
            children: [
              FlatButton(child: Text("Voltar"), onPressed: () {Navigator.pop(context);},),
              RaisedButton(
                child: Text("Concluir", style: TextStyle(color: Colors.white)),
                color: Colors.green[500], 
                onPressed: () {
                  Alert(
                    context: context,
                    type: AlertType.success,
                    title: "Parabéns",
                    desc: "Operação realizada com sucesso!",
                    buttons: [
                      DialogButton(
                        color: Colors.green[500],
                        child: Text(
                          "OK",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () {
                         Navigator.pop(context);
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) => DetailScreen(currIndex))
                          );
                        },
                        width: 120,
                      )
                    ],
                  ).show();
                },
              )
            ]
          )
        ],
      ),
    );

    return MaterialApp(
      title: 'Reportar Problema',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Reportar Problema'),
        ),
        body: ListView(
          children: [
            Image.asset(
              dataInstance.itemPictures[currIndex],
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            buildTitleSection(dataInstance.itemNames[currIndex]),
            DropdownWidget(),
            buttonSection,
          ],
        ),
      ),
    );
  }   
}