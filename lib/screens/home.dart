// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:superhero_app/screens/favorite_list.dart';
import 'package:superhero_app/screens/super_hero_list.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SuperHero App'),
      ),
      body: FavoriteList(),
    );
  }
}
