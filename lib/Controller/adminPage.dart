import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nymbeul/Controller/listeAnnonce.dart';
import 'package:nymbeul/Controller/profilPage.dart';

class adminPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return homeAdmin();
  }

}

class homeAdmin extends State<adminPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   if(Theme.of(context).platform==TargetPlatform.iOS){
     return iosConfig();
  }
   else
     {
       return androidConfig();
     }
  }



  Widget iosConfig()
  {
    return new CupertinoTabScaffold(
        tabBar: new CupertinoTabBar(
            backgroundColor: Colors.blue[100],
            activeColor: Colors.black,
            inactiveColor: Colors.white,
            items:[
              new BottomNavigationBarItem(icon: new Icon(Icons.account_circle),title: new Text("Profil")),
              new BottomNavigationBarItem(icon: new Icon(Icons.format_list_bulleted),title: new Text('Annonce')),








            ]),
        tabBuilder: (BuildContext context,int index){
          Widget controllerSelected= controllers()[index];
          return new Scaffold(
            appBar: new AppBar(
              actions: [
                IconButton(icon:Icon(Icons.account_circle), onPressed:()
                {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (BuildContext context)
                      {
                        return adminPage();
                      }
                  ));

                }
                )
              ],

              title: Image.asset("assets/nymbeul_logo.png",height: 170,width: 600,),
              backgroundColor: Colors.blue[100],),
            body: controllerSelected,


          );
        }
    );
  }




  Widget androidConfig(){

  }





  List <Widget> controllers (){
    return [
      profilPage(),
      listeAnnonce(),








    ];

  }

}