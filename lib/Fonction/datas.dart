import 'package:flutter/material.dart';
import 'package:nymbeul/model/detailStructure.dart';
import 'package:nymbeul/model/herowidget.dart';
import 'package:nymbeul/model/pageStrcuture.dart';
import 'package:nymbeul/widget/annonce.dart';

class datas{





  push(BuildContext context,String titre, Widget destination)
  {
    Navigator.of(context).push(MaterialPageRoute(builder:(context)
    {
    return pageStructure(titre,destination);
    } ));

  }

  pusherDetail(BuildContext context,String image,String contenu,String titre,{annonce liste})
  {
    Navigator.of(context).push((new MaterialPageRoute
      (builder: (context){
        return detailStructure(image,contenu,titre,listeannonce: liste,);
    }
    )));
  }


}

