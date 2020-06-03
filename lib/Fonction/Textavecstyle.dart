import 'package:flutter/material.dart';

class Textavecstyle
{
  String text;
  double taille=20.0;
  Color couleur=Colors.black;
  FontWeight fontWeight=FontWeight.normal;
  TextAlign positionText = TextAlign.justify;








  Textavecstyle(text,{double taille,Color couleur,FontWeight font, TextAlign positiontext})
  {
    this.text=text;
    this.taille=taille;
    this.couleur=couleur;
    this.fontWeight=font;
    this.positionText=positiontext;

  }


  Widget affichage(){
    return new Text(this.text,
      style: new TextStyle(
        color: this.couleur,
        fontSize: this.taille,
        fontWeight: this.fontWeight,
      ),
      textAlign: this.positionText,
    );
  }





}

