import 'package:flutter/material.dart';
import 'package:pokedart/models/pokemon_model.dart';
import 'package:pokedart/services/apiservice.dart';

void main() {
  runApp(const PokemonCards());
}

class PokemonCards extends StatefulWidget {
  const PokemonCards({Key? key}) : super(key: key);

  @override
  _PokemonState createState() => _PokemonState();
}

class _PokemonState extends State<PokemonCards> {
  late List<Pokemon>? _pokemonModel = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _pokemonModel = (await ApiService().getPokemon())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorSchemeSeed: const Color(0xff6750a4), useMaterial3: true),
      home: Scaffold(
          appBar: AppBar(title: const Text('PokeDart')),
          body: _pokemonModel == null || _pokemonModel!.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Center(
                  child: Row(children: []),
                )),
    );
  }
}

class ElevatedCardExample extends StatelessWidget {
  const ElevatedCardExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Card(
        child: SizedBox(
          width: 175,
          height: 100,
          child: Center(child: Text('Elevated Card')),
        ),
      ),
    );
  }
}

class FilledCardExample extends StatelessWidget {
  const FilledCardExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 0,
        color: Theme.of(context).colorScheme.surfaceVariant,
        child: const SizedBox(
          width: 175,
          height: 100,
          child: Center(child: Text('Filled Card')),
        ),
      ),
    );
  }
}

class OutlinedCardExample extends StatelessWidget {
  const OutlinedCardExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: const SizedBox(
          width: 175,
          height: 100,
          child: Center(child: Text('Outlined Card')),
        ),
      ),
    );
  }
}
