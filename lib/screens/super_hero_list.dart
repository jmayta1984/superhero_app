import 'package:flutter/material.dart';
import 'package:superhero_app/models/super_hero.dart';
import 'package:superhero_app/screens/super_hero_detail.dart';
import 'package:superhero_app/utils/db_helper.dart';
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
    super.initState();
    superHeros = [];
    httpHelper = HttpHelper();
    fetchSuperHeros();
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

class SuperHeroItem extends StatefulWidget {
  final SuperHero superHero;
  const SuperHeroItem({Key? key, required this.superHero}) : super(key: key);

  @override
  State<SuperHeroItem> createState() => _SuperHeroItemState();
}

class _SuperHeroItemState extends State<SuperHeroItem> {
  late bool favorite;
  late DbHelper dbHelper;

  @override
  void initState() {
    favorite = false;
    dbHelper = DbHelper();
    ifFavorite();
    super.initState();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => SuperHeroDetail(superHero: widget.superHero)));
      },
      child: Card(
        child: ListTile(
            title: Text(widget.superHero.name),
            subtitle: Text(widget.superHero.realName),
            leading: Hero(
              tag: widget.superHero.id,
              child: Image.network(
                widget.superHero.poster,
              ),
            ),
            trailing: IconButton(
              onPressed: () {
                favorite
                    ? dbHelper.deleteSuperHero(widget.superHero)
                    : dbHelper.inserSuperHero(widget.superHero);
                setState(() {
                  favorite = !favorite;
                });
              },
              icon: Icon(
                Icons.favorite,
                color: favorite ? Colors.red : Colors.grey,
              ),
            )),
      ),
    );
  }

  Future ifFavorite() async {
    await dbHelper.openDb();
    final result = await dbHelper.isFavorite(widget.superHero);
    setState(() {
      favorite = result;
    });
  }
}
