import 'dart:io';

import 'package:flutter/material.dart';
import 'package:proyecto_final/models/video.model.dart';
import 'package:proyecto_final/providers/videos.provider.dart';
import 'package:proyecto_final/widgets/card.widget.dart';
import 'package:url_launcher/link.dart';

class HboDetallesPage extends StatefulWidget {
  const HboDetallesPage({super.key});

  @override
  State<HboDetallesPage> createState() => _HboDetallesPageState();
}

class _HboDetallesPageState extends State<HboDetallesPage> {
  final videoProvider = VideoProvider();
  late Future<List<VideoModel>> videos;

  @override
  void initState() {
    videos = videoProvider.obtenerVideos('PL7bptl9TAMiyVU0d_W5bw7aBJUf_wDqjf');
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
