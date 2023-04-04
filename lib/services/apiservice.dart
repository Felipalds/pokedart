import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:pokedart/constants.dart';
import 'package:pokedart/models/pokemon_model.dart';

class ApiService {
  Future<List<Pokemon>?> getPokemon() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.pokemonsEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<Pokemon> _model = pokemonFromJson(response.body) as List<Pokemon>;
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
