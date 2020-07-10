import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nymbeul/model/fireBaseHelper.dart';
import 'package:nymbeul/model/user.dart';

class profilPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return profilHome();
  }

}
String id;
user utilisateur;

class profilHome extends State<profilPage>{
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
    return bodyPage();
  }



  Widget bodyPage()
  {
    if(utilisateur==null)
      {
        return Container(
          padding: EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.asset('assets/senegal_amoirie.png',fit: BoxFit.fill,),
          

        );
      }
    else
      {
        return Center(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(10)),
              Text(utilisateur.mail),
              Padding(padding: EdgeInsets.all(10)),
              Text(utilisateur.nom),
              Padding(padding: EdgeInsets.all(10)),
              Text(utilisateur.prenom),
              Padding(padding: EdgeInsets.all(10)),
              Text(utilisateur.login),

            ],
          )
        );

      }
  }

}