import 'package:flutter/material.dart';
import 'package:proyecto_final/models/video.model.dart';
import 'package:proyecto_final/providers/videos.provider.dart';
import 'package:proyecto_final/widgets/card.widget.dart';

class NetflixDetallesPage extends StatefulWidget {
  const NetflixDetallesPage({super.key});

  @override
  State<NetflixDetallesPage> createState() => _NetflixDetallesPageState();
}

class _NetflixDetallesPageState extends State<NetflixDetallesPage> {
  final videoProvider = VideoProvider();
  late Future<List<VideoModel>> videos;

  @override
  void initState() {
    videos = videoProvider.obtenerVideos('PL7bptl9TAMiwi81O-9TG9IQOZ5mi2vxjQ');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Videos"),
      ),
      body: FutureBuilder(
        future: videos,
        builder: ((context, snapshot) {
          List<Widget> lista = [];

          if (snapshot.hasData) {
            snapshot.data?.forEach((element) => lista.add(CardWidget(
                  video: element,
                )));
            return ListView(
              children: lista,
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }),
      ),
    );
  }
}
