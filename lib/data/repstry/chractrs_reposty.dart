import 'package:flutter_application_bloc/data/api/allcharactrs_api.dart';
import 'package:flutter_application_bloc/data/moudls/characts_moud.dart';
import 'package:flutter_application_bloc/data/moudls/qoute_moud.dart';

class Chractrsreposty {
  final AllChractrsapi allChractrsapi;

  Chractrsreposty(this.allChractrsapi);
  Future<List<Characts_moud>> getallchracrepost() async {
    final charatrs = await allChractrsapi.getallchracapi();
    return charatrs.map((chractr) => Characts_moud.fromJson(chractr)).toList();
  }

  Future<List<Quote>> getallquote(String charname) async {
    final quotes = await allChractrsapi.getallquote(charname);
    return quotes.map((charqute) => Quote.fromJson(charqute)).toList();
  }
}
