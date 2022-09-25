import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:fwfh_webview/fwfh_webview.dart';
import 'package:proyecto_final/models/video.model.dart';

// ignore: must_be_immutable
class CardWidget extends StatelessWidget {
  CardWidget({super.key, required this.video, required this.contador});

  VideoModel video;
  int contador;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$contador: ${video.title}',
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          HtmlWidget(
            '<iframe style="width:${MediaQuery.of(context).size.width}%;" src="https://www.youtube.com/embed/${video.id}"></iframe>',
            factoryBuilder: () => MyWidgetFactory(),
          )
        ],
      ),
    );
  }
}

class MyWidgetFactory extends WidgetFactory with WebViewFactory {}
