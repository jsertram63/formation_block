import 'package:blocs_sport/Blocs/bloc_router.dart';
import 'package:flutter/material.dart';
import 'package:blocs_sport/Model/sport.dart';

class TileSport extends StatelessWidget {
 final Sport sport;
 TileSport(this.sport);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        elevation: 7.5,
        color: Colors.teal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(sport.name,
              style: TextStyle(
                  fontSize: 25,
                  fontStyle: FontStyle.italic,
                  color: Colors.white
              ),),
            Image.network(sport.thumb, width: MediaQuery.of(context).size.width/2.5,)
          ],
        ),
      ),
      onTap: () => Navigator.of(context).push(BlocRouter().sportDetail(sport)) ,
    );
  }
}
