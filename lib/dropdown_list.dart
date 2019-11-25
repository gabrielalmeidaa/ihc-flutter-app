import 'package:flutter/material.dart';

class DropdownWidget extends StatefulWidget {
  @override
  _DropdownWidgetState createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  var currentSelectedValue;

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.all(4) ,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DropdownButton(
            items: [
              DropdownMenuItem<String>(
                  child: Text('Item Quebrado.'),
                  value: 'one',
                ),
              DropdownMenuItem<String>(
                child: Text('Item Desligável.'),
                value: 'two',
              ),
              DropdownMenuItem<String>(
                child: Text('Item Inalcançável.'),
                value: 'three',
              ),
              DropdownMenuItem<String>(
                child: Text('Item Interditado.'),
                value: 'four',
              ),
              DropdownMenuItem<String>(
                child: Text('Item em Conserto.'),
                value: 'five',
              ),
            ],
            value: currentSelectedValue,
            hint: Text('Selecione Item'),
            onChanged: (newValue){
              setState(() {
                currentSelectedValue = newValue;
              });
            },
          )
        ],
      ),
    );
  }
}