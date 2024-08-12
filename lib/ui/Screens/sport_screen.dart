import 'package:blocs_sport/Blocs/bloc_league.dart';
import 'package:blocs_sport/Blocs/bloc_provider.dart';
import 'package:blocs_sport/ui/widgets/lists/List_league.dart';
import 'package:blocs_sport/ui/widgets/my_app_bar.dart';
import 'package:blocs_sport/ui/widgets/no_data.dart';
import 'package:flutter/material.dart';
import 'package:blocs_sport/Model/sport.dart';


class SportScreen extends StatelessWidget {

  final Sport sport;
  SportScreen(this.sport);


  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<BlocLeague>(context);
    bloc.fetchLeagues(this.sport.name);

    final midHeight = MediaQuery.of(context).size.height/2.5;
    return Scaffold(
      appBar: MyAppBar(titleString: sport.name,),
      body: Center(
        child: Column(
          children: [
            detail(midHeight),
            Expanded(child: StreamBuilder<List<League>>(
              stream: bloc.stream,
              builder: (ctx, snap){
                if (snap == null){
                  return NoData(("Pas de données"));
                }else if (!snap.hasData) {
                  return NoData("n a pas de données");

                }else {
                  return ListLeague(snap.data!);
                }
              },
            ))
          ],
          
        ),
      ),
    );
  }


  Container detail(double heigh) {
    return Container(
      height: heigh,
      child: Card(
        elevation: 7.5,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(sport.thumb),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(sport.desc),
              )
            ],
          ),
        ),
      ),
    );
  }
}
