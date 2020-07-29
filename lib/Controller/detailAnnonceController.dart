
import 'package:carousel_slider/carousel_slider.dart';
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
            Padding(padding: EdgeInsets.all(20)),

            (widget.annonce.image1!=null)?
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,

              ),
               items: [widget.annonce.image1,widget.annonce.image2,widget.annonce.image3].map((e) {
                 return Builder(builder: (BuildContext context){
                   return Container(
                     height: MediaQuery.of(context).size.height/4,
                     width: MediaQuery.of(context).size.width-50,
                     child: Card(
                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                       child: Image.network(e,fit: BoxFit.fill,),

                     ),
                   );


                 });

               }).toList(),
            ):Container()

          ]
        ),
      )
    );
  }

}