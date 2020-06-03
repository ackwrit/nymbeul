import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nymbeul/Controller/administrationController.dart';
import 'package:nymbeul/Controller/adresseController.dart';
import 'package:nymbeul/Controller/annonceController.dart';
import 'package:nymbeul/Controller/choixLogin.dart';
import 'package:nymbeul/Controller/loginControllerOut.dart';
import 'package:nymbeul/Controller/loisirController.dart';
import 'package:nymbeul/Controller/transportController.dart';
import 'package:nymbeul/model/design.dart';
import 'package:flutter/cupertino.dart';
import 'package:nymbeul/Controller/connexionController.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NYMBEUL',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue[54],
      ),
      home: handleAuth(),
      debugShowCheckedModeBanner: false,
    );
  }


  Widget handleAuth(){
    return StreamBuilder <FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context,snapshot){
        if(snapshot.hasData)
        {
          //Si on a des datas , on est authentifié
          return choixLogin();
        }
        else
        {
          //on est n'est pas off page sans connexion
          return loginControllerOut();
        }
      },

    );
  }



}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  design administration= new design('Admnistration',Icons.business);
  design tourisme = new design('Loisirs', Icons.battery_full);
  design adresse = new design('Adresse', Icons.battery_full);
  design transport = new design('Transport', Icons.battery_full);
  design annonce = new design('Annonce', Icons.battery_full);

  int index=0;

  @override
  Widget build(BuildContext context) {
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

                title: Image.asset('assets/nymbeul_logo.png',height: 170,width: 600,),
                backgroundColor: Colors.blue,),
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


