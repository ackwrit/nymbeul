import 'package:firebase_database/firebase_database.dart';

class user
{
  String id;
  String prenom;
  String nom;
  String login;
  String imageUrl;
  String mail;
  String typeUser;

  user(DataSnapshot snapshot){
    id=snapshot.key;
    Map map = snapshot.value;
    prenom = map["prenom"];
    nom = map["nom"];
    login = map["login"];
    imageUrl = map["imageUrl"];
    mail = map["mail"];
    typeUser =map["typeUser"];



  }

  Map toMap(){
    return {
      "prenom":prenom,
      "nom":nom,
      "login":login,
      "nom":nom,
      "imageUrl":imageUrl,
      "uid":id,
      "mail":mail,
      "typeUser":typeUser


    };
  }

}