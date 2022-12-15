import 'package:flutter/material.dart';

class Loadding extends StatelessWidget {
  const Loadding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircularProgressIndicator(),
        Text("Loadding...")
      ],
    );
  }
}
