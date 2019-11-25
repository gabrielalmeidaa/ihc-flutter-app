import 'package:flutter/material.dart';
import 'package:ihc_project/favorite_list.dart';

class Hamburger extends StatelessWidget {

  Widget build(BuildContext context) {

    final MyCustomTextStyle = TextStyle(
      color: Colors.white,
      fontSize: 18,
    );

    return Theme(
        data: Theme.of(context).copyWith(
        canvasColor: Color(0xff6200ee),
        ),
        child: Drawer(
        child: Container(
            margin: EdgeInsets.only(top: 50),
            child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[

                /*
                DrawerHeader( child:
                    Text('Drawer Header'),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                    ),
                ),
                */

                ListTile(
                    title: Row( mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[ Icon(Icons.favorite, color: Colors.white), SizedBox(width: 25), Text("FAVORITOS", style: MyCustomTextStyle) ],),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FavoriteListWidget()),
                      );
                    },
                ),

                ListTile(
                  title: Row( mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[ Icon(Icons.attach_money, color: Colors.white), SizedBox(width: 25), Text("DOAR", style: MyCustomTextStyle) ],),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                  },
                ),

                  ListTile(
                    title: Row( mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[ Icon(Icons.settings, color: Colors.white), SizedBox(width: 25), Text("CONFIGURAÇÕES", style: MyCustomTextStyle) ],),
                    onTap: () {
                      // Update the state of the app.
                      // ...
                    },
                  ),

        ],))
    ));
  }
}