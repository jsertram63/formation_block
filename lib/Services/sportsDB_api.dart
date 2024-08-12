import 'package:http/http.dart' as http;
import 'dart:convert' as json;
import 'dart:convert' as convert;
import 'dart:io';
import 'package:blocs_sport/Model/sport.dart';

class SportsDBApi {
  final _baseUrl = "https://www.thesportsdb.com/api/v1/json/3/"; //https://www.thesportsdb.com/api/v1/json/3/all_leagues.php

  final _shortBaseApiUrl = "/api/v1/json/3/";

  String _allSports() => _baseUrl + "all_sports.php";
  String _allSportsShorts() => _shortBaseApiUrl + "all_sports.php";
  String _allLeagues(String name) => _shortBaseApiUrl + "all_leagues.php";
    


  Future<List<dynamic>> request(String urlString, String key, String querry) async {
    var url;
    if (querry == "no"){
      url = Uri.https('www.thesportsdb.com', urlString, {});
    }else {
      final _params = { "s" : querry };
      url = Uri.https('www.thesportsdb.com', urlString, _params);
      print("=============>UUUUUUUURRRRRRL");
      print(urlString);
      print(url);
    }

    



    final result = await http.get(url);


    final jsonData =  json.jsonDecode(result.body);
    print("=========> RESULT");
    print("KEY");
    print(key);
    print(jsonData[key]);
    

   return jsonData[key];


  }

 Future<List<Sport>>fetchSports() async {

    final List<dynamic>  list = await request(_allSportsShorts(),"sports","no");
   list.forEach((element) {
     print("Nouvel : $element");
   });
   return list.map((json) => Sport.fromJson(json)).toList();
 }

  
  Future<List<League>>fetchLeagues(String name) async {

   print("================> FETCH LEAGUE");

    print("================> Name ${name}");

    final List<dynamic>  list = await request(_allLeagues(name),"leagues",name);
     print("===================");
    print(_allLeagues(name));
    
   
        

    print(list);
     list.forEach((element) {
     print(" ================>Nouvel : $element");
   });
        
    print("===================");
    
    return list.map((json) => League.fromJson(json)).toList();
    

   
  }




/*
  //https://www.digitalocean.com/community/tutorials/flutter-flutter-http
  Future<List<Departement>> getDepartements() async {
    String url = URL_BASE + '/departement';
    HttpOverrides.global = new MyHttpOverrides();
    try {
      http.Response response = await http.get(
        //Uri.encodeFull removes all the dashes or extra characters present in our Uri
          Uri.encodeFull(url),
          headers: {
            //if your api require key then pass your key here as well e.g "key": "my-long-key"
            "Accept": "application/json"
          }
      );
      if (response.statusCode == 200) {
        final dynamic result = json.decode(response.body);
        print(result);
        Iterable list = result['departements'];
        return list.map((dynamic model) => Departement.from(model)).toList();
      }else {
        print(response.statusCode);
      }
    }catch(e){
      print("exception");
      print(e);
    }
  }*/




}

class API {
  static Future getUsers() {
    //var url = "www.thesportsdb.com/api/v1/json/1/all_sports.php";
    var url =
    Uri.https('www.thesportsdb.com/api/v1/json/1/all_sports.php', '', {'q': '{http}'});
    return http.get(url);
  }


}