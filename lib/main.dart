import 'package:flutter/material.dart';
import 'package:flutter_application_bloc/app_router.dart';

void main() {
  runApp(Breakingapp(approuter: Approuter(),));
}

class Breakingapp extends StatelessWidget {
  final Approuter approuter;

  const Breakingapp({super.key, required this.approuter});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: approuter.generatroute,
    );
  }
}
