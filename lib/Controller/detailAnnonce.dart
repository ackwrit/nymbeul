
import 'package:flutter/material.dart';
import 'package:nymbeul/Controller/adminPage.dart';
import 'package:nymbeul/Controller/validationAnnonce.dart';
import 'package:nymbeul/model/fireBaseHelper.dart';
import 'package:nymbeul/model/message.dart';
import 'package:nymbeul/widget/annonce.dart';

class detailAnnonce extends StatefulWidget{
  message annonce;
  bool validate;

  detailAnnonce({message annonce,bool validate}){
    this.annonce = annonce;
    this.validate=validate;
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
        title: (widget.validate==false)?Text("Validation d'annonce"):Text("Liste d'annonce"),
        backgroundColor: Colors.blue,

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


            (widget.validate==false)?FlatButton(
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
                child: Text("Validation de l'annonce")):Container()

          ],
        ),
      ),

    );
  }

}
