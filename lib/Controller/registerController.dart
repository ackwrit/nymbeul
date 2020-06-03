import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:nymbeul/Controller/loisirController.dart';
import 'package:nymbeul/main.dart';
import 'package:nymbeul/model/fireBaseHelper.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';


class registerController extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new homeRegister();
  }

}

class homeRegister extends State<registerController>

{
  String mail;
  String password;
  String password2;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("NYMBEUL"),
        centerTitle: true,
      ),
      body: _body(),
    );
  }








  Widget _body()
  {
    return new Container(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new TextField(
            onChanged:(text)
            {
              setState(() {
                mail=text;

              });
            },
            decoration: InputDecoration(
              labelText: 'E-mail',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              prefixIcon: new Icon(Icons.mail),
            ),

          ),
          Padding(
            padding: EdgeInsets.all(10),
          ),
          new TextField(
            onChanged: (text)
            {
              setState(() {
                password=text;
              });
            },
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20)
              ),
              prefixIcon: new Icon(Icons.lock),
            ),

          ),
          Padding(
            padding: EdgeInsets.all(10),
          ),
          new TextField(
            onChanged: (text)
            {
              setState(() {
                password2=text;
              });
            },
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Entrer à nouveau le password',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
              ),
              prefixIcon: new Icon(Icons.lock),
            ),

          ),
          Padding(
            padding: EdgeInsets.all(10),
          ),
          new RaisedButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: Colors.blue,
            onPressed:enregistrement,
            child: new Text('Validation'),
          )
        ],

      )
    );
  }



  enregistrement()
  {
    if(verificationPassword())
      {
        print('vraie');
        fireBaseHelper().handleCreate(mail, password, '', '', '').then((FirebaseUser user){
          print("Enregistrement effectué");

        }).catchError((error){
          print("erreur lors de l'enregistrement $error");
        });
        //page login de base
        Navigator.push(context, new MaterialPageRoute(
          builder: (BuildContext context)
          {
            return loisirController();
          }
        ));


      }
    else
      {
        alerte();

      }
  }


  Future <Null> alerte() async
  {
    if(Platform.isIOS)
      {
        showDialog(
            context: context,
          barrierDismissible: true,
          builder: (BuildContext context)
            {
              return CupertinoAlertDialog(
                title: new Text('Erreur '),
                content: new Text('Les mots de passe ne sont pas identiques'),
                actions: <Widget>[
                  new FlatButton(onPressed: (){Navigator.pop(context);}, child: new Text('Ok'))
                ],

              );
            }
        );
      }
    else
      {
        showDialog(
            context: context,
          barrierDismissible: true,
          builder: (BuildContext context)
            {
              return SimpleDialog(
                title: new Text('Erreur'),
                children: <Widget>[
                  new Text('Les mots de passe ne sont pas identiques'),
                  new FlatButton(onPressed: (){Navigator.pop(context);}, child: new Text('OK'))
                ],
              );
            }
        );
      }
  }



  bool verificationPassword()
  {
    if(password==password2)
      {
        return true;
      }
    else
      {
        return false;

      }
  }

}