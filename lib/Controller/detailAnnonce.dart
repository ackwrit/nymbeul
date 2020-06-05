
import 'package:flutter/material.dart';
import 'package:nymbeul/Controller/adminPage.dart';
import 'package:nymbeul/model/fireBaseHelper.dart';
import 'package:nymbeul/model/message.dart';
import 'package:nymbeul/widget/annonce.dart';

class detailAnnonce extends StatefulWidget{
  message annonce;
  detailAnnonce({message annonce}){
    this.annonce = annonce;
  }
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return deailHome();
  }

}

class deailHome extends State<detailAnnonce>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[100],

      ),
      body: bodyPage(),
    );
  }





  Widget bodyPage()
  {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.all(20),),
            Text(widget.annonce.titre),
            Padding(padding: EdgeInsets.all(20),),
            Text(widget.annonce.contenu),
            Padding(padding: EdgeInsets.all(30),),


            FlatButton(
                onPressed: ()
                {
                  Map map ={
                    "uid":widget.annonce.uid,
                    "contenu":widget.annonce.contenu,
                    "date":widget.annonce.temps,
                    "idUser":widget.annonce.idUser,
                    "titre":widget.annonce.titre,
                    "typeAnnonce":widget.annonce.typeAnnonce,
                    "validation":"oui"
                  };
                  fireBaseHelper().base_message.child(widget.annonce.uid).set(map);
                  Navigator.push(context, MaterialPageRoute(
                      builder: (BuildContext context)
                          {
                            return adminPage();
                          }
                  ));

                },
                child: Text("Validation de l'annonce"))

          ],
        ),
      ),

    );
  }

}
