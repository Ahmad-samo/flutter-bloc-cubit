import 'package:bloc/bloc.dart';
import 'package:flutter_application_bloc/data/moudls/characts_moud.dart';
import 'package:flutter_application_bloc/data/moudls/qoute_moud.dart';
import 'package:flutter_application_bloc/data/repstry/chractrs_reposty.dart';
import 'package:meta/meta.dart';

part 'charactrs_state.dart';

class CharactrsCubit extends Cubit<CharactrsState> {
  Chractrsreposty chractrsreposty;
  List<Characts_moud> mycharactrs = [];
  CharactrsCubit(this.chractrsreposty) : super(CharactrsInitial());
  List<Characts_moud> getcharactrscubit() {
    chractrsreposty.getallchracrepost().then((charactrs) {
      emit(Charactrsloaded(charactrs));
      mycharactrs = charactrs;
    });
    return mycharactrs;
  }

  void getquotecubit(String charname) {
    chractrsreposty.getallquote(charname).then((quots) {
      emit(Quotsloaded(quots));
    });
  }
}
