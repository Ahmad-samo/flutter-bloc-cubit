// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_bloc/busnise%20logic/cubit/charactrs_cubit.dart';
import 'package:flutter_application_bloc/data/moudls/characts_moud.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/animation.dart';

class Chractrsdetails extends StatelessWidget {
  final Characts_moud characts_moud;

  // ignore: non_constant_identifier_names
  const Chractrsdetails({super.key, required this.characts_moud});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: CustomScrollView(
        slivers: [
          _buildappar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding: EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      charactrinfo(
                          'job : ', characts_moud.occupation!.join(" \ ")),
                      deviderbuild(315),
                      charactrinfo('appeard in :  ', characts_moud.category),
                      deviderbuild(250),
                      charactrinfo(
                          'sessons :  ', characts_moud.appearance!.join(' \ ')),
                      deviderbuild(280),
                      charactrinfo('status :  ', characts_moud.status),
                      deviderbuild(300),
                      characts_moud.betterCallSaulAppearance!.isEmpty
                          ? Container()
                          : charactrinfo(
                              'better call saul session :',
                              characts_moud.betterCallSaulAppearance!
                                  .join(' \ ')),
                      characts_moud.betterCallSaulAppearance!.isEmpty
                          ? Container()
                          : deviderbuild(250),
                      charactrinfo('actors :  ', characts_moud.portrayed),
                      deviderbuild(235),
                      SizedBox(
                        height: 20,
                      ),
                      BlocBuilder<CharactrsCubit, CharactrsState>(
                          builder: (context, state) {
                        return getquotesorno(state);
                      })
                    ],
                  ),
                ),
                SizedBox(
                  height: 600,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildappar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: Colors.grey,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          characts_moud.nickname,
          // ignore: prefer_const_constructors
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        background: Hero(
            tag: characts_moud.charId,
            child: Image.network(
              characts_moud.img,
              fit: BoxFit.cover,
            )),
      ),
    );
  }

  Widget charactrinfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: value,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget deviderbuild(double value) {
    return Divider(
      height: 60,
      endIndent: value,
      color: Colors.yellow,
    );
  }

  Widget getquotesorno(CharactrsState state) {
    if (state is Quotsloaded) {
      return shadowanmaited(state);
    } else {
      return shadowcircleindicator();
    }
  }

  Widget shadowanmaited(State) {
    var quotes = (State).quots;
    if (quotes.length != 0) {
      int randomquot = Random().nextInt(quotes.length - 1);
      return Center(
        child: DefaultTextStyle(
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, color: Colors.white, shadows: [
            Shadow(blurRadius: 7, color: Colors.yellow, offset: Offset(0, 0)),
          ]),
          child: AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              FlickerAnimatedText(quotes[randomquot].qoute),
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget shadowcircleindicator() {
    return Center(
      child: CircularProgressIndicator(
        color: Colors.yellow,
      ),
    );
  }
}
