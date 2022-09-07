import 'package:flutter/material.dart';
import 'package:flutter_application_bloc/consts/strings.dart';

import '../../data/moudls/characts_moud.dart';

class Charactrsitem extends StatelessWidget {
  final Characts_moud characts_moud;

  const Charactrsitem({Key? key, required this.characts_moud})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, chrctsdetals,
            arguments: characts_moud),
        child: GridTile(
          // ignore: sort_child_properties_last
          child: Hero(
            tag: characts_moud.charId,
            child: Container(
              color: Colors.grey,
              child: characts_moud.img.isNotEmpty
                  ? FadeInImage.assetNetwork(
                      width: double.infinity,
                      height: double.infinity,
                      placeholder: 'assets/images/loading.gif',
                      image: characts_moud.img,
                      fit: BoxFit.cover,
                    )
                  : Image.asset('assets/images/placehorde.png'),
            ),
          ),
          footer: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            color: Colors.black54,
            alignment: Alignment.bottomCenter,
            child: Text(
              '${characts_moud.name}',
              // ignore: prefer_const_constructors
              style: TextStyle(
                height: 1.3,
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
