import 'package:flutter/material.dart';

class signalementTrafficController extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return homeTraffic();
  }

}

class homeTraffic extends State<signalementTrafficController>{
  String dropdownValue='Accident';
  String dropdownValueLieu='Paris';
  List <String> annonceListing =['Accident',"Embouteillages","Travaux","Evènements temporaires"];
  List <String>lieuListing=["Paris","Toulouse","Rennes"];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Signalement'),
      ),
      body: _Body(),
    );
  }




  Widget _Body(){
    return  new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("Type incident",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
            DropdownButton(

              icon: Icon(Icons.arrow_drop_down_circle),
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
            //Text("Lieu incident",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
            //DropdownButton(
              //icon: Icon(Icons.arrow_drop_down_circle),

                //onChanged: (String newValue){
                  //setState(() {
                    //dropdownValueLieu =newValue;
                  //});
                //},
                //value: dropdownValueLieu,
                //items:lieuListing.map<DropdownMenuItem<String>>((String value){
                  //return DropdownMenuItem<String>(
                    //value: value,
                    //child: Text(value,textAlign: TextAlign.center,),
                  //);

                //}).toList()
            //),



            RaisedButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              onPressed: (){
                print('coucou');

              },
              child: Text('Enregistrer'),
            )
          ],

        )
    );
  }

}