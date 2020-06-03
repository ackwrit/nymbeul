import 'package:flutter/material.dart';


import 'package:nymbeul/model/herowidget.dart';
import 'package:nymbeul/widget/annonce.dart';



class detailStructure extends StatefulWidget
{
  String image;
  String description;
  String titre;
  annonce listeannonce;

  detailStructure(image,description,titre,{listeannonce}){
    this.image=image;
    this.description=description;
    this.titre=titre;
    this.listeannonce=listeannonce;

  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return detailState();
  }

}


class detailState extends State<detailStructure>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: Text(widget.titre),
        backgroundColor: Colors.blue,
        centerTitle: true,

      ),
      body: new SingleChildScrollView(
        child: new Center(
          child:  new Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.all(20)),
              Hero(tag: widget.image,
                  child: Image.asset(widget.image,height:200,width: 200,color: Colors.blueGrey,),
                

              ),
              Padding(
                padding: EdgeInsets.all(20),
              ),
              Card(
                elevation: 25.0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),

                child:   Container(
                    height: MediaQuery.of(context).size.height/2,
                    width: MediaQuery.of(context).size.width-20,

                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(widget.listeannonce.titre),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Image.asset(widget.listeannonce.image,
                              width: MediaQuery.of(context).size.width/4,
                            ),
                            new Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text('adresse : ${widget.listeannonce.adresse}'),
                                Text('Tel : ${widget.listeannonce.telephone}'),
                              ],
                            ),


                          ],
                        ),


                        Text(widget.description),

                        Text('de ${widget.listeannonce.emetteur}'),


                      ],
                    )

                ),
              ),


            ],
          ),

        ),

      )






    );
  }


}