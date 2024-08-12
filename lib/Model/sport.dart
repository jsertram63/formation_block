class Sport {
  String id;
  String name;
  String format;
  String thumb;
 // String thumb2;
  String desc;

  Sport.fromJson(Map json):
        id = json["idSport"],
        name = json["strSport"],
        format = json["strFormat"],
        thumb = json["strSportThumb"] ?? "",
       // thumb2 = json["strSportThumb"],
        desc = json["strSportDescription"];
}

/*
class League {

  String name;
  String id;
  String sport;
  String leagueAlternate;
  String division;
  String date;
  String idCup;
  String country;
  Description description;
  Social social;
  LeagueImage images;


  League.fromJson(Map json):
        id = json["idLeague"] ?? "",
        sport = json['strSport'] ?? "",
        name = json["strLeague"] ?? "",
        leagueAlternate = json["strLeagueAlternate"] ?? "",
        division = json["strLeagueDivision"] ?? "",
        idCup = json["idCup"] ?? "",
        date = json["intFormedYear"] ?? "",
        country = json["strCountry"] ?? "",
        description = Description.fromJson(json),
        social = Social.fromJson(json),
        images = LeagueImage.fromJson(json);
}*/

class League {
  String? idLeague;
  String? strLeague;
  String? strSport;
  String? strLeagueAlternate;

  League(
      {this.idLeague, this.strLeague, this.strSport, this.strLeagueAlternate});

  League.fromJson(Map<String, dynamic> json) {
    idLeague = json['idLeague'] ?? " ";
    strLeague = json['strLeague'] ?? " ";
    strSport = json['strSport'] ?? "";
    strLeagueAlternate = json['strLeagueAlternate']?? " ";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idLeague'] = this.idLeague;
    data['strLeague'] = this.strLeague;
    data['strSport'] = this.strSport;
    data['strLeagueAlternate'] = this.strLeagueAlternate;
    return data;
  }
}

class Description {
  String english;
  String french;

  Description.fromJson(Map json):
        english = json["strDescriptionEN"] ?? "",
        french = json["strDescriptionFR"] ?? "";
}

class Social {
  String website;
  String facebook;
  String twitter;
  String instagram;
  String youtube;

  Social.fromJson(Map json)
      :website = json["strWebsite"] ?? "",
        facebook = json["strFacebook"] ?? "",
        twitter = json["strTwitter"] ?? "",
        instagram = json["strInstagram"] ?? "",
        youtube = json["strYoutube"] ?? "";
}

class LeagueImage {
  String logo;
  String poster;
  String trophy;
  String badge;
  String banner;
  FanArt fanArt;

  LeagueImage.fromJson(Map json):
        logo = json["strLogo"] ?? "",
        poster = json["strPoster"] ?? "",
        trophy = json["strTrophy"] ?? "",
        badge = json["strBadge"] ?? "",
        banner = json["strBanner"] ?? "",
        fanArt = FanArt.fromJson(json, "strFanart");
}


class FanArt {

  List<String> images = [];

  FanArt.fromJson(Map json, String base) {
    for(int x = 1; x < 5; x++) {
      final n = json[base + "$x"];
      if (n != null) {
        images.add(n);
      }
    }
  }
}