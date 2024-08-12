import 'package:blocs_sport/Blocs/bloc.dart';
import 'dart:async';
import 'package:blocs_sport/Model/sport.dart';
import 'package:blocs_sport/Services/sportsDB_api.dart';

class BlocSport extends Bloc {
  final _streamController = StreamController<List<Sport>>();
  Stream<List<Sport>> get stream => _streamController.stream;
  Sink<List<Sport>> get sink => _streamController.sink;



  fetchSports() async {
    print("dans le bloc sport");
    final sports = await SportsDBApi().fetchSports();
    sink.add(sports);
  }

  BlocSport(){
    fetchSports();
  }


  @override
  dispose() {
    // TODO: implement dispose
   _streamController.close();
  }



}
