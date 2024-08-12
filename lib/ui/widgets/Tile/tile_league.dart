import 'package:blocs_sport/ui/widgets/Icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:blocs_sport/Model/sport.dart';
import 'package:blocs_sport/ui/widgets/Icon_widget.dart';

class TileLeague extends StatelessWidget {
 final League league;

 TileLeague(this.league);

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      title: Text(league.strLeague!),
   //   leading: IconWidget(
     //   url: league.images.badge,
       // size: 40,
      //)
    );
  }
}
