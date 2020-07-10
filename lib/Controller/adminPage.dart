import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nymbeul/Controller/ajouterAnnonce.dart';
import 'package:nymbeul/Controller/ajouterPublicite.dart';
import 'package:nymbeul/Controller/connexionController.dart';
import 'package:nymbeul/Controller/listeAnnonce.dart';
import 'package:nymbeul/Controller/loginControllerOut.dart';
import 'package:nymbeul/Controller/profilPage.dart';
import 'package:nymbeul/Controller/validationAnnonce.dart';
import 'package:nymbeul/model/fireBaseHelper.dart';

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
       body: PageView(
         controller: pageController,
         onPageChanged: (index)
         {
           pageChanged(index);
         },
         children: [
           profilPage(),
           listeAnnonce(),
           validationAnnonce(),
           ajouterAnnonce(),
           ajouterPublicite(),
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

         backgroundColor: Colors.blue,



         onTap: (index){
           bottomTapped(index);

         },
         items: [
           new BottomNavigationBarItem(icon: new Icon(Icons.account_circle),title: new Text("Profil")),
           new BottomNavigationBarItem(icon: new Icon(Icons.format_list_bulleted),title: new Text('Annonce')),
           new BottomNavigationBarItem(icon: new Icon(Icons.playlist_add_check),title: new Text('Validation')),
           new BottomNavigationBarItem(icon: new Icon(Icons.add_circle),title: new Text('Ajouter Annonce')),
           new BottomNavigationBarItem(icon: new Icon(Icons.event_note),title: new Text('Ajout publicitaire'))

         ],

       ),



     )
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