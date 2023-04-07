import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pokedart/data/dummy_pokemons.dart';
import 'package:pokedart/models/pokemon.dart';

class Pokemons with ChangeNotifier {
  final Map<String, Pokemon> _items = {...DUMMY_POKEMONS};

  List<Pokemon> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Pokemon byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(Pokemon pokemon) {
    if (pokemon == null) {
      return;
    }

    if (pokemon.id != null &&
        pokemon.id.trim().isNotEmpty &&
        _items.containsKey(pokemon.id)) {
      _items.update(pokemon.id, (_) => pokemon);
    } else {
      final id = Random().nextDouble().toString();

      _items.putIfAbsent(
        id,
        () => Pokemon(
          id: id,
          name: pokemon.name,
          type: pokemon.type,
          avatarUrl: pokemon.avatarUrl,
        ),
      );
    }
    notifyListeners();
  }

  void remove(Pokemon pokemon) {
    if (pokemon != null && pokemon.id != null) {
      _items.remove(pokemon.id);
      notifyListeners();
    }
  }
}
