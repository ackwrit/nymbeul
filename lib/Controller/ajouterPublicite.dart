import 'dart:io';

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
  String uid= randomAlphaNumeric(20);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return bodyPage();
  }



  Widget bodyPage(){
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
              fireBaseHelper().ajoutPub(uid, title, urlImage, 'dateDebut', 'datefin');
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