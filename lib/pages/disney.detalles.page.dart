import 'package:flutter/material.dart';
import 'package:proyecto_final/models/video.model.dart';
import 'package:proyecto_final/providers/videos.provider.dart';
import 'package:proyecto_final/widgets/card.widget.dart';

class DisneyDetallesPage extends StatefulWidget {
  const DisneyDetallesPage({super.key});

  @override
  State<DisneyDetallesPage> createState() => _DisneyDetallesPageState();
}

class _DisneyDetallesPageState extends State<DisneyDetallesPage> {
  final videoProvider = VideoProvider();
  late Future<List<VideoModel>> videos;

  @override
  void initState() {
    videos = videoProvider.obtenerVideos('PL7bptl9TAMizeZyjOLGzY5mq-qcmRd65_');
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
