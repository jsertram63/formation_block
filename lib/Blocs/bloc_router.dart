import 'package:blocs_sport/Blocs/bloc_league.dart';
import 'package:blocs_sport/Blocs/bloc_provider.dart';
import 'package:blocs_sport/Blocs/bloc_sport.dart';
import 'package:blocs_sport/Blocs/bloc_league.dart';
import 'package:blocs_sport/ui/Screens/sport_screen.dart';
import 'package:blocs_sport/ui/home_screen.dart';
import 'package:blocs_sport/Model/sport.dart';
import 'package:flutter/material.dart';

class BlocRouter {

  MaterialPageRoute sportDetail(Sport s) => MaterialPageRoute(builder: (ctx) => sport(s));


  BlocProvider allSports() => BlocProvider<BlocSport>(bloc: BlocSport(), child: HomeScreen());
  BlocProvider sport(Sport sport) => BlocProvider<BlocLeague>(bloc: BlocLeague(sport.name), child: SportScreen(sport));
}