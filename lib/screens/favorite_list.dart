import 'package:flutter/material.dart';
import 'package:superhero_app/utils/db_helper.dart';

class FavoriteList extends StatefulWidget {
  const FavoriteList({Key? key}) : super(key: key);

  @override
  _FavoriteListState createState() => _FavoriteListState();
}

class _FavoriteListState extends State<FavoriteList> {
  late Future<List> superHeros;
  late DbHelper dbHelper;

  @override
  void initState() {
    super.initState();
    dbHelper = DbHelper();
    superHeros = fetchFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
        future: superHeros,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data?[index].name),
                    trailing: IconButton(
                      onPressed: () {
                        dbHelper.deleteSuperHero(snapshot.data?[index]);
                        setState(() {
                          snapshot.data?.removeAt(index);
                        });
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  );
                });
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  Future<List> fetchFavorites() async {
    await dbHelper.openDb();
    return dbHelper.fetchSuperHeros();
  }
}
