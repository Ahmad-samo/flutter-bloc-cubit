part of 'charactrs_cubit.dart';

@immutable
abstract class CharactrsState {}

class CharactrsInitial extends CharactrsState {}

class Charactrsloaded extends CharactrsState {
  final List<Characts_moud> characts;

  Charactrsloaded(this.characts);
}

class Quotsloaded extends CharactrsState {
  final List<Quote> quots;

  Quotsloaded(this.quots);
}
