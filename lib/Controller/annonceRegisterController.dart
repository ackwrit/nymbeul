import 'package:flutter/material.dart';
import 'package:nymbeul/main.dart';
import 'package:nymbeul/model/fireBaseHelper.dart';

class annonceRegisterController extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return homeAnnonce();
  }

}

class homeAnnonce extends State<annonceRegisterController>{
  String dropdownValue='Jobs';
  String titre;
  String contenu;
  List<String>annonceListing=["Jobs","Les offres de service","Evènements Religieux","Annonce diverses"];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //Initalisation avec récupération des élemnts utilisateurs
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text('Déposer une annonce'),
      ),
      body: _Body(),
    );
  }




  Widget _Body(){
    return  new Container(
      padding: EdgeInsets.all(20),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
              Text("Type d'annonce"),
              DropdownButton(
                  onChanged: (String newValue){
                    setState(() {
                      dropdownValue =newValue;
                    });
                  },
                value: dropdownValue,
                items:annonceListing.map<DropdownMenuItem<String>>((String value){
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value,textAlign: TextAlign.center,),
                  );

                }).toList()
              ),


          TextField(
            textAlign: TextAlign.center,
            onChanged: (String text)
            {
              setState(() {
                titre=text;
              });

            },


            decoration: InputDecoration(




                hintText: 'Entrer votre titre',

              filled: true,
              fillColor: Colors.white,


              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),

              ),




            ),



          ),
          TextField(
            onChanged: (String text){
              setState(() {
                contenu =text;
              });
            },
            textAlign: TextAlign.center,
            maxLines: 10,


            decoration: InputDecoration(




              hintText: 'Entrer votre annonce',

              filled: true,
              fillColor: Colors.white,


              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),

              ),




            ),



          ),
          RaisedButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              onPressed: (){
              fireBaseHelper().sendMessage(titre, contenu, "biMb8CGSbhT7vE4Tbkgbgfkby52ATPenevg1", dropdownValue,"non");
              Navigator.push(context, MaterialPageRoute(
                builder: (BuildContext context){
                  return MyApp();
                }
              ));


              },
            child: Text('Enregistrer'),
          )
        ],

      )
    );

  }

}