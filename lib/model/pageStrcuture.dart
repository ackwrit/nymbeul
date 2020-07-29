

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:map_launcher/map_launcher.dart';

import 'package:nymbeul/Controller/detailAnnonceController.dart';
import 'package:nymbeul/Controller/detailLigne.dart';
import 'package:nymbeul/Controller/loginControllerOut.dart';

import 'package:nymbeul/Fonction/datas.dart';

import 'package:nymbeul/model/fireBaseHelper.dart';
import 'package:nymbeul/model/herowidget.dart';

import 'package:nymbeul/model/element.dart';
import 'package:nymbeul/listing/enumeration.dart';
import 'package:nymbeul/model/message.dart';
import 'package:nymbeul/model/publicite.dart';

import 'package:nymbeul/widget/annonce.dart';
import 'package:platform_maps_flutter/platform_maps_flutter.dart';
import 'package:search_map_place/search_map_place.dart';


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
  DateTime jour=DateTime.now();
  double taille;


  enumeration choix;
  List  liste=[];
  List <annonce> listeoffre=[
    annonce(DateTime.now(),'Bâtiment', 'Qualification : Maçon/ construction bâtiment ', 'Pape D.', 'Keur MBaye Fall', '773494501', 'assets/senegal_amoirie.png'),
    annonce(DateTime.now(),'Location Nuit', 'Appart /Nuit / 12 000f', 'Gerant Mame Ran', 'Yoff', '777579585', 'assets/tourisme.png'),
  ];
  List <element>listMinistere=[
    element("Interieur", "coucou", "assets/tourisme.png"),
    element("Tourisme","visiter et voyager dans dakar", "assets/tourisme.png"),
    element("Justice", "coucou", "assets/tourisme.png"),
    element("Défense", "coucou", "assets/tourisme.png"),

    element("Santé", "coucou", "assets/tourisme.png"),
    element("Affaire étrangère","coucou",'assets/tourisme.png'),
    element("économie","coucou",'assets/tourisme.png'),
    element("Culture","coucou",'assets/tourisme.png'),
    element("Agriculture","coucou",'assets/tourisme.png'),

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
    if(widget.titre=='Dakar en voiture')
      {
        configuration();
      }
    //taille=MediaQuery.of(context).size.width-60;




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
          title: (widget.titre=='Dakar en transport -DEM DIKK'|| widget.titre=="Dakar en voiture")?Text('${widget.titre}'):Text(widget.titre),
          backgroundColor: Colors.blue,
          centerTitle: true,

        ),
        body:(widget.titre=='Dakar en transport -DEM DIKK' || widget.titre=='Dakar en voiture')?choixBody():body()

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
    if(widget.titre=="Dakar en transport -DEM DIKK")
    {
      return _BodyList();
    }
    if(widget.titre=='Dakar en voiture'){
      //configuration();
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
                Padding(padding: EdgeInsets.all(5),),
                SearchMapPlaceWidget(
                  apiKey: "AIzaSyBuawkYwnpFPLqRpFWzGE3aIvUdlezKkjc",
                  language: "fr",
                  placeType: PlaceType.geocode,
                  placeholder: "Où souhaitez-vous aller ?",
                  icon: Icons.map,

                ),
                Padding(padding: EdgeInsets.all(5),),
                Container(
                  height: MediaQuery.of(context).size.height/2,
                  child: PlatformMap(
                    initialCameraPosition : CameraPosition(
                      target: LatLng(0, 0),
                    ),
                    myLocationEnabled: true,
                    myLocationButtonEnabled: true,
                    onMapCreated: (controller){
                      Future.delayed(Duration(seconds: 2)).then((_)
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


                Padding(padding: EdgeInsets.all(10),),


                MaterialButton(
                  onPressed: () => openMapsSheet(context),
                  child: Text('Cliquer'),
                ),

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
    if(widget.titre=='Dakar et ses régions')
      {
        return Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.all(10),),
                Text('Terminus Liberté 5',style: TextStyle(fontSize: 25),),
                Padding(padding: EdgeInsets.all(5),),
                Text('Pour tout départ et arrivée en bus - DEM DIKK'),
                Padding(padding: EdgeInsets.all(15),),

                Text('Gare routière les Beaux maraîchiers Bountou Pikine',style: TextStyle(fontSize: 25),textAlign: TextAlign.center,),
                Padding(padding: EdgeInsets.all(5),),
                Text('Pour tout autre moyen de transport en commun allant dans les régions',),

              ],
            ),

          ),

        );
      }
    if(widget.titre == 'Concours')
    {
      return FirebaseAnimatedList(
        query: fireBaseHelper().base_message,
        defaultChild: messageVide(),
        itemBuilder: (BuildContext context,DataSnapshot snapshot,Animation <double> animation,int index){
          message mess =message(snapshot);
          if(mess.typeAnnonce==widget.titre && mess.validate!='non'){
            return Column(
              children: [
                GestureDetector(
                  child:Card(
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
                  ),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (BuildContext context)
                        {
                          return detailAnnonceController(mess: mess,);
                        }
                    ));

                  },
                ),

                Divider(thickness: 3,color: Colors.orange,)

              ],

            );

          }
          else{
            return Container();
          }
        },
      );
    }
    if(widget.titre == 'Préfecture')
    {
      return FirebaseAnimatedList(
        query: fireBaseHelper().base_message,
        defaultChild: messageVide(),
        itemBuilder: (BuildContext context,DataSnapshot snapshot,Animation <double> animation,int index){
          message mess =message(snapshot);
          if(mess.typeAnnonce==widget.titre && mess.validate!='non'){
            return Column(
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (BuildContext context)
                        {
                          return detailAnnonceController(mess: mess,);
                        }
                    ));
                  },
                  child: Card(
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
                  ),
                ),

                Divider(thickness: 3,color: Colors.orange,)

              ],

            );

          }
          else{
            return Container();
          }
        },
      );
    }


    if(widget.titre == 'Mairie')
    {
      return FirebaseAnimatedList(
        query: fireBaseHelper().base_message,
        defaultChild: messageVide(),
        itemBuilder: (BuildContext context,DataSnapshot snapshot,Animation <double> animation,int index){
          message mess =message(snapshot);
          if(mess.typeAnnonce==widget.titre && mess.validate!='non'){
            return Column(
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (BuildContext context)
                        {
                          return detailAnnonceController(mess: mess,);
                        }
                    ));
                  },
                  child:Card(
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
                  ),
                ),

                Divider(thickness: 3,color: Colors.orange,)

              ],
            );

          }
          else{
            return Container();
          }
        },
      );
    }


    if(widget.titre == 'Commissariat')
    {
      return FirebaseAnimatedList(
        query: fireBaseHelper().base_message,
        defaultChild: messageVide(),
        itemBuilder: (BuildContext context,DataSnapshot snapshot,Animation <double> animation,int index){
          message mess =message(snapshot);
          if(mess.typeAnnonce==widget.titre && mess.validate!='non'){
            return Column(
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (BuildContext context)
                        {
                          return detailAnnonceController(mess: mess,);
                        }
                    ));
                  },
                  child: Card(
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
                  ),
                ),

                Divider(thickness: 3,color: Colors.orange,)


              ],
            );

          }
          else{
            return Container();
          }
        },
      );
    }

    if(widget.titre == 'Hopitaux')
    {
      return FirebaseAnimatedList(
        query: fireBaseHelper().base_message,
        defaultChild: messageVide(),
        itemBuilder: (BuildContext context,DataSnapshot snapshot,Animation <double> animation,int index){
          message mess =message(snapshot);
          if(mess.typeAnnonce==widget.titre && mess.validate!='non'){
            return Column(
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (BuildContext context)
                        {
                          return detailAnnonceController(mess: mess,);
                        }
                    ));
                  },
                  child: Card(
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
                  ),
                ),

                Divider(thickness: 3,color: Colors.orange,)

              ],

            );

          }
          else{
            return Container();
          }
        },
      );
    }
    if(widget.titre == 'Pharmacie')
    {
      return FirebaseAnimatedList(
        query: fireBaseHelper().base_message,
        defaultChild: messageVide(),
        itemBuilder: (BuildContext context,DataSnapshot snapshot,Animation <double> animation,int index){
          message mess =message(snapshot);
          if(mess.typeAnnonce==widget.titre && mess.validate!='non'){
            return Column(
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (BuildContext context)
                        {
                          return detailAnnonceController(mess: mess,);
                        }
                    ));
                  },
                  child: Card(
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
                  ),
                ),

                Divider(thickness: 3,color: Colors.orange,)
              ],

            );

          }
          else{
            return Container();
          }
        },
      );
    }
    if(widget.titre == 'Ecoles et Institutions')
    {
      return FirebaseAnimatedList(
        query: fireBaseHelper().base_message,
        defaultChild: messageVide(),
        itemBuilder: (BuildContext context,DataSnapshot snapshot,Animation <double> animation,int index){
          message mess =message(snapshot);
          if(mess.typeAnnonce==widget.titre && mess.validate!='non'){
            return Column(
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (BuildContext context)
                        {
                          return detailAnnonceController(mess: mess,);
                        }
                    ));
                  },
                  child:Card(
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
                  ),
                ),

                Divider(
                  thickness: 3,
                  color: Colors.orange,
                )


              ],
            );

          }
          else{
            return Container();
          }
        },
      );
    }
    if(widget.titre == 'Banques')
    {
      return FirebaseAnimatedList(
        query: fireBaseHelper().base_message,
        defaultChild: messageVide(),
        itemBuilder: (BuildContext context,DataSnapshot snapshot,Animation <double> animation,int index){
          message mess =message(snapshot);
          if(mess.typeAnnonce==widget.titre && mess.validate!='non'){
            return Column(
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (BuildContext context)
                        {
                          return detailAnnonceController(mess: mess,);
                        }
                    ));
                  },
                  child: Card(
                    child: ListTile(
                      title: Text(mess.titre),
                      trailing: IconButton(icon: Icon(Icons.info), onPressed: ()
                      {

                      }
                      ),
                    ),
                  ),
                ),

                Divider(
                  thickness: 3,
                  color: Colors.orange,
                )

              ],
            );

          }
          else{
            return Container();
          }
        },
      );
    }
    if(widget.titre == 'Bars et Restaurants')
    //Afficher des images
    {
      return FirebaseAnimatedList(
        query: fireBaseHelper().base_message,
        defaultChild: messageVide(),
        itemBuilder: (BuildContext context,DataSnapshot snapshot,Animation <double> animation,int index){
          message mess =message(snapshot);
          if(mess.typeAnnonce==widget.titre && mess.validate!='non'){
            return Column(
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (BuildContext context)
                        {
                          return detailAnnonceController(mess: mess,);
                        }
                    ));
                  },
                  child:  Card(
                    child: ListTile(
                      title: Text(mess.titre),
                      trailing: IconButton(icon: Icon(Icons.info), onPressed: ()
                      {

                      }
                      ),
                    ),
                  ),

                ),

                Divider(
                  thickness: 3,
                  color: Colors.orange,
                )

              ],

            );

          }
          else{
            return Container();
          }
        },
      );
    }


    if(widget.titre == 'Parcs et Jardins')
    {
      return FirebaseAnimatedList(
        query: fireBaseHelper().base_message,
        defaultChild: messageVide(),
        itemBuilder: (BuildContext context,DataSnapshot snapshot,Animation <double> animation,int index){
          message mess =message(snapshot);
          if(mess.typeAnnonce==widget.titre && mess.validate!='non'){
            return Column(
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (BuildContext context)
                        {
                          return detailAnnonceController(mess: mess,);
                        }
                    ));
                  },
                  child: Card(
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
                  ),
                ),

                Divider(
                  thickness: 3,
                  color: Colors.orange,
                ),

              ],

            );

          }
          else{
            return Container();
          }
        },
      );
    }

    if(widget.titre == 'Evènements culturels et Sportifs')
    {
      return FirebaseAnimatedList(
        query: fireBaseHelper().base_message,
        defaultChild: messageVide(),
        itemBuilder: (BuildContext context,DataSnapshot snapshot,Animation <double> animation,int index){
          message mess =message(snapshot);
          if(mess.typeAnnonce==widget.titre && mess.validate!='non'){
            return Column(
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (BuildContext context)
                        {
                          return detailAnnonceController(mess: mess,);
                        }
                    ));
                  },
                  child: Card(
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
                  ),
                ),

                Divider(
                  thickness: 3,
                  color: Colors.orange,
                ),

              ],

            );

          }
          else{
            return Container();
          }
        },
      );
    }


    if(widget.titre == 'Divers')
    {
      return FirebaseAnimatedList(

        query: fireBaseHelper().base_message,
        defaultChild: messageVide(),
        itemBuilder: (BuildContext context,DataSnapshot snapshot,Animation <double> animation,int index){
          message mess =message(snapshot);
          if(mess.typeAnnonce==widget.titre && mess.validate!='non'){
            return Column(
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (BuildContext context)
                        {
                          return detailAnnonceController(mess: mess,);
                        }
                    ));
                  },
                  child: Card(
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




                  ),
                ),

                Divider(
                  color: Colors.orange,
                  thickness: 3,
                ),

              ],

            );


          }
          else{
            return Container();
          }
        },
      );
    }


    if(widget.titre == 'Jobs')
    {
      return FirebaseAnimatedList(
        query: fireBaseHelper().base_message,
        defaultChild: messageVide(),
        itemBuilder: (BuildContext context,DataSnapshot snapshot,Animation <double> animation,int index){
          message mess =message(snapshot);
          if(mess.typeAnnonce==widget.titre && mess.validate!='non'){
            return Column(
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (BuildContext context)
                        {
                          return detailAnnonceController(mess: mess,);
                        }
                    ));
                  },
                  child: Card(
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
                  ),
                ),

                Divider(
                  color: Colors.orange,
                  thickness: 3,
                )


              ],

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
        defaultChild: messageVide(),
        itemBuilder: (BuildContext context,DataSnapshot snapshot,Animation <double> animation,int index){
          message mess =message(snapshot);

          if(mess.typeAnnonce==widget.titre && mess.validate!='non'){
            return Column(
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (BuildContext context)
                        {
                          return detailAnnonceController(mess: mess,);
                        }
                    ));
                  },
                  child: Card(
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
                  ),
                ),

                Divider(
                  color: Colors.orange,
                  thickness: 3,
                )
              ],

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
            return Column(
                children:[
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(
                          builder: (BuildContext context)
                          {
                            return detailAnnonceController(mess: mess,);
                          }
                      ));
                    },
                    child: Card(
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
                    ),
                  ),

                  Divider(
                    thickness: 3,
                    color: Colors.orange,
                  ),

                ]


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
      //Afficher des images

      return FirebaseAnimatedList(
        query: fireBaseHelper().base_message,
        defaultChild: messageVide(),
        itemBuilder: (BuildContext context,DataSnapshot snapshot,Animation <double> animation,int index){
          message mess =message(snapshot);
          if(mess.typeAnnonce==widget.titre && mess.validate!='non'){
            return Column(
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (BuildContext context)
                        {
                          return detailAnnonceController(mess: mess,);
                        }
                    ));
                  },
                  child: Card(
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
                  ),
                ),

                Divider(
                  thickness: 3,
                  color: Colors.orange,
                ),


              ],
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
    if(widget.titre=="Etats du trafic")
      {

        return GestureDetector(
          onTap:(){
            setState(() {
              taille=0;
            });
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Infos trafic du ${jour.day}/${jour.month}/${jour.year}"),
              Text("Il n'y a aucun icident actuellement sur le trafic"),
              Padding(padding: EdgeInsets.all(10),),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/6,
                padding: EdgeInsets.all(5),

                child: FirebaseAnimatedList(
                    query: fireBaseHelper().base_pub,
                    shrinkWrap: true,
                    padding: EdgeInsets.all(10),
                    scrollDirection: Axis.horizontal,

                    duration: Duration(seconds: 10),
                    itemBuilder: (BuildContext context,DataSnapshot snapshot,Animation<double>animation,int index){
                      publicite pub = publicite(snapshot);


                      return Container(

                        height: 100.0,
                        width: MediaQuery.of(context).size.width-60,
                        child: Card(
                            elevation: 5.0,
                            child: new Center(
                                child:Text(pub.titre)
                            )
                        ),
                      );




                    }
                ),
              )
            ],
          )
        );


      }



  }

  Widget messageVide()
  {
    return new Center(
      child: Text("Actuellement, il n'y a aucune annonce dans cette rubrique"),
    );
  }











}


