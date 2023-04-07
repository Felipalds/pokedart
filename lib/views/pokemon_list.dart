import 'package:flutter/material.dart';
import 'package:pokedart/components/pokemon_tile.dart';
import 'package:pokedart/data/dummy_pokemons.dart';
import 'package:pokedart/models/pokemon.dart';
import 'package:pokedart/routes/app_routes.dart';
import 'package:provider/provider.dart';

import '../provider/pokemons.dart';

class PokemonList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Pokemons pokemons = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Pokedart List"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.USER_FORM,
                    arguments: Pokemon(name: "", type: ""));
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
          itemBuilder: (ctx, i) => PokemonTile(pokemons.byIndex(i)),
          itemCount: pokemons.count),
    );
  }
}
