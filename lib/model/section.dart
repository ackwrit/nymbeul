import 'package:flutter/material.dart';

class section
{
  String name;
  IconData icon;
  Widget destination;



  section(@required String name,@required IconData icon,@required Widget destination)
  {
    this.name=name;
    this.icon=icon;
    this.destination=destination;
  }
}

