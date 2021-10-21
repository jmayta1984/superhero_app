import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:superhero_app/models/super_hero.dart';

class HttpHelper {
  Future<List> fetchSuperHeros() async {
    String urlString =
        "https://www.superheroapi.com/api.php/10157703717092094/search/spider";

    Uri url = Uri.parse(urlString);

    http.Response response = await http.get(url);

    if (response.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(response.body);
      final maps = jsonResponse['results'];

      List superHeros = maps
          .map((map) => SuperHero.fromJson(map))
          .toList();
      return superHeros;
    }
    return [];
  }
}
