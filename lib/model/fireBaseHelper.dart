import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:nymbeul/model/message.dart';
import 'dart:async';
import 'package:nymbeul/model/user.dart';

class fireBaseHelper {
  //autenthification

  final auth=FirebaseAuth.instance;

  Future <FirebaseUser> handleSign(String mail,String password) async
  {
    final AuthResult userAuth = await auth.signInWithEmailAndPassword(email: mail, password: password);
    FirebaseUser user=userAuth.user;
    return user;
  }

  Future <FirebaseUser> handleCreate(String mail,String password,String prenom, String nom,String login) async
  {
    final AuthResult userAuth = await auth.createUserWithEmailAndPassword(email: mail, password: password);
    FirebaseUser user = userAuth.user;
    String uid=user.uid;
    Map map =
    {
      "prenom":prenom,
      "nom":nom,
      "login":login,
      "nom":nom,
      "imageUrl":'',
      "uid":uid,
      "mail":mail,
      "typeUser":'particulier'

    };
    addUsers(uid, map);
    return user;


  }

  Future<String> myId() async{
    FirebaseUser user = await auth.currentUser();
    return user.uid;


  }









  //Database

  static final base=FirebaseDatabase.instance.reference();
  final base_user=base.child("users");
  final base_message =base.child("messages");


  addUsers(String uid,Map map)
  {
    base_user.child(uid).set(map);
  }


  deleteMessage(String uid){
    base_message.child(uid).remove();
  }

  sendMessage(String titre, String contenu, String monId,String typeAnnonce,String validate)
  {
    String uid = monId+DateTime.now().millisecondsSinceEpoch.toString();
    String date = DateTime.now().millisecondsSinceEpoch.toString();
    Map map ={
      "idUser":monId,
      "titre":titre,
      "contenu":contenu,
      "typeAnnonce":typeAnnonce,
      "date":date,
      "uid":uid,
      "validation":validate

    };
    base_message.child(uid).set(map);

  }


  Future<user> getUser(String uid) async
  {
    DataSnapshot snapshot = await base_user.child(uid).once();
    return user(snapshot);
  }




}