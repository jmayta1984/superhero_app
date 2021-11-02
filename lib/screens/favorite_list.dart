import 'package:flutter/material.dart';
import 'package:superhero_app/utils/db_helper.dart';

class FavoriteList extends StatefulWidget {
  const FavoriteList({Key? key}) : super(key: key);

  @override
  _FavoriteListState createState() => _FavoriteListState();
}

class _FavoriteListState extends State<FavoriteList> {
  late List superHeros;
  late DbHelper dbHelper;

  @override
  void initState() {
    super.initState();
    dbHelper = DbHelper();
    fetchFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: superHeros.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: superHeros[index].name,
            trailing: IconButton(
              onPressed: () {
                dbHelper.deleteSuperHero(superHeros[index]);
              },
              icon: const Icon(Icons.remove),
            ),
          );
        });
  }

  Future fetchFavorites() async {
    await dbHelper.openDb();
    final result = await dbHelper.fetchSuperHeros();
    setState(() {
      superHeros = result;
    });
  }
}
