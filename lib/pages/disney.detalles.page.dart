import 'dart:io';

import 'package:flutter/material.dart';
import 'package:proyecto_final/models/video.model.dart';
import 'package:proyecto_final/providers/videos.provider.dart';
import 'package:proyecto_final/widgets/card.widget.dart';
import 'package:url_launcher/link.dart';

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
          int c = 1;

          if (snapshot.hasData) {
            snapshot.data?.forEach((element) => lista.add(CardWidget(
                  video: element,
                  contador: c++,
                )));
            lista.add(Center(
              child: Link(
                target: LinkTarget.blank,
                uri: Uri.parse(
                    "https://api.whatsapp.com/send?phone=573202343724&text=Comprar"),
                builder: (context, followLink) => ElevatedButton(
                  onPressed: followLink,
                  child: const Text("Comprar cuenta"),
                ),
              ),
            ));
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
