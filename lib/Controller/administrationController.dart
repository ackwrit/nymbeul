import 'package:flutter/material.dart';
import 'package:nymbeul/Controller/adresseController.dart';
import 'package:nymbeul/Controller/loisirController.dart';
import 'package:nymbeul/Fonction/Textavecstyle.dart';
import 'package:nymbeul/Fonction/datas.dart';
import 'package:nymbeul/model/pageStrcuture.dart';
import 'package:nymbeul/model/section.dart';


class administrationController extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return administrationControllerState();
  }


}

class administrationControllerState extends State<administrationController>{
  int index=0;
  Textavecstyle ministere = new Textavecstyle("MINISTERE",positiontext: TextAlign.center,taille: 30.0);
  Textavecstyle councours = new Textavecstyle("CONCOURS",positiontext: TextAlign.center,taille: 30.0);
  Textavecstyle prefecture = new Textavecstyle("PREFECTURE",positiontext: TextAlign.center,taille: 30.0);
  Textavecstyle mairie = new Textavecstyle("MAIRIE",positiontext: TextAlign.center,taille: 30.0);



  List <section> section_list=[
    //new section("Ministère", Icons.domain,loisirController()),
    new section("Concours", Icons.domain, null),
    new section("Préfecture", Icons.domain, null),
    new section("Mairie", Icons.domain, null),
    new section("Commissariat",Icons.domain,null),

  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Administration"),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),

      body:_body()




    );
  }








//////////
Widget _body()
{
  return ListView.separated(
      itemBuilder: (context,index){
        return tile(context, section_list[index]);
      },
      separatorBuilder: (context,index){
        return Divider(
          thickness: 1,
          color: Colors.orange,
        );
      },
      itemCount: section_list.length);
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



