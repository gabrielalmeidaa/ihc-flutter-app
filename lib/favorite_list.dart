import 'package:flutter/material.dart';
import 'package:ihc_project/details.dart';

class FavoriteListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Favoritos';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.popUntil(
                context, 
                (route) => route.isFirst
              );
            },
          ),
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.forward),
              title: Text("UnB - Banheiro Exemplo 1"),
              subtitle: Text("A 30 metros"),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailScreen(0)),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.forward),
              title: Text("UnB - Banheiro Exemplo 3"),
              subtitle: Text("A 63 metros"),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailScreen(2)),
                );
              },
            ),

            ListTile(
              leading: Icon(Icons.forward),
              title: Text("UnB - Bebedouro Exemplo 2"),
              subtitle: Text("A 432 metros"),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailScreen(4)),
                );
              },
            ),
            
          ],
        ),
      ),
    );
  }
}