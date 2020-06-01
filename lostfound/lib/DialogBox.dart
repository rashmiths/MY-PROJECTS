import 'package:flutter/material.dart';

class DialogBox
{
  information(BuildContext context,String name,String phoneno,String location)
  {
    return showDialog(
        context: context,
        barrierDismissible: true,

      builder: (BuildContext context)
        {
          return AlertDialog
            (
            title: Text(name),
            content: SingleChildScrollView(
              child: ListBody
                (
                children: <Widget>[
                  Text(phoneno),
                  Text(location),
                ],
              ),
            ),

            actions: <Widget>[
              FlatButton(
                child: Text("OK"),
                onPressed: ()
                {
                  return Navigator.pop(context);
                },

              )
            ],

          );
        }

    );

  }
}