import 'package:flutter/material.dart';
import 'package:nymbeul/main.dart';
import 'package:nymbeul/model/fireBaseHelper.dart';
import 'package:nymbeul/model/user.dart';

class ajouterAnnonce extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return homeAjouter();
  }

}

class homeAjouter extends State<ajouterAnnonce>{
  List<String>annonceListing=["Jobs","Les offres de service","Evènements Religieux","Annonce diverses","Concours","Préfecture","Mairie","Commissariat","Hopitaux","Pharmacie","Ecoles et Institutions","Banques","Bars et Restaurants","Parcs et Jardins","Evènements culturels et Sportifs","Divers"];
  String dropdownValue='Jobs';
  String titre;
  String contenu,identifiant,uid;
  user moi;
  String valeur="oui";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fireBaseHelper().myId().then((uid)
    {
      setState(() {
        identifiant=uid;
      });
      fireBaseHelper().getUser(identifiant).then((user)
      {
        setState(() {
          moi=user;
        });

      });

    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return bodyPage();
  }


  Widget bodyPage(){
    return new Container(
        padding: EdgeInsets.all(20),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("Type d'annonce"),
            DropdownButton(
                onChanged: (String newValue){
                  setState(() {
                    dropdownValue =newValue;
                  });
                },
                value: dropdownValue,
                items:annonceListing.map<DropdownMenuItem<String>>((String value){
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value,textAlign: TextAlign.center,),
                  );

                }).toList()
            ),


            TextField(
              textAlign: TextAlign.center,
              onChanged: (String text)
              {
                setState(() {
                  titre=text;
                });

              },


              decoration: InputDecoration(




                hintText: 'Entrer votre titre',

                filled: true,
                fillColor: Colors.white,


                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),

                ),




              ),



            ),
            TextField(
              onChanged: (String text){
                setState(() {
                  contenu =text;
                });
              },
              textAlign: TextAlign.center,
              maxLines: 4,


              decoration: InputDecoration(




                hintText: 'Entrer votre annonce',

                filled: true,
                fillColor: Colors.white,


                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),

                ),




              ),



            ),
            RaisedButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              onPressed: (){
                if(moi.typeUser!='admin')
                  {
                    setState(() {
                      valeur='non';
                    });
                  }
                fireBaseHelper().sendMessage(titre, contenu, "biMb8CGSbhT7vE4Tbkgbgfkby52ATPenevg1", dropdownValue,valeur);
                Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context){
                      return MyApp();
                    }
                ));


              },
              child: Text('Enregistrer'),
            )
          ],

        )
    );
  }

}