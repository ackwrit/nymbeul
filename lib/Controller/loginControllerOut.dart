import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nymbeul/Controller/annonceController.dart';
import 'package:nymbeul/Controller/transportController.dart';

import 'administrationController.dart';
import 'adresseController.dart';
import 'connexionController.dart';
import 'loisirController.dart';

class loginControllerOut extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
   return homeLoginOut();
  }

}

class homeLoginOut extends State<loginControllerOut>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if(Theme.of(context).platform==TargetPlatform.iOS)
    {
      return new CupertinoTabScaffold(
          tabBar: new CupertinoTabBar(
              backgroundColor: Colors.blue,
              activeColor: Colors.black,
              inactiveColor: Colors.white,
              items:[
                new BottomNavigationBarItem(icon: new Icon(Icons.comment),title: new Text('Petites Annonces')),
                new BottomNavigationBarItem(icon: new Icon(Icons.directions_bus),title: new Text('Transport')),
                new BottomNavigationBarItem(icon: new Icon(Icons.account_balance),title: new Text("Administration")),
                new BottomNavigationBarItem(icon: new Icon(Icons.local_hospital),title: new Text('Adresses utiles')),
                new BottomNavigationBarItem(icon: new Icon(Icons.beach_access),title: new Text('Loisirs')),




              ]),
          tabBuilder: (BuildContext context,int index){
            Widget controllerSelected= controllers()[index];
            return new Scaffold(
              appBar: new AppBar(
                actions: <Widget>[
                  new IconButton(icon:Icon(Icons.account_circle,size: 32.0,color: Colors.white,), onPressed:connexion),

                ],

                title: Image.asset('assets/nymbeul_logo.png',height: 200,width: 600,),

                backgroundColor: Colors.blue,
                flexibleSpace: ClipPath(),

                elevation: 0.0,
              ),
              extendBody: true,
              body: controllerSelected,



            );
          }
      );
    }
    else
    {
      return new DefaultTabController(
        length: 5,
        child: new Scaffold(
          appBar: new AppBar(
            backgroundColor: Colors.blue,
            title: Text('Nymbeul'),
            centerTitle: true,
            actions: <Widget>[
              new IconButton(icon:Icon(Icons.account_circle,size: 32.0,color: Colors.white,), onPressed:connexion),

            ],
            bottom: new TabBar(
                tabs: [
                  new Tab(icon: new Icon(Icons.comment),),
                  new Tab(icon: new Icon(Icons.directions_bus),),
                  new Tab(icon: new Icon(Icons.account_balance),),

                  new Tab(icon: new Icon(Icons.local_hospital),),
                  new Tab(icon: new Icon(Icons.beach_access),),




                ]),
          ),
          body: new TabBarView(
            children: controllers(),
          ),
        ),

      );
    }
  }


  IconButton Boutton(IconData icone,VoidCallback direction,taille){
    return new IconButton(
        icon: Icon(icone),
        iconSize: taille,
        color: Colors.green[100],
        onPressed: direction
    );

  }

  void connexion() {
    Navigator.push(context,new MaterialPageRoute(
        builder: (BuildContext context)
        {
          return connexionController();
        }
    ));
  }








  List <Widget> controllers (){
    return [
      new annonceController(),
      new transportController(),
      new administrationController(),
      new adresseController(),
      new loisirController(),




    ];

  }

}