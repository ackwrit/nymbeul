

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:map_launcher/map_launcher.dart';

import 'package:nymbeul/Controller/detailAnnonceController.dart';
import 'package:nymbeul/Controller/detailLigne.dart';

import 'package:nymbeul/Fonction/datas.dart';

import 'package:nymbeul/model/fireBaseHelper.dart';
import 'package:nymbeul/model/herowidget.dart';

import 'package:nymbeul/model/element.dart';
import 'package:nymbeul/listing/enumeration.dart';
import 'package:nymbeul/model/message.dart';

import 'package:nymbeul/widget/annonce.dart';
import 'package:platform_maps_flutter/platform_maps_flutter.dart';


import 'ligne.dart';


class pageStructure extends StatefulWidget {

  String titre;
  Widget destination;
  pageStructure(this.titre,this.destination);





  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return structureState();
  }



}

class structureState extends State<pageStructure>{
  Position position;
  final availableMaps = MapLauncher.installedMaps;

  enumeration choix;
   List  liste=[];
   List <annonce> listeoffre=[
     annonce(DateTime.now(),'Bâtiment', 'Qualification : Maçon/ construction bâtiment ', 'Pape D.', 'Keur MBaye Fall', '773494501', 'assets/senegal_amoirie.png'),
     annonce(DateTime.now(),'Location Nuit', 'Appart /Nuit / 12 000f', 'Gerant Mame Ran', 'Yoff', '777579585', 'assets/tourisme.png'),
   ];
   List <element>listMinistere=[
     element("Interieur", "coucou", "assets/interieur.png"),
     element("Tourisme","visiter et voyager dans dakar", "assets/tourisme.png"),
     element("Justice", "coucou", "assets/justice.png"),
     element("Défense", "coucou", "assets/armee.png"),

     element("Santé", "coucou", "assets/sante.png"),
     element("Affaire étrangère","coucou",'assets/etranger.png'),
     element("économie","coucou",'assets/economie.png'),
     element("Culture","coucou",'assets/cuture.png'),
     element("Agriculture","coucou",'assets/agriculture.png'),
     
   ];

   List<ligne> listetransport =[
     ligne("1","Parcelles Place Leclerc","Assainies"),
     ligne("2","Daroukhane","Leclerc"),
     ligne("4","Dieuppeul","Allées Canard-Esso"),
     ligne("5","Guédiawaye","Av Léopold Senghor"),
     ligne("6","Cambéréne 2 ","Palais 2"),
     ligne("7","Ouakam","Palais de Justice"),
     ligne("8","Aéroport L.S.S ","Palais de justice"),
     ligne("9","Liberté 6 ","Palais 2"),
     ligne("10","Dieuppeul","Palais 2"),
     ligne("11","Keur Massar ","Lat-Dior"),
     ligne("12","Guédiawaye","Palais de Justice"),
     ligne("13","Dieuppeul","Palais 2"),
     ligne("15","Rufisque","Palais 1"),
     ligne("16 A"," Malika","Palais de justice 1"),
     ligne("16 B","Malika ","Palais 1"),
     ligne("18","Dieuppeul ","Dieuppeul"),
     ligne("20","Dieuppeul","Dieuppeul"),
     ligne("218","Dépôt Thiaroye","aéroport"),
     ligne("219","Daroukhane","Ouakam"),
     ligne("219'","Keur Massar","église"),
     ligne("228","Rufisque","Diamniadio Yenne"),
     ligne("232","Baux Maraichers","Aéroport"),




  ];


  void  choixDestination() {
    switch (widget.titre) {
      case "Ministère":
        setState(() {
          choix = enumeration.ministere;
        });
        break;
      case "Les offres de service":
        setState(() {
          choix=enumeration.lesoffresdeservice;
          
        });
        break;
      default:break;
    }
  }

  void  listeChoix()
  {
    switch (choix)
    {
      case enumeration.ministere:
        setState(() {
          liste=listMinistere;



        });
        break;
      case enumeration.lesoffresdeservice:
        setState(() {
          liste=listeoffre;
        });
        break;
      default:break;

    }

  }


   @override
   void initState() {
    // TODO: implement initState
    super.initState();
    choixDestination();
    listeChoix();
    configuration();

  }
  openMapsSheet(context) async {
    try {
      final title = "";
      final description = "";
      final coords= Coords(position.latitude, position.longitude);
      final availableMaps = await MapLauncher.installedMaps;

      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Container(
                child: Wrap(
                  children: <Widget>[
                    for (var map in availableMaps)
                      ListTile(
                        onTap: () => map.showMarker(
                          coords: coords,
                          title: title,
                          description: description,
                        ),
                        title: Text(map.mapName),
                        leading: Image(
                          image: map.icon,
                          height: 30.0,
                          width: 30.0,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: (widget.titre=='Dakar en transport -DEM DIK'|| widget.titre=="Dakar en voiture")?Text('${widget.titre}'):Text(widget.titre),
        backgroundColor: Colors.blue,

      ),
      body:(widget.titre=='Dakar en transport -DEM DIK' || widget.titre=='Dakar en voiture')?choixBody():body()

    );
  }


  ListTile tile (BuildContext context,ligne sections)
  {
    return ListTile(
      leading: Text("Ligne n° ${sections.numeroLigne}"),
      title: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(sections.depart),
          Icon(Icons.swap_horiz,),
          Text(sections.terminus)

        ],
      ),


      trailing: Icon(Icons.arrow_forward_ios),
      onTap: ()
      {
        _DetailLigne(sections);
      },
    );
  }



  configuration() async {
    position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);


  }

  _DetailLigne(ligne sections)
  {
    Navigator.push(context, new MaterialPageRoute
      (
        builder: (BuildContext context){
          return detailLigne(sections);
        }
    ));
  }

  Widget choixBody()
  {
    if(widget.titre=="Dakar en transport -DEM DIK")
      {
        return _BodyList();
      }
    if(widget.titre=='Dakar en voiture'){
      return launcherMap();
    }
  }


  Widget launcherMap()
  {
    return Center(
        child: Builder(
      builder: (context) {
        return Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height/1.5,
              child: PlatformMap(
                initialCameraPosition : CameraPosition(
                  target: LatLng(0, 0),
                ),
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                onMapCreated: (controller){
                  Future.delayed(Duration(seconds: 5)).then((_)
                  {
                    controller.animateCamera(
                        CameraUpdate.newCameraPosition(
                            CameraPosition(
                              target: LatLng(position.latitude, position.longitude),
                              zoom:14.0,
                            ))
                    );
                  });
                },

              ),
            ),


            MaterialButton(
              onPressed: () => openMapsSheet(context),
              child: Text('Où souhaitez-vous aller ? '),
            )
          ],
        );

      },
    ));
  }
