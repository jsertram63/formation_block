import 'dart:async';

import 'package:blocs_sport/Blocs/bloc.dart';
import 'package:blocs_sport/Model/sport.dart';
import 'package:blocs_sport/Services/sportsDB_api.dart';

class BlocLeague extends Bloc{

  final _streamController = StreamController<List<League>>();

  Sink<List<League>> get sink => _streamController.sink;
  Stream<List<League>> get stream => _streamController.stream;

  BlocLeague(String name){
    fetchLeagues(name);
    print("Constructeur bloc league");

  }

  fetchLeagues(String name) async{
    print("FEEEEEETCH LEAGUE");
    print(name);
    final result = await SportsDBApi().fetchLeagues(name);
    sink.add(result);

  }

  @override
  dispose() {
    _streamController.close();

  }
}