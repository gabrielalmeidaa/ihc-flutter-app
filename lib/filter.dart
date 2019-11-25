import 'package:flutter/material.dart';
import 'package:ihc_project/homepage.dart';
import 'package:ihc_project/main.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class FiltersWidget extends StatefulWidget {
  @override
  _FiltersWidgetState createState() => _FiltersWidgetState();
}

class _FiltersWidgetState extends State<FiltersWidget> {
  bool _lights = false;
  bool _accessiblity = false;
  bool _only_bathroom = false;
  bool _only_water_fountains = false;
  bool _in_good_conditions = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SwitchListTile(
            title: const Text('Apenas Com Iluminação'),
            value: _lights,
            onChanged: (bool value) { setState(() { _lights = value; }); },
            secondary: const Icon(Icons.lightbulb_outline),
          ),
          SwitchListTile(
            title: const Text('Apenas Com Acessibilidade'),
            value: _accessiblity,
            onChanged: (bool value) { setState(() { _accessiblity = value; }); },
            secondary: const Icon(Icons.accessible_forward),
          ),
          SwitchListTile(
            title: const Text('Apenas Banheiros'),
            value: _only_bathroom,
            onChanged: (bool value) { setState(() { _only_bathroom = value; }); 
              dataInstance.only_bathrooms = value;
            },
            secondary: const Icon(Icons.wc),
          ),
          SwitchListTile(
            title: const Text('Apenas Bebedouros'),
            value: _only_water_fountains,
            onChanged: (bool value) { 
              setState(() { _only_water_fountains = value; });
              dataInstance.only_water_fountains = value;
            },
            secondary: const Icon(Icons.ac_unit),
          ),
          SwitchListTile(
            title: const Text('Apenas em Boas Condições'),
            value: _in_good_conditions,
            onChanged: (bool value) { setState(() { _in_good_conditions = value; }); 
              dataInstance.only_in_good_condition = value;
            },
            secondary: const Icon(Icons.thumb_up),
          ),
        ],
      ),
    );
  }
}

class FilterScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    Widget buttonSection = Container(
      padding: const EdgeInsets.only(top: 20) ,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ButtonBar(
            children: [
              FlatButton(child: Text("Voltar"), onPressed: () {
                Navigator.pop(context);
                dataInstance.reset_filters();
                },),
              RaisedButton(
                child: Text("Concluir", style: TextStyle(color: Colors.white)),
                color: Colors.cyan[500], 
                onPressed: () {
                  Alert(
                    context: context,
                    type: AlertType.success,
                    title: "Parabéns",
                    desc: "Filtros aplicados com sucesso!",
                    buttons: [
                      DialogButton(
                        color: Colors.cyan[500],
                        child: Text(
                          "OK",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () {
                          dataInstance.saveFilters();
                          Navigator.pop(context);
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) => HomePage())
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
      title: 'Filtros',
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              dataInstance.reset_filters();
              Navigator.popUntil(
                context, 
                (route) => route.isFirst
              );
            },
          ),
          title: Text('Filtros'),
        ),
        body: ListView(
          children: [
            FiltersWidget(),
            buttonSection
          ],
        ),
      ),
    );
  }   
}