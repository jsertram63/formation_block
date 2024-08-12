import 'package:flutter/material.dart';
class NoData extends StatelessWidget {

  final String stringT;
  NoData(this.stringT);


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        stringT,
        style: TextStyle(
          color: Colors.teal,
          fontSize: 25,
          fontStyle: FontStyle.italic
        ),
      ),
    );
  }
}
