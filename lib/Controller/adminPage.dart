import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nymbeul/Controller/ajouterAnnonce.dart';
import 'package:nymbeul/Controller/ajouterPublicite.dart';
import 'package:nymbeul/Controller/connexionController.dart';
import 'package:nymbeul/Controller/listeAnnonce.dart';
import 'package:nymbeul/Controller/loginControllerOut.dart';
import 'package:nymbeul/Controller/parametreProfil.dart';
import 'package:nymbeul/Controller/profilPage.dart';
import 'package:nymbeul/Controller/validationAnnonce.dart';
import 'package:nymbeul/model/fireBaseHelper.dart';
import 'package:nymbeul/model/user.dart';

class adminPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return homeAdmin();
  }

}

class homeAdmin extends State<adminPage>{
  PageController pageController=PageController(initialPage: 0);
  int bottomSelectedIndex = 0;
  String identifiant;
  user moi;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fireBaseHelper().myId().then((uid)
    {
      setState(() {
        identifiant=uid;
      });
      fireBaseHelper().getUser(identifiant).then((user)
      {
        setState(() {
          moi=user;
        });

      });

    });

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

     return new Scaffold(
       appBar: new AppBar(
         leading: IconButton(
             icon: Icon(Icons.clear),
             onPressed: ()
             {
               fireBaseHelper().auth.signOut();
               Navigator.push(context, MaterialPageRoute(
                   builder: (BuildContext context){
                     return loginControllerOut();
                   }
               ));
             }
         ),
         actions: <Widget>[
          new IconButton(icon:Icon(Icons.home,size: 32.0,color: Colors.white,), onPressed:connexion),

         ],

         title: Text('Administration'),

         backgroundColor: Colors.blue,



       ),
       body: (moi.typeUser=='admin')?
       PageView(
         controller: pageController,
         onPageChanged: (index)
         {
           pageChanged(index);
         },
         children: [
           profilPage(),
           parametreProfil(),
           listeAnnonce(),
           validationAnnonce(),
           ajouterAnnonce(),
           ajouterPublicite(),

         ],
       ):
       PageView(
         controller: pageController,
         onPageChanged: (index){
           pageChanged(index);
         },
         children: [
           profilPage(),
           ajouterAnnonce()
         ],
       ),

       bottomNavigationBar: (moi.typeUser=='admin')?Theme(
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

         backgroundColor: Colors.blue,



         onTap: (index){
           bottomTapped(index);

         },
         items:[
           new BottomNavigationBarItem(icon: new Icon(Icons.account_circle),title: new Text("Profil")),
           new BottomNavigationBarItem(icon: new Icon(Icons.settings),title: new Text("Paramètre")),
           new BottomNavigationBarItem(icon: new Icon(Icons.format_list_bulleted),title: new Text('Annonce')),
           new BottomNavigationBarItem(icon: new Icon(Icons.playlist_add_check),title: new Text('Validation')),
           new BottomNavigationBarItem(icon: new Icon(Icons.add_circle),title: new Text('Ajouter Annonce')),
           new BottomNavigationBarItem(icon: new Icon(Icons.event_note),title: new Text('Ajout publicitaire'))

         ],

       ),



     ):
       Theme(
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

           backgroundColor: Colors.blue,



           onTap: (index){
             bottomTapped(index);

           },
           items:[
             new BottomNavigationBarItem(icon: new Icon(Icons.account_circle),title: new Text("Profil")),
             new BottomNavigationBarItem(icon: new Icon(Icons.add_circle),title: new Text('Ajouter Annonce')),


           ],

         ),



       ) //Version pour les particulliers
     );

  }


  void bottomTapped(int index) {
    setState(() {
      bottomSelectedIndex = index;
      pageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
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
          return loginControllerOut();
        }
    ));
  }





  List <Widget> controllers (){
    return [
      profilPage(),
      listeAnnonce(),
      ajouterAnnonce(),
      ajouterPublicite(),








    ];

  }

}