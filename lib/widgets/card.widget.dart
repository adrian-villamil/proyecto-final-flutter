import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_final/models/video.model.dart';

class CardWidget extends StatelessWidget {
  CardWidget({super.key, required this.video});

  VideoModel video;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.blueGrey,
        height: 400,
        child: Column(children: [
          Text(video.title),
          Image.network(video.thumbnail),
        ]),
      ),
    );
  }
}
