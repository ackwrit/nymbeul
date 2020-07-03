import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nymbeul/Controller/administrationController.dart';
import 'package:nymbeul/Controller/annonceRegisterController.dart';
import 'package:nymbeul/Fonction/datas.dart';
import 'package:nymbeul/model/fireBaseHelper.dart';
import 'package:nymbeul/model/publicite.dart';
import 'package:nymbeul/model/section.dart';


class annonceController extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return annonceControllerState();
  }


}

class annonceControllerState extends State<annonceController>{
  int index=0;




  List <section> section_list=[
    new section("Jobs", Icons.domain,null),
    new section("Les offres de service", Icons.domain, null),
    new section("Evènements Religieux", Icons.domain, null),
    new section("Annonces diverses", Icons.domain, null),

  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: new AppBar(
          title:ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Text("Petites Annonces"),
          ) ,

          centerTitle: true,
          backgroundColor: Colors.blueGrey,

        ),

        body:_body()




    );
  }







//////////
  Widget _body()
  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        ListView.separated(
            itemBuilder: (context,index){
              return tile(context, section_list[index]);
            },
            shrinkWrap: true,
            separatorBuilder: (context,index){
              return Divider(
                thickness: 1,
                color: Colors.orange,
              );
            },
            itemCount: section_list.length),
        FlatButton(onPressed: ()
            {
              Navigator.push(context, new MaterialPageRoute(
                  builder: (BuildContext context)
                      {
                        return annonceRegisterController();
                      }
              ));
            }
            , child: Text('Déposer une annonce',style: TextStyle(color: Colors.amber),)),
        Padding(padding: EdgeInsets.all(25)),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height/6,
          padding: EdgeInsets.all(5),

          child: FirebaseAnimatedList(
              query: fireBaseHelper().base_pub,
              itemBuilder: (BuildContext context,DataSnapshot snapshot,Animation<double>animation,int index){
                publicite pub = publicite(snapshot);
                return Container(
                  height: 100.0,
                  child: Card(
                      elevation: 10.0,
                      child: new Center(
                          child:Text(pub.titre)
                      )
                  ),
                );




              }
          ),
        )


      ],

    );

  }

/////

  ListTile tile (BuildContext context,section sections)
  {

    return ListTile(
      leading: Icon(sections.icon),
      title: Text(sections.name),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: ()
      {
        return datas().push(context,sections.name,sections.destination);
      },
    );
  }


  List <BottomNavigationBarItem>menu()
  {
    return [

      BottomNavigationBarItem(
          icon: Icon(Icons.local_hospital),

          title: Text("Adresses utiles")
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.landscape),
          title: Text("Loisirs")
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.directions_bus),
          title: Text("Transport")
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.comment),
          title: Text("Petites annonces")
      )


    ];

  }
  /// fonction
  ///
  ///
  void directionPage(int direction){
    switch (direction)
    {
      case 0:versAdministration();
      break;
      case 1:null;
      break;
      case 2:null;
      break;
      case 3:null;
      break;
      case 4:null;
      break;
    }


  }



  versAdministration(){
    Navigator.push(context, new MaterialPageRoute(
        builder: (BuildContext context){
          return administrationController();
        }
    ));

  }



}
