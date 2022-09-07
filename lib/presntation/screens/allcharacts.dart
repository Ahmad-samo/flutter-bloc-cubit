// ignore_for_file: prefer_const_constructors

import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_bloc/busnise%20logic/cubit/charactrs_cubit.dart';
import 'package:flutter_application_bloc/data/moudls/characts_moud.dart';
import 'package:flutter_application_bloc/presntation/widgets/charactrs_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';

class Allchracts extends StatefulWidget {
  @override
  State<Allchracts> createState() => _AllchractsState();
}

class _AllchractsState extends State<Allchracts> {
  late List<Characts_moud> allcharactrs;
  late List<Characts_moud> serchcharactr;
  bool _issearching = false;
  final _searchcontrol = TextEditingController();

  @override
  void initState() {
    super.initState();
    final x = BlocProvider.of<CharactrsCubit>(context);
    x.getcharactrscubit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        leading: _issearching
            ? BackButton(
                color: Colors.grey,
              )
            : Container(),
        title: _issearching ? _buildsearch() : _builaappbartitle(),
        actions: _buildaction(),
      ),
      body: OfflineBuilder(connectivityBuilder: (
        BuildContext context,
        ConnectivityResult connectivity,
        Widget child,
      ) {
        final bool connected = connectivity != ConnectivityResult.none;
        if (connected) {
          return buildblocwiget();
        } else {
          return nointernet();
        }
      }),

      // buildblocwiget(),
    );
  }

  Widget buildblocwiget() {
    return BlocBuilder<CharactrsCubit, CharactrsState>(
      builder: (context, state) {
        if (state is Charactrsloaded) {
          allcharactrs = (state).characts;
          return buildloadedwiget();
        } else {
          return loadingwiget();
        }
      },
    );
  }

  Widget buildloadedwiget() {
    return SingleChildScrollView(
      child: Container(
        color: Colors.grey.shade600,
        child: Column(
          children: [
            buildlistwiget(),
          ],
        ),
      ),
    );
  }

  Widget loadingwiget() {
    return Center(
      child: CircularProgressIndicator(
        color: Colors.yellow.shade400,
      ),
    );
  }

  Widget buildlistwiget() {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 1,
          mainAxisExtent: 1,
        ),
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: _searchcontrol.text.isEmpty
            ? allcharactrs.length
            : serchcharactr.length,
        itemBuilder: (context, index) {
          return Charactrsitem(
            characts_moud: _searchcontrol.text.isEmpty
                ? allcharactrs[index]
                : serchcharactr[index],
          );
        });
  }

  Widget _buildsearch() {
    return TextField(
      controller: _searchcontrol,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        hintText: 'find a chrarector.....',
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.black, fontSize: 18),
      ),
      style: TextStyle(color: Colors.grey, fontSize: 18),
      onChanged: (searchchractr) {
        addchractrsfilter(searchchractr);
      },
    );
  }

  void addchractrsfilter(String searchchractr) {
    serchcharactr = allcharactrs
        .where((Characts_moud) =>
            Characts_moud.name!.toLowerCase().startsWith(searchchractr))
        .toList();
    setState(() {});
  }

  List<Widget> _buildaction() {
    if (_issearching) {
      return [
        IconButton(
          onPressed: () {
            _clearsearch();
            Navigator.pop(context);
          },
          icon: Icon(Icons.clear, color: Colors.grey),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: _startsearch,
          icon: Icon(
            Icons.search,
            color: Colors.grey,
          ),
        ),
      ];
    }
  }

  void _startsearch() {
    ModalRoute.of(context)!.addLocalHistoryEntry(
      LocalHistoryEntry(onRemove: _stopsearch),
    );
  }

  void _stopsearch() {
    _clearsearch();
  }

  void _clearsearch() {
    setState(() {
      _searchcontrol.clear();
    });
  }

  Widget _builaappbartitle() {
    return Text(
      "chractrs",
      style: TextStyle(color: Colors.grey),
    );
  }

  Widget nointernet() {
    return Center(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              'can nt connected.....please chech internet',
              style: TextStyle(fontSize: 24, color: Colors.grey),
            ),
            Image.asset('assets/images/nointernet.png'),
          ],
        ),
      ),
    );
  }
}
