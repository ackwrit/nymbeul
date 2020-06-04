
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nymbeul/model/message.dart';

class detailAnnonceController extends StatefulWidget{
  message annonce;
  detailAnnonceController({message mess}){
    annonce = mess;
  }
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return homeDetailAnn();
  }

}

class homeDetailAnn extends State<detailAnnonceController>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: bodyPage(),
    );
  }



  Widget bodyPage(){
    return new Container(
      padding: EdgeInsets.all(20),
      child: Center(
        child: Column(
          children: [
            Text(widget.annonce.titre,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            Padding(padding: EdgeInsets.all(10)),
            Text(widget.annonce.contenu,style: TextStyle(fontStyle: FontStyle.italic,fontSize: 20),),

          ],
        ),
      )
    );
  }

}