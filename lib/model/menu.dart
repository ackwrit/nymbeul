import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:nymbeul/Controller/administrationController.dart';
import 'package:nymbeul/Fonction/datas.dart';
import 'package:nymbeul/model/pageStrcuture.dart';


class menuInferieur
{
  int index;
  BuildContext context;
  menuInferieur(int i){
    this.index=i;
  }


  BottomNavigationBar affichage(){
    return BottomNavigationBar(
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.deepOrange,
      currentIndex: index,
      showUnselectedLabels: true,
      onTap: (select) {
      index = select;


      },
      items: menu(),
    );

  }

  void directionPage(int selection)
  {
    switch(selection)
    {
      case 0:
        print("passage switch");
       // datas("administration", context, administrationController()).push();
        break;

      default:break;
    }
  }

  }

















List <BottomNavigationBarItem>menu() {
  return [
    BottomNavigationBarItem(
      icon: Icon(Icons.account_balance),
      title: Text("Administration"),
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.local_hospital),

        title: Text("Adresses utiles")
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.landscape),
        title: Text("Loisirs")
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.directions_bus),
        title: Text("Transport")
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.comment),
        title: Text("Annonces")
    )


  ];
}