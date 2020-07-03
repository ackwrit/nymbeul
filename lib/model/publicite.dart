import 'package:firebase_database/firebase_database.dart';

class publicite{

  String datedebut;
  String datefin;
  String titre;
  String image;
  String uid;


  publicite(DataSnapshot snapshot)
  {
    uid=snapshot.key;
    Map map =snapshot.value;
    titre=map["titre"];
    datedebut=map["dateDebut"];
    //map["Date"]=DateTime.now().toIso8601String();
    datefin=map["datefin"];

    image =map['image'];


  }

  Map toMap()
  {
    return {
      "titre":titre,
      "dateDebut":datedebut,
      //"Date":temps,
      "datefin":datefin,
      "uid":uid,
      "image":image

    };
  }
}