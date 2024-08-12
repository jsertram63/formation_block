import 'package:blocs_sport/Model/sport.dart';
import 'package:blocs_sport/ui/widgets/Tile/tile_league.dart';
import 'package:flutter/material.dart';
class ListLeague extends StatelessWidget {
  final List<League> leagues;
  ListLeague(this.leagues);


  @override
  Widget build(BuildContext context) {
    return ListView.separated(itemBuilder: (ctx,i) => TileLeague(leagues[i]),
        separatorBuilder: (ctx, i) => Divider(),
        itemCount: leagues.length);
  }
}
