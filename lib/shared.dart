
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Alert get_basic_alert(context, alert_type, alert_title, alert_description, button_text, button_color){
  return Alert(
      context: context,
      type: alert_type,
      title: alert_title,
      desc: alert_description,
      buttons: [
        DialogButton(
          color: button_color,
          child: Text(
            button_text,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    );
}
