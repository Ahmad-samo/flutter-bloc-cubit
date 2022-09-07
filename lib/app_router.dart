import 'package:flutter/material.dart';
import 'package:flutter_application_bloc/busnise%20logic/cubit/charactrs_cubit.dart';
import 'package:flutter_application_bloc/data/api/allcharactrs_api.dart';
import 'package:flutter_application_bloc/data/moudls/characts_moud.dart';
import 'package:flutter_application_bloc/data/repstry/chractrs_reposty.dart';
import 'package:flutter_application_bloc/presntation/screens/allcharacts.dart';
import 'consts/strings.dart';
import 'presntation/screens/detailsscreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Approuter {
  late Chractrsreposty chractrsreposty;
  late CharactrsCubit charactrsCubit;
  Approuter() {
    chractrsreposty = Chractrsreposty(AllChractrsapi());
    charactrsCubit = CharactrsCubit(chractrsreposty);
  }
  Route? generatroute(RouteSettings settings) {
    switch (settings.name) {
      case allchractsrout:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext contxt) => charactrsCubit,
            child: Allchracts(),
          ),
        );
      case chrctsdetals:
        final characts_moud = settings.arguments as Characts_moud;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (BuildContext context) =>
                    CharactrsCubit(chractrsreposty),
                child: Chractrsdetails(characts_moud: characts_moud)));
    }
  }
}
