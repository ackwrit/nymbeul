
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:nymbeul/model/fireBaseHelper.dart';
import 'package:nymbeul/model/message.dart';

class listeAnnonce extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return homeListeAnnonce();
  }

}

class homeListeAnnonce extends State<listeAnnonce>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Container(
     height: MediaQuery.of(context).size.height,
     width: MediaQuery.of(context).size.width,
     child: FirebaseAnimatedList(
         query: fireBaseHelper().base_message,
         itemBuilder: (BuildContext context,DataSnapshot snapshot,Animation<double>animation,int index){
           message annon = message(snapshot);
           return ListTile(
             title: Text(annon.titre),
           );
         }
     )

   );
  }

}