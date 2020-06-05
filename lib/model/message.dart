import 'package:firebase_database/firebase_database.dart';

class message{

  String titre;
  String contenu;
  String temps;
  String typeAnnonce;
  String idUser;
  String uid;
  String validate;

  message(DataSnapshot snapshot)
  {
    uid=snapshot.key;
    Map map =snapshot.value;
    titre=map["titre"];
    contenu=map["contenu"];
    //map["Date"]=DateTime.now().toIso8601String();
   typeAnnonce=map["typeAnnonce"];
    idUser=map["idUser"];
    validate =map['validation'];


  }

  Map toMap()
  {
  return {
  "titre":titre,
    "contenu":contenu,
    //"Date":temps,
    "typeAnnonce":typeAnnonce,
    "uid":uid,
    "validation":validate

  };
}
}