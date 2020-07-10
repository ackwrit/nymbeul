import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:nymbeul/Controller/administrationController.dart';
import 'package:nymbeul/Fonction/datas.dart';
import 'package:nymbeul/model/fireBaseHelper.dart';
import 'package:nymbeul/model/publicite.dart';
import 'package:nymbeul/model/section.dart';


class loisirController extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return loisirControllerState();
  }


}

class loisirControllerState extends State<loisirController>{
  int index=0;




  List <section> section_list=[
    new section("Bars et Restaurants", Icons.domain,null),
    new section("Parcs et Jardins", Icons.domain, null),
    new section("Evènements culturels et Sportifs", Icons.domain, null),
    new section("Divers", Icons.domain, null),

  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: new AppBar(
          title: Text("Loisirs"),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
        ),

        body:_body()




    );
  }








//////////
  Widget _body()
  {
    return new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ListView.separated(
                itemBuilder: (context,index){
                  return tile(context, section_list[index]);
                },
                separatorBuilder: (context,index){
                  return Divider(
                    thickness: 1,
                    color: Colors.orange,
                  );
                },
                shrinkWrap: true,
                itemCount: section_list.length),



          ],

        )
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
