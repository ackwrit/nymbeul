import 'package:flutter/material.dart';

class heroWidget extends StatelessWidget {
  String urlimage;

  heroWidget(this.urlimage);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Hero(
        tag: urlimage,
        child: Image.asset(urlimage, height: 130)
    );
  }
}