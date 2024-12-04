import 'package:flutter/material.dart';

import '../common/carrousel.dart';

class Landpage extends StatefulWidget {
  const Landpage({super.key});

  @override
  State<Landpage> createState() => _LandpageState();
}

class _LandpageState extends State<Landpage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Carrousel(),
    );
  }
}