import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nymbeul/Controller/adminPage.dart';
import 'package:nymbeul/Controller/administrationController.dart';
import 'package:nymbeul/Controller/registerController.dart';
import 'package:nymbeul/Controller/transportController.dart';
import 'package:flutter/cupertino.dart';
import 'package:nymbeul/main.dart';
import 'package:nymbeul/model/fireBaseHelper.dart';

import 'adresseController.dart';
import 'annonceController.dart';
import 'loisirController.dart';

class connexionController extends StatefulWidget{
  int valeur;
  connexionController({int valeur})
  {
    this.valeur=valeur;
  }
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _connexion();
  }

}

class _connexion extends State<connexionController>
{
  String _password;
  String _adresseMail;
  bool connnected;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text('Nymbeul'),

      ),
      body: body(),

    );
  }




  Widget body(){

    return new SingleChildScrollView(
        child: new Center(
            child:new Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                (widget.valeur==1)? affichageSnackBar():Container(),
                new Container(
                  height: MediaQuery.of(context).size.height/2,
                  width: MediaQuery.of(context).size.width/1.2,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new TextField(
                        onChanged: (text){
                          setState(() {
                            _adresseMail=text;
                          });
                        },
                        decoration: InputDecoration(
                            labelText: 'mail',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular((20))
                            ),
                            prefixIcon: new Icon(Icons.mail)
                        ),
                        showCursor: true,

                      ),
                      Padding(
                        padding: EdgeInsets.all(25.0),
                      ),
                      new TextField(
                        onChanged: (text){
                          _password=text;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: 'password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)
                            ),
                            prefixIcon: new Icon(Icons.lock)
                        ),
                        showCursor: true,

                      ),

                    ],
                  ),

                ),
                (Platform.isIOS)?new CupertinoButton(child: new Text('Inscription'), onPressed: versRegister
                ):new RaisedButton(onPressed:versRegister,child: new Text('Inscription'),),
                (Platform.isIOS)?new CupertinoButton(child: new Text('Connexion'), onPressed:connexion):new RaisedButton(onPressed:connexion, child: new Text('Connexion'),),
              ],

            )








        )
    );

  }


  versRegister()
  {
    Navigator.push(context, new MaterialPageRoute(
        builder: (BuildContext context)
        {
          return new registerController();
        }
    ));
  }


  connexion() {
    fireBaseHelper().handleSign(_adresseMail, _password).then((FirebaseUser user){
      print("connexion effectué");
      setState(() {
        connnected=true;
      });


    }).catchError((error){
     setState(() {
       connnected=false;
     });

    });
    if(connnected==true) {
      Navigator.push(context, new MaterialPageRoute(
          builder: (BuildContext context) {
            return adminPage();
          }
      ));
    }
    if(connnected==false)
      {
        alerte("Login ou mot de passe incorrect");
        setState(() {
          _adresseMail="";
          _password="";
        });

      }
  }



  affichageSnackBar()
  {

    return Container(
        padding: EdgeInsets.all(15),
        child:Text('Pour pouvoir déposer une annonce, merci de vous inscrire ou vous connecter',style: TextStyle(fontSize: 20),)
    );



  }


  Future <void> alerte(String message) async{
    String titre = "Erreur de connexion";
    String soustitre= message;
    return showDialog
      (
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context)
        {
          return (Theme.of(context).platform==TargetPlatform.iOS)
              ?CupertinoAlertDialog(title: Text(titre),content: Text(message),actions: [
            FlatButton(
                onPressed: ()=>Navigator.of(context).pop(),
                child: Text('OK')
            )
          ],)
              :AlertDialog(title: Text(titre),content: Text(soustitre),actions: [
            FlatButton(
                onPressed: ()=>Navigator.of(context).pop(),
                child: Text('OK')
            )
          ],);
        }

    );

  }


  Future <Null> showDialogue() async {
    return  showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context)
        {
          return AlertDialog(
            title: Text('Identification'),
            content: Text('Pour pouvoir déposer une annonce, merci de vous inscrire ou vous connecter'),
            actions: [
              FlatButton(
                onPressed: ()
                {
                  Navigator.pop(context);
                },
                child: Text("OK"),
              )
            ],
          );
        }


    );

  }








  List <Widget> controllers (){
    return [
      new administrationController(),
      new adresseController(),
      new loisirController(),
      new transportController(),
      new annonceController(),


    ];

  }


}