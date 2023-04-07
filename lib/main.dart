import 'package:flutter/material.dart';
import 'package:pokedart/provider/pokemons.dart';
import 'package:pokedart/routes/app_routes.dart';
import 'package:pokedart/views/pokemon_list.dart';
import 'package:pokedart/views/pokemon_form.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp()); //arrow function

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Pokemons(),
      child: MaterialApp(routes: {
        AppRoutes.HOME: (_) => PokemonList(),
        AppRoutes.USER_FORM: (ctx) => PokemonForm(),
      }),
    );
  }
}
