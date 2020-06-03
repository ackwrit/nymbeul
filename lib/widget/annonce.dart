import 'package:flutter/material.dart';


class annonce {
  DateTime date;
  String titre;
  String description;
  String emetteur;
  String adresse;
  String telephone;
  String image;
  annonce(@required date,@required titre, @required description,@required emmeteur,@required adresse,@required telephone,@required image){
    this.date=date;
    this.titre=titre;
    this.description=description;
    this.emetteur=emmeteur;
    this.adresse=adresse;
    this.telephone=telephone;
    this.image = image;
  }

}