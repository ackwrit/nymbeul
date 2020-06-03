import 'package:flutter/material.dart';
import 'package:nymbeul/model/arret.dart';
import 'package:nymbeul/model/ligne.dart';

class detailLigne extends StatefulWidget{
  ligne l ;

  detailLigne(ligne l)
  {
    this.l=l;
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new homeDetailLigne();
  }


}

class homeDetailLigne extends State<detailLigne>{
  ligne ligneBus;
  bool allee=true;
  List listeArretReverse=[];
  int i=0;
  int compteur;
  List <arret> listeArret = [
    arret("1", "Parcelles Assainies"),
    arret("1", "Corniche (unités 10-9-15)"),
    arret("1", "Dior"),
    arret("1", "Acapes Dispensaire Norade"),
    arret("1", "Passage entre 22 et 24"),
    arret("1", "Virage à droite"),
    arret("1", "Tronçon Marché Grand-Médine"),
    arret("1", "VDN"),
    arret("1", "Relais"),
    arret("1", "Avenue Cheikh Anta Diop"),
    arret("1", "Avenue Blaise Diagne"),
    arret("1", "Avenue Jean Jaurès"),
    arret("1", "Avenue André Peytavin"),
    arret("1", "Avenue George Pompidou"),
    arret("1", "Place de l’Indépendance"),
    arret("1", "allées Canard"),
    arret("1", "Esso Port"),
    arret("1", "Embarcadère"),
    arret("1", "Place Leclerc"),
    arret("2", "Daroukhane"),
    arret("2", "Corniche-Hamo"),
    arret("2", "Terminus Guédiawaye"),
    arret("2", "Marché Sahm"),
    arret("2", "Ecole Canada"),
    arret("2", "Route des Niayes"),
    arret("2", "Tally Boumack (route de l’Ouest)"),
    arret("2", "Route Nationale n° 1"),
    arret("2", "Autoroute – Cité des Eaux"),
    arret("2", "Avenue Bourguiba"),
    arret("2", "Avenue Cheikh Ahmadou Bamba (ex Rue 13 Prolongée)"),
    arret("2", "Bld Général De Gaule"),
    arret("2", "Rue 25"),
    arret("2", "Avenue Blaise Diagne"),
    arret("2", "Avenue Jean Jaurès"),
    arret("2", "Avenue Georges Pompidou"),
    arret("2", "Place de l’Indépendance"),
    arret("2", "Esso Port"),
    arret("2", "Leclerc"),
    arret("4", "Dieuppeul"),
    arret("4", "Cité Derklé – Khar Yalla"),
    arret("4", "Cité Marine –CEG Dieuppeul 3"),
    arret("4", "Camp Sapeurs Pompiers"),
    arret("4", "Cité Sacré Cœur"),
    arret("4", "Sicap Karack"),
    arret("4", "Avenue Bourguiba"),
    arret("4", "Dial Diop ex rue 10"),
    arret("4", "Point E – HLM Fass"),
    arret("4", "Canal Gueule Tapée"),
    arret("4", "Avenue Blaise Diagne"),
    arret("4", "Avenue Jean Jaurès"),
    arret("4", "Boulevard de la République"),
    arret("4", "Avenue Léopold Sédar Senghor"),
    arret("4", "Allées Canard-Esso"),
    arret("5", "Guédiawaye"),
    arret("5", "Route de la Corniche"),
    arret("5", "Cité des Enseignants"),
    arret("5", "Maison du PAI"),
    arret("5", "Cité Hlm – Golf"),
    arret("5", "Route des Niayes"),
    arret("5", "Police de Parcelles Assainies"),
    arret("5", "Pont du Stade Léopold Sédar Senghor (Echangeur)"),
    arret("5", "Patte d’Oie"),
    arret("5", "Autoroute"),
    arret("5", "Passage Cyrnos"),
    arret("5", "Avenue Lamine Guèye"),
    arret("5", "Avenue André Peytavin"),
    arret("5", "Avenue Jean Jaurès"),
    arret("5", "Bld de la République"),
    arret("5", "Avenue Léopold Sédar Senghor"),
    arret("6", "Cambéréne 2"),
    arret("6", "Cambéréne village"),
    arret("6", "Case"),
    arret("6", "Route des Niayes"),
    arret("6", "Police des Parcelles Assainies"),
    arret("6", "Marché Grand-Médine"),
    arret("6", "Cité Keur Damel"),
    arret("6", "VDN Sipres"),
    arret("6", "Camp Pénal"),
    arret("6", "Derklé"),
    arret("6", "Liberté 5"),
    arret("6", "Allées Khalifa Ababacar Sy"),
    arret("6", "Jet d’Eau"),
    arret("6", "Niary Tally"),
    arret("6", "Enam"),
    arret("6", "Bld Général De Gaule"),
    arret("6", "Allées Papa Guèye Fall"),
    arret("6", "Avenue Faidherbe"),
    arret("6", "Avenue Lamine Guèye"),
    arret("6", "Avenue André Peytavin"),
    arret("6", "Avenue Jean Jaurès"),
    arret("6", "Bld de la République"),
    arret("6", "Avenue Nelson Mandela"),
    arret("6", "Bld Général De Gaule"),
    arret("6", "Palais 2"),
    arret("7", "Ouakam"),
    arret("7", "Cité Assemblée – Comico"),
    arret("7", "Av Cheikh Anta Diop (route de Ouakam)"),
    arret("7", "Avenue Blaise Diagne"),
    arret("7", "avenue Jean Jaurès"),
    arret("7", "Avenue André Peytavin"),
    arret("7", "Avenue Georges Pompidou"),
    arret("7", "Place de l’Indépendance"),
    arret("7", "Avenue Léopold Sédar Senghor"),
    arret("7", "Avenue Nelson Mandela"),
    arret("7", "Palais de Justice"),
    arret("8", "Terminus Aéroport L.S.S"),
    arret("8", "Cité Asecna"),
    arret("8", "Yoff Village"),
    arret("8", "Stade Léopold Sédar Senghor"),
    arret("8", "Patte d’Oie"),
    arret("8", "Grand Yoff"),
    arret("8", "Cité des Eaux"),
    arret("8", "Avenue Bourguiba"),
    arret("8", "Rue Dial Diop – (ex rue 10)"),
    arret("8", "Zone B"),
    arret("8", "Rocade Fann"),
    arret("8", "Bel Air (Point E)"),
    arret("8", "Avenue Cheikh Anta Diop (Cité Universitaire)"),
    arret("8", "Avenue Blaise Diagne"),
    arret("8", "Avenue Jean Jaurès"),
    arret("8", "Bld de la République"),
    arret("8", "Avenue Lamine Guèye"),
    arret("8", "Avenue André Peytavin"),
    arret("8", "Avenue Jean Jaurès"),
    arret("8", "Bld de la République"),
    arret("8", "Avenue Léopold Sédar Senghor"),
    arret("8", "Avenue Nelson Mandela"),
    arret("8", "Palais de Justice"),
    arret("9","Liberté 6"),
    arret("9","Sacré Cœur"),
    arret("9","Terminus Dieuppeul"),
    arret("9","Allées Ababacar Sy"),
    arret("9","Rond Point Jet d’Eau"),
    arret("9","Allées Cheikh Sidate (Niary Tally)"),
    arret("9","Eglise Sainte Thérèse"),
    arret("9","Avenue Dial Diop (ex rue 10)"),
    arret("9","Bld Général De Gaule"),
    arret("9","Avenue Malick Sy"),
    arret("9","Avenue Blaise Diagne"),
    arret("9","Avenue Jean Jaurès"),
    arret("9","Avenue André Peytavin"),
    arret("9","Avenue Pompidou"),
    arret("9","Avenue Léopold Sédar Senghor"),
    arret("9","Avenue Nelson Mandela"),
    arret("9","Palais"),
    arret("10","Terminus Dieuppeul"),
    arret("10","Cité Derklé – Khar Yalla"),
    arret("10","Cité Marine – CEG Dieuppeul 3"),
    arret("10","Eglise Martyrs de l’Ouganda (rue 11 x P)"),
    arret("10","Stade Marius Ndiaye  Avenue Bourguiba"),
    arret("10","Relais"),
    arret("10","Avenue Cheikh Anta Diop"),
    arret("10","Rue Aimé Césaire"),
    arret("10","Corniche Ouest"),
    arret("10","Village Artisanal de Soubédioune"),
    arret("10","Prison Central"),
    arret("10","Bld de la République"),
    arret("10","Avenue Léopold Sédar Senghor"),
    arret("10","Avenue Nelson Mandela"),
    arret("11","Terminus Keur Massar"),
    arret("11","Parcelles Assainies (keur Massar) Route de Boune"),
    arret("11","Fass Mbao"),
    arret("11","Diamaguène"),
    arret("11","Thiaroye/mer"),
    arret("11","Croisement Pikine"),
    arret("11","Route Nationale"),
    arret("11","Autoroute – Corniche des Hlm"),
    arret("11","Colobane – Caisse de sécurité sociale"),
    arret("11","Bd Général De Gaule (Centenaire)"),
    arret("11","RTS – Rond-Point Poste Médina"),
    arret("11","Blaise Diagne"),
    arret("11","Sandaga"),
    arret("11","Terminus Lat-Dior"),
    arret("12","Terminus Guédiawaye"),
    arret("12","Cité des Enseignants"),
    arret("12","Maison du PAI"),
    arret("12","Hlm Guédiawaye"),
    arret("12","Domaine de Guédiawaye"),
    arret("12","Lycée Canada"),
    arret("12","Route des Niayes"),
    arret("12","Tally Boubess"),
    arret("12","Marché poissons"),
    arret("12","Route de Rufisque"),
    arret("12","Capa – TP Cap Vert"),
    arret("12","Cité des Eaux"),
    arret("12","Avenue Bourguiba"),
    arret("12","Relais Avenue Cheikh Anta Diop  (Hôpital Fann)"),
    arret("12","Avenue Blaise Diagne"),
    arret("12","Avenue Jean Jaurès"),
    arret("12","Bld de la République"),
    arret("12","Avenue Léopold Sédar Senghor"),
    arret("12","Avenue Nelson Mandela"),
    arret("12","Palais de Justice"),
    arret("13","Terminus Dieuppeul"),
    arret("13","Avenue Cheikh Ahmadou Bamba (ex rue 13 Prolongée)"),
    arret("13","Station Castors"),
    arret("13","Cité Port – Lycée Kennedy"),
    arret("13","Bld Général De Gaule"),
    arret("13","Allées Papa Guèye Fall"),
    arret("13","Avenue Faidherbe"),
    arret("13","Esso Port"),
    arret("13","Place de l’Indépendance"),
    arret("13","Avenue Léopold Sédar Senghor"),
    arret("13","Avenue Nelson Mandela"),
    arret("13","Palais 2"),
    arret("15","Terminus Rufisque"),
    arret("15","Mosquée Keuri Kaw"),
    arret("15","Sortie Rufisque (Dioukoul)"),
    arret("15","Sicap Mbao – Diamaguène"),
    arret("15","Croisement Pikine"),
    arret("15","Route de Rufisque "),
    arret("15","SCOA – SONACOS"),
    arret("15","Bld de l’Arsenal "),
    arret("15","Esso Port"),
    arret("15","Place de l’Indépendance "),
    arret("15","Avenue Léopold Sédar Senghor"),
    arret("15","Avenue Nelson Mandela "),
    arret("15","Palais 1"),
    arret("16 A","Terminus Malika"),
    arret("16 A","Yeumbeul"),
    arret("16 A","Tally Diallo"),
    arret("16 A","Icotaf"),
    arret("16 A","Cité Lobatt Fall "),
    arret("16 A","Rond Point Lobatt Fall "),
    arret("16 A","Autoroute"),
    arret("16 A","Colobane"),
    arret("16 A","Rond point Colobane"),
    arret("16 A","Place Bakou"),
    arret("16 A","Cfao Technologies "),
    arret("16 A","Cyrnos"),
    arret("16 A","Arsenal"),
    arret("16 A","Place de l’Indépendance"),
    arret("16 A","Palais de justice 1"),
    arret("16 B","Terminus Malika "),
    arret("16 B","Station Keur Massar"),
    arret("16 B","Croisement Keur Massar "),
    arret("16 B","LGI"),
    arret("16 B","Diamaguène "),
    arret("16 B","Thiaroye"),
    arret("16 B","Sips"),
    arret("16 B","Sotiba (seras)"),
    arret("16 B","Yarakh"),
    arret("16 B","Capa  Virmaud"),
    arret("16 B","Place Bakou"),
    arret("16 B","(Scoa)"),
    arret("16 B","Police Bel Air"),
    arret("16 B","Bel Air "),
    arret("16 B","GMD"),
    arret("16 B","Sofrigal (môle 8)"),
    arret("16 B","Cyrnos (sur le pont)"),
    arret("16 B","Caserne Sapeurs Pompiers"),
    arret("16 B","Avenue Lamine Guèye (Sandaga) "),
    arret("16 B","Avenue André Peytavin "),
    arret("16 B","Avenue Jean Jaurès"),
    arret("16 B","Boulevard de la République "),
    arret("16 B","Avenue Léopold Sédar Senghor (Roume)"),
    arret("16 B","Hôpital Principal,  Assemblée Nationale "),
    arret("16 B","Hôpital Le Dantec "),
    arret("16 B","Palais 1"),
    arret("18","Terminus Dieuppeul "),
    arret("18","Cité Derklé"),
    arret("18","Khar Yalla"),
    arret("18","Cité Marine"),
    arret("18","Avenue Cheikh Ahmadou Bamba (ex rue 13 Prolongée)"),
    arret("18","Station Castors"),
    arret("18","Cité Port "),
    arret("18","Rocade Fann Bel Air"),
    arret("18","Colobane"),
    arret("18","Police Bel Air"),
    arret("18","Grand Moulin de Dakar "),
    arret("18","Quai de pêche"),
    arret("18","Esso Port "),
    arret("18","Place de l’Indépendance"),
    arret("18","Avenue Georges Pompidou "),
    arret("18","Avenue André Peytavin "),
    arret("18","Route de la Corniche"),
    arret("18","Avenue Malick Sy"),
    arret("18","Rue 6 "),
    arret("18","Gueule Tapée"),
    arret("18","Lycée Delafosse"),
    arret("18","Avenue Cheikh Anta Diop"),
    arret("18","Ecole Normale Supérieure "),
    arret("18","Avenue Bourguiba"),
    arret("18","Rond Point Jet d’eau "),
    arret("18","Allées Ababacar Sy"),
    arret("18","Terminus Dieuppeul"),
    arret("20","Terminus Dieuppeul "),
    arret("20","Allées Ababacar Sy"),
    arret("20","Jet d’eau"),
    arret("20","Avenue Bourguiba"),
    arret("20","Ecole Police (Relais)"),
    arret("20","Avenue Cheikh Anta Diop"),
    arret("20","Hôpital Fann"),
    arret("20","Cité Universitaire"),
    arret("20","Lycée Delafosse"),
    arret("20","HLM Gueule Tapée"),
    arret("20","Rue 6 "),
    arret("20","Avenue  Malick Sy"),
    arret("20","Corniche Ouest "),
    arret("20","Avenue Peytavin"),
    arret("20","Avenue Pompidou"),
    arret("20","Place de l’Indépendance Esso Port"),
    arret("20","Bld de l’Arsenal"),
    arret("20","Central Bel Air (MTOA)"),
    arret("20","Grands Moulin de Dakar "),
    arret("20","Police Bel Air"),
    arret("20","Colobane"),
    arret("20","Angle Mousse"),
    arret("20","Avenue Cheikh Ahmadou Bamba"),
    arret("20","Station Castors"),
    arret("20","Cité Marine Khar Yalla"),
    arret("20","Cité Derklé "),
    arret("20","Terminus Dieuppeul"),
    arret("23","Terminus des Parcelles"),
    arret("23","Ecole Dior"),
    arret("23","Cités Diamalaye"),
    arret("23","Hlm Grand Médine"),
    arret("23","Reprise Route du Terminus "),
    arret("23","Eglise"),
    arret("23","Route des Niayes"),
    arret("23","Echangeur du Stade Léopold Sédar Senghor (Amitié) "),
    arret("23","Cité Keur Khadim"),
    arret("23","Camp Pénal"),
    arret("23","Route du Front de Terre"),
    arret("23","Cité des Eaux"),
    arret("23","Avenue Bourguiba"),
    arret("23","Relais"),
    arret("23","Avenue Cheikh Anta Diop"),
    arret("23","(Route de Ouakam)"),
    arret("23","Marché SAHM"),
    arret("23","Gueule Tapée"),
    arret("23","Rue 6"),
    arret("23","Avenue Malick Sy"),
    arret("23","Avenue Blaise Diagne "),
    arret("23","Avenue Jean Jaurès"),
    arret("23","Bld de la République"),
    arret("23","Avenue Léopold Sédar Senghor "),
    arret("23","Hôpital Principal"),
    arret("23","Avenue Nelson Mandela"),
    arret("23","Hôpital Le Dantec"),
    arret("217","Palais de Justice"),
    arret("217","Dépôt Thiaroye "),
    arret("217","police Thiaroye "),
    arret("217","Route des Niayes"),
    arret("217","Pikine "),
    arret("217","Canada  Golf  Fadia"),
    arret("217","Case "),
    arret("217","Croisement 22"),
    arret("217","Eglise"),
    arret("217","Terminus parcelles Assainies "),
    arret("217","Dior  Centre Bceao"),
    arret("217","Route cimetière Yoff "),
    arret("217","Route de L’Aéroport"),
    arret("217","Ngor"),
    arret("217","route des Almadies "),
    arret("217","Mamelles"),
    arret("217","Marché"),
    arret("218","Dépôt Thiaroye"),
    arret("218","Route Nationale N° 1"),
    arret("218","Pikine"),
    arret("218","patte d’oies"),
    arret("218","Foire Vdn"),
    arret("218","Sipres"),
    arret("218","ancienne piste"),
    arret("218","Ouakam"),
    arret("218","marché Ouakam"),
    arret("218","terminus Ouakam  route des mamelles"),
    arret("218","route des Almadies"),
    arret("218","Ngor"),
    arret("218","Terminus aéroport"),
    arret("219","Daroukhane"),
    arret("219","marché Ndiarème"),
    arret("219","deux voies notaires Terminus Guédiawaye  Stade Amadou Barry "),
    arret("219","Marché Sham "),
    arret("219","Marché Jeudi corniche "),
    arret("219","Croisement  Béthio"),
    arret("219","Fadia"),
    arret("219","Case"),
    arret("219","Pont Sénégal 92"),
    arret("219","Hyacinthe Thiandoum 6 Deux voies liberté 6"),
    arret("219","Ancienne Piste"),
    arret("219","Hôpital militaire de Ouakam"),
    arret("219","Comico"),
    arret("219","Cité Asecna"),
    arret("219","Cité Assemblée"),
    arret("219","Terminus Ouakam"),
    arret("219'","Terminus Keur Massar"),
    arret("219'","Station Keur Massar"),
    arret("219'","Hôpital Keur Massar"),
    arret("219'","P Ass Keur Massar Terminus Malika"),
    arret("219'","route de Yeumbeul"),
    arret("219'","Croisement Yeumbeul"),
    arret("219'","police Thiaroye "),
    arret("219'","Route des Niayes "),
    arret("219'","CES CANADA"),
    arret("219'","Pharmacie Golf"),
    arret("219'"," Fadia  Case "),
    arret("219'","Croisement 22"),
    arret("219'","église"),
    arret("228","Terminus Rufisque"),
    arret("228","ville de Rufisque"),
    arret("228","Bargny"),
    arret("228","Diamniadio Yenne"),
    arret("232","Baux Maraichers"),
    arret("232","Yarakh"),
    arret("232","Cafétéria"),
    arret("232","Hann Maristes"),
    arret("232","Cours Sainte Marie de Hann"),
    arret("232","Usine des eaux"),
    arret("232","Front de terre"),
    arret("232","Khar  Yalla "),
    arret("232","Rond-Point Liberté 6"),
    arret("232","deux voies Sipres "),
    arret("232","Foire"),
    arret("232","Itinéraire ligne 8"),
    arret("232","Terminus Aéroport.")
  ];



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ligneBus = widget.l;
    compteur = listeArret.length-1;
    while (i<listeArret.length) {
      setState(() {
        listeArretReverse.add(listeArret[compteur]);


      });
      i++;
      compteur--;
    }


  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(

        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            (allee)?Text("Vers  ${ligneBus.terminus}"):Text("Vers ${ligneBus.depart}"),
            IconButton(icon: Icon(Icons.directions),
            onPressed: (){
              setState(() {
                allee=!allee;
              });
            },

            )
            
            
          ],
        ),


      ),
      body: _Body(),
    );
  }



  Widget _Body(){





    return new Center(
        child: (!allee)?new ListView.builder(
            itemCount: listeArret.length,
            itemBuilder: (BuildContext context,int index){
              if(ligneBus.numeroLigne == listeArret[index].numeroLigne)
              {
                return ListTile(
                  leading: Icon(Icons.directions_bus),
                  title: Text(listeArret[index].nom),
                );
              }
              else
              {
                return new Container();
              }

            }
        ):new ListView.builder(
            itemCount: listeArret.length,
            itemBuilder: (BuildContext context,int index){
              if(ligneBus.numeroLigne == listeArretReverse[index].numeroLigne)
              {
                return ListTile(
                  leading: Icon(Icons.directions_bus),
                  title: Text(listeArretReverse[index].nom),
                );
              }
              else
              {
                return new Container();
              }

            }
        )
    );


  }

}