Widget _BodyList()
{
  return Container(
    child: ListView.separated(
        itemBuilder: (BuildContext context,int index){
          return tile(context,listetransport[index]);

  },
      itemCount: listetransport.length,
      separatorBuilder: (context,index){
        return Divider(
          thickness: 1,
          color: Colors.orange,
        );
      },
    )
  );
}
  Widget body()
  {
    if(widget.titre == 'Jobs')
      {
       return FirebaseAnimatedList(
         query: fireBaseHelper().base_message,
         itemBuilder: (BuildContext context,DataSnapshot snapshot,Animation <double> animation,int index){
           message mess =message(snapshot);
           if(mess.typeAnnonce==widget.titre && mess.validate!='non'){
             return Card(
               child: ListTile(
                 title: Text(mess.titre),
                 trailing: IconButton(icon: Icon(Icons.info), onPressed: ()
                 {
                   Navigator.push(context, MaterialPageRoute(
                       builder: (BuildContext context)
                           {
                             return detailAnnonceController(mess: mess,);
                           }
                   ));
                 }
                 ),
               ),
             );
           }
           else{
             return Container();
           }
         },
       );
      }
    if(widget.titre == 'Les offres de service')
      {
        return FirebaseAnimatedList(
          query: fireBaseHelper().base_message,
          itemBuilder: (BuildContext context,DataSnapshot snapshot,Animation <double> animation,int index){
            message mess =message(snapshot);

            if(mess.typeAnnonce==widget.titre && mess.validate!='non'){
            return Card(
              child: ListTile(
                title: Text(mess.titre),
                trailing: IconButton(icon: Icon(Icons.info), onPressed: ()
                {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (BuildContext context)
                      {
                        return detailAnnonceController(mess: mess,);
                      }
                  ));
                }
                ),
              ),
            );
            }
            else{
              return Container();
            }
          },
        );


      }
    if(widget.titre=='Evènements Religieux')
      {
        return FirebaseAnimatedList(
          query: fireBaseHelper().base_message,
          itemBuilder: (BuildContext context,DataSnapshot snapshot,Animation <double> animation,int index){
            message mess =message(snapshot);
            if(mess.typeAnnonce==widget.titre && mess.validate!='non'){
            return Card(
              child: ListTile(
                title: Text(mess.titre),
                trailing: IconButton(icon: Icon(Icons.info), onPressed: ()
                {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (BuildContext context)
                      {
                        return detailAnnonceController(mess: mess,);
                      }
                  ));
                }
                ),
              ),
            );
            }
            else
              {
                return Container();
              }
          },
        );
      }
    if(widget.titre =='Annonces diverses')
      {

        return FirebaseAnimatedList(
          query: fireBaseHelper().base_message,
          itemBuilder: (BuildContext context,DataSnapshot snapshot,Animation <double> animation,int index){
            message mess =message(snapshot);
            if(mess.typeAnnonce==widget.titre && mess.validate!='non'){
            return Card(
              child: ListTile(
                title: Text(mess.titre),
                trailing: IconButton(icon: Icon(Icons.info), onPressed: ()
                {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (BuildContext context)
                      {
                        return detailAnnonceController(mess: mess,);
                      }
                  ));
                }
                ),
              ),
            );
            }
            else{
              return Container();
            }
          },
        );
      }
    if(widget.titre=="administration")
      {
        return new GridView.builder(
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: liste.length,
            itemBuilder: (context,index)
            {
              return new InkWell(

                child:new Container(
                  child: new Card(
                    shape: RoundedRectangleBorder(side: BorderSide(style: BorderStyle.solid),borderRadius: BorderRadius.circular(20.0)),

                    elevation: 10.0,
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(liste[index].titre,style: new TextStyle(fontSize: 20,color: Colors.orangeAccent),),
                        Hero(
                            tag: liste[index].image,
                            child: Image.asset(liste[index].image,height: 130,color: Colors.blueGrey,)),

                        //heroWidget(liste[index].image),

                      ],

                    ),
                  ),
                ),
                onTap: (){


                  datas().pusherDetail(context, liste[index].image, liste[index].description,liste[index].titre,liste: liste[index]);

                },

              );

            }
        );
      }



  }











}


