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
                  child: Text('Item 1'),
                  value: 'one',
                ),
              DropdownMenuItem<String>(
                child: Text('Item 2'),
                value: 'two',
              ),
              DropdownMenuItem<String>(
                child: Text('Item 3'),
                value: 'three',
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