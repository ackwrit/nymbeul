import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nymbeul/Controller/adminPage.dart';
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
  PageController pageController=PageController(initialPage: 0);
  int bottomSelectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

            return new Scaffold(
              appBar: new AppBar(
                actions: <Widget>[
                  new IconButton(icon:Icon(Icons.account_circle,size: 32.0,color: Colors.white,), onPressed:connexion),

                ],

                //title: Image.asset('assets/NYMBEUL.png',height: 100,),
                centerTitle: true,
                flexibleSpace: Image.asset('assets/logo gris.png',scale: 2,),

                backgroundColor: Colors.blue,



              ),
              body: PageView(
                controller: pageController,
                onPageChanged: (index)
                {
                  pageChanged(index);
                },

                children: [
                  new annonceController(),
                  new transportController(),
                  new administrationController(),
                  new adresseController(),
                  new loisirController(),
                ],
              ),

              bottomNavigationBar: Theme(
                  data: Theme.of(context).copyWith(
                      canvasColor: Colors.blue,
                      primaryColor: Colors.black,
                      textTheme: Theme.of(context).textTheme.copyWith(
                          caption: TextStyle(color: Colors.orange)
                      )
                  ),
                  child: BottomNavigationBar(


                currentIndex: bottomSelectedIndex,
                selectedItemColor: Colors.black,





                onTap: (index){
                  bottomTapped(index);

                },
                items: [
                  new BottomNavigationBarItem(icon: new Icon(Icons.comment),title: new Text('Petites Annonces',)),
                  new BottomNavigationBarItem(icon: new Icon(Icons.directions_bus),title: new Text('Transport')),
                  new BottomNavigationBarItem(icon: new Icon(Icons.account_balance),title: new Text("Administration")),
                  new BottomNavigationBarItem(icon: new Icon(Icons.local_hospital),title: new Text('Adresses utiles')),
                  new BottomNavigationBarItem(icon: new Icon(Icons.beach_access),title: new Text('Loisirs')),

                ],
                backgroundColor: Colors.blue,

              ),



            ))
            ;


  }


  IconButton Boutton(IconData icone,VoidCallback direction,taille){
    return new IconButton(
        icon: Icon(icone),
        iconSize: taille,
        color: Colors.green[100],
        onPressed: direction
    );

  }


  void pageChanged(int index) {
    setState(() {
      bottomSelectedIndex = index;
    });
  }

  void connexion() {
    Navigator.push(context,new MaterialPageRoute(
        builder: (BuildContext context)
        {
          return StreamBuilder <FirebaseUser>(
            stream: FirebaseAuth.instance.onAuthStateChanged,
            builder: (BuildContext context,snapshot){
              if(snapshot.hasData)
              {
                //Si on a des datas , on est authentifié
                return adminPage();
              }
              else
              {
                //on est n'est pas off page sans connexion
                return connexionController();
              }
            },

          );

        }
    ));
  }










  void bottomTapped(int index) {
    setState(() {
      bottomSelectedIndex = index;
      pageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

}