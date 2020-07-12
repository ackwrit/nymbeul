import 'dart:io';

import 'package:calendar_strip/calendar_strip.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:nymbeul/Controller/adminPage.dart';
import 'package:nymbeul/model/fireBaseHelper.dart';
import 'package:random_string/random_string.dart';


class ajouterPublicite extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return homePublicite();
  }

}


class homePublicite extends State<ajouterPublicite>{
  String title;
  File image;
  String urlImage;
  DateTime dateDebut=DateTime.now();
  DateTime dateFin = DateTime.now();
  String uid= randomAlphaNumeric(20);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return bodyPage();
  }



  Widget bodyPage(){
    return Container(
      padding: EdgeInsets.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Début de la publicité",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
         Padding(padding: EdgeInsets.all(5)),
         CalendarStrip(

             onDateSelected: (date){
               setState(() {
                 dateDebut=date;
                 dateFin=date;
               });

             }

         ),
          Padding(padding: EdgeInsets.all(15)),
          Text('Fin de la publicité',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
          Padding(padding: EdgeInsets.all(5)),
          CalendarStrip(



              onDateSelected: (date){
                dateFin=date;
              }

          ),
          Padding(padding: EdgeInsets.all(15)),
          TextField(

            decoration: InputDecoration(
              filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: 'Titre'
            ),
            onChanged: (text){
              setState(() {
                title=text;
              });

            },
          ),
          Padding(padding: EdgeInsets.all(10)),
          FlatButton(
              onPressed: imagePicker,
              child: Text('Parcourir')
          ),

          RaisedButton(
              onPressed: (){
              fireBaseHelper().ajoutPub(uid, title, urlImage, dateDebut.millisecondsSinceEpoch.toString(), dateFin.millisecondsSinceEpoch.toString());
              Navigator.push(context, MaterialPageRoute(
                  builder: (BuildContext context)
                      {
                        return adminPage();
                      }
              ));

              },
            child: Text('Enregistrer'),
          ),

        ],
      ),
      
    );
      
  }


  imagePicker() async {

      image = await FilePicker.getFile(
        type: FileType.image,
      );

      urlImage = await fireBaseHelper().savePicture(image, fireBaseHelper().storage_publicite);
      print(urlImage);




  }

}