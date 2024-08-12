import 'package:blocs_sport/ui/widgets/Tile/tile_sport.dart';
import 'package:flutter/material.dart';
import 'package:blocs_sport/Model/sport.dart';
class ListSport extends StatelessWidget {


  final List<Sport> sports;
  ListSport(this.sports);

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      scrollDirection: Axis.horizontal,
        itemCount: sports.length,
        itemBuilder: (ctx,i) => TileSport(sports[i])
    );

  }
}
