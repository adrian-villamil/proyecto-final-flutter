import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_final/models/video.model.dart';
import 'package:proyecto_final/providers/videos.provider.dart';
import 'package:proyecto_final/widgets/card.widget.dart';

class DetallesPage extends StatefulWidget {
  const DetallesPage({super.key});

  @override
  State<DetallesPage> createState() => _DetallesPageState();
}

class _DetallesPageState extends State<DetallesPage> {
  final videoProvider = VideoProvider();
  late Future<List<VideoModel>> videos;

  @override
  void initState() {
    videos = videoProvider.obtenerVideos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Videos"),
      ),
      body: FutureBuilder(
        future: videos,
        builder: ((context, snapshot) {
          List<Widget> lista = [];

          if (snapshot.hasData) {
            snapshot.data?.forEach(((element) => lista.add(CardWidget(
                  video: element,
                ))));
            return ListView(
              children: lista,
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        }),
      ),
    );
  }
}
