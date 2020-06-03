import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nymbeul/Controller/listeAnnonce.dart';

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
              new BottomNavigationBarItem(icon: new Icon(Icons.search),title: new Text("Recherche")),
              new BottomNavigationBarItem(icon: new Icon(Icons.map),title: new Text('Carte')),

              new BottomNavigationBarItem(icon: new Icon(Icons.event),title: new Text('Rendez-vous')),






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
                        return null;
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
      listeAnnonce(),
      Text('coucou'),

      Text('coucou'),






    ];

  }

}