import 'package:blocs_sport/Blocs/bloc.dart';
import 'package:blocs_sport/Blocs/bloc_provider.dart';
import 'package:blocs_sport/Blocs/bloc_sport.dart';
import 'package:blocs_sport/ui/widgets/my_app_bar.dart';
import 'package:blocs_sport/ui/widgets/no_data.dart';
import 'package:flutter/material.dart';
import 'package:blocs_sport/Services/sportsDB_api.dart';
import 'package:blocs_sport/Model/sport.dart';
import 'package:blocs_sport/ui/widgets/lists/List_sport.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height/5;
    final bloc = BlocProvider.of<BlocSport>(context);
    bloc.fetchSports();

    return Scaffold(

      appBar:MyAppBar(titleString: "I love sports",) ,
      body: Column(
        children: [
          Image.asset("assets/Sports.png", height: height,),
          Container(
            child: Text("A faire plus tard")
          ),
          Container(
            height: height,
            child: StreamBuilder<List<Sport>>(
              stream: bloc.stream,
            builder: (context, snapshot){
              if (snapshot == null){
                return NoData("Pas de données");
              }else if (!snapshot.hasData){
                return  NoData("Données vides");
              }else {
                return ListSport(snapshot.data!);
              }
            },
          ),


          )
        ],
      )
    );
  }





}
