import 'package:flutter/material.dart';
import 'package:proyecto_final/pages/amazon.detalles.page.dart';
import 'package:proyecto_final/pages/disney.detalles.page.dart';
import 'package:proyecto_final/pages/netflix.detalles.page.dart';

import 'hbo.detalles.page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ENTRETENIMIENTO HD'),
      ),
      body: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NetflixDetallesPage(),
                    ));
              },
              child: Container(
                color: Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/netflix-logo.png',
                      width: 300,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AmazonDetallesPage(),
                    ));
              },
              child: Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/amazonprimevideo-logo.png',
                      width: 400,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DisneyDetallesPage(),
                    ));
              },
              child: Container(
                color: const Color.fromRGBO(17, 60, 207, 1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/disneyplus-logo.png',
                      width: 600,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HboDetallesPage(),
                    ));
              },
              child: Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/hbomax-logo.png',
                      width: 400,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
