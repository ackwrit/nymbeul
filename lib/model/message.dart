import 'package:firebase_database/firebase_database.dart';

class message{

  String titre;
  String contenu;
  String temps;
  String typeAnnonce;
  String idUser;
  String uid;
  String validate;
  String image1;
  String image2;
  String image3;

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
    image1 =map['image1'];
    image2 =map['image2'];
    image3 =map['image3'];


  }

  Map toMap()
  {
  return {
  "titre":titre,
    "contenu":contenu,
    //"Date":temps,
    "typeAnnonce":typeAnnonce,
    "uid":uid,
    "validation":validate,
    "image1":image1,
    "image2":image2,
    "image3":image3,

  };
}
}