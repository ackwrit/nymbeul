import 'package:flutter/material.dart';


class design
{
  String nom;
  IconData icone;

  design(String nom,IconData icon)
  {
    this.nom=nom;
    this.icone=icon;
  }

  Widget cercleBouton(double taille, Color couleur,{VoidCallback direction})
  {
    return Container(
      height:taille,
      width:taille,

      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: couleur,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(this.nom)
        ],

      ),



    );

  }



}



