import 'package:flutter/material.dart';
import 'package:superhero_app/screens/super_hero_list.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SuperHeroList(),
    );
  }
}