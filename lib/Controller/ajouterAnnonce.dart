import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:nymbeul/main.dart';
import 'package:nymbeul/model/fireBaseHelper.dart';
import 'package:nymbeul/model/user.dart';
import 'package:random_string/random_string.dart';

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
  List <File> image;
  String urlImage0,urlImage1,urlImage2;
  String alpha=randomAlphaNumeric(56);
  String beta=randomAlphaNumeric(56);
  String gama=randomAlphaNumeric(56);
  String idVariable=randomAlphaNumeric(13);


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
            (dropdownValue=='Bars et Restaurants' || dropdownValue=="Annonce diverses")

                ?RaisedButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  onPressed: imagePicker,
                  child: Text('Importer image'),
                ):
                Container(),
              

            RaisedButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              onPressed: (){
                if(moi.typeUser!='admin')
                  {
                    setState(() {
                      valeur='non';
                    });
                  }
                fireBaseHelper().sendMessage(titre, contenu, idVariable, dropdownValue,valeur,urlImage0,urlImage1,urlImage2);
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


  imagePicker() async {
    int i=0;

    image = await FilePicker.getMultiFile(
      type: FileType.image,

    );



      urlImage0 = await fireBaseHelper().savePicture(image[0], fireBaseHelper().storage_annonce.child(alpha));
      urlImage1 = await fireBaseHelper().savePicture(image[1], fireBaseHelper().storage_annonce.child(beta));
      urlImage2 = await fireBaseHelper().savePicture(image[2], fireBaseHelper().storage_annonce.child(gama));




    //Map map=moi.toMap();
    //map['image1']=urlImage0;
    //map['image2']=urlImage1;
    //map['image3']=urlImage2;
    fireBaseHelper().sendMessage(titre,contenu,idVariable,dropdownValue,valeur,urlImage0,urlImage1,urlImage2);










  }

}