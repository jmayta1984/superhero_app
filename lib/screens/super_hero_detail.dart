// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:superhero_app/models/super_hero.dart';

class SuperHeroDetail extends StatelessWidget {
  final SuperHero superHero;
  const SuperHeroDetail({Key? key, required this.superHero}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            centerTitle: false,
            floating: true,
            title: Text(superHero.name),
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: superHero.id,
                child: Image.network(superHero.poster),
                
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Column(
                  children: [
                    Text(superHero.name),
                    SuperHeroBiography(superHero: superHero),
                    SuperHeroStats(superHero: superHero),
                  ],
                ),
                Column(
                  children: [
                    Text(superHero.name),
                    SuperHeroBiography(superHero: superHero),
                    SuperHeroStats(superHero: superHero),
                  ],
                ),
                Column(
                  children: [
                    Text(superHero.name),
                    SuperHeroBiography(superHero: superHero),
                    SuperHeroStats(superHero: superHero),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SuperHeroBiography extends StatelessWidget {
  final SuperHero superHero;
  const SuperHeroBiography({Key? key, required this.superHero})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Biography'),
            Text('Full name: ${superHero.realName}'),
            Text('Place of birth: ${superHero.placeOfBirth}'),
            Text('Publisher: ${superHero.publisher}'),
          ],
        ),
      ),
    );
  }
}

class SuperHeroStats extends StatelessWidget {
  final SuperHero superHero;
  const SuperHeroStats({Key? key, required this.superHero}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Slider(
            value: double.parse(superHero.power),
            onChanged: (_) {},
            min: 0,
            max: 100,
          ),
          Slider(
            value: double.parse(superHero.speed),
            onChanged: (_) {},
            min: 0,
            max: 100,
          ),
          Slider(
            value: double.parse(superHero.speed),
            onChanged: (_) {},
            min: 0,
            max: 100,
          ),
          Slider(
            value: double.parse(superHero.speed),
            onChanged: (_) {},
            min: 0,
            max: 100,
          ),
        ],
      ),
    );
  }
}
