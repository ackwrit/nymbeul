import 'package:firebase_database/firebase_database.dart';

class message{

  String titre;
  String contenu;
  DateTime temps;
  String typeAnnonce;
  String idUser;
  String uid;
  message(DataSnapshot snapshot)
  {
    uid=snapshot.key;
    Map map =snapshot.value;
    map["titre"]=titre;
    map["contenu"]=contenu;
    map["Date"]=DateTime.now();
   map["typeAnnonce"]=typeAnnonce;
    map["ideUser"]=idUser;


  }

  Map toMap()
  {
  return {
  "titre":titre,
    "contenu":contenu,
    "Date":temps,
    "typeAnnonce":typeAnnonce,
    "uid":uid

  };
}
}