import 'package:flutter/material.dart';
import 'package:nymbeul/Controller/adminPage.dart';
import 'package:nymbeul/Controller/adresseController.dart';
import 'package:nymbeul/Controller/loginControllerOut.dart';
import 'package:nymbeul/model/fireBaseHelper.dart';
import 'package:nymbeul/model/user.dart';

class choixLogin extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return homeChoix();
  }

}

class homeChoix extends State<choixLogin>{
  String id;
  user utilisateur;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fireBaseHelper().myId().then((uid)
    {
      setState(() {
        id=uid;
      });
      fireBaseHelper().getUser(id).then((user)
      {
        setState(() {
          utilisateur=user;
        });

      });

    });

  }

  @override
  Widget build(BuildContext context) {


    // TODO: implement build
    if(utilisateur.typeUser == null)
      {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    else
      {
        if(utilisateur.typeUser!='particulier'){
          return adminPage();
        }
        else{
          return loginControllerOut();
        }
      }


  }

}