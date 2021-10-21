import 'package:flutter/material.dart';
import 'package:superhero_app/models/super_hero.dart';
import 'package:superhero_app/utils/http_helper.dart';

class SuperHeroList extends StatefulWidget {
  const SuperHeroList({Key? key}) : super(key: key);

  @override
  _SuperHeroListState createState() => _SuperHeroListState();
}

class _SuperHeroListState extends State<SuperHeroList> {
  late List superHeros;
  late HttpHelper httpHelper;

  @override
  void initState() {
    superHeros = [];
    httpHelper = HttpHelper();
    fetchSuperHeros();
    super.initState();
  }

  void fetchSuperHeros() {
    httpHelper.fetchSuperHeros().then((value) {
      setState(() {
        superHeros = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: superHeros.length,
        itemBuilder: (context, index) {
          return SuperHeroItem(superHero: superHeros[index]);
        });
  }
}

class SuperHeroItem extends StatelessWidget {
  final SuperHero superHero;
  const SuperHeroItem({Key? key, required this.superHero}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(superHero.name),
        subtitle: Text(superHero.realName),
        leading: Image.network(superHero.poster),
      ),
    );
  }
}
