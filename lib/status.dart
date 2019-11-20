import 'package:flutter/material.dart';

class ItemStatusWidget extends StatefulWidget {
  @override
  _ItemStatusWidgetState createState() => _ItemStatusWidgetState();
}

class _ItemStatusWidgetState extends State<ItemStatusWidget> {
  bool _recommended = true;

  Text _getTextComponent(){
    if (_recommended) {
      return Text(
        'Segundo avaliações recentes, o item aparenta estar em boas condições!',
        style: TextStyle(
          color: Colors.green[500],
        ),
      );
    } else {
      return Text(
        'Segundo avaliações recentes, o item NÃO aparenta estar em boas condições!',
        style: TextStyle(
          color: Colors.red[500],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return _getTextComponent();
  }
}