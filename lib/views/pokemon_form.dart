import 'package:flutter/material.dart';
import 'package:pokedart/models/pokemon.dart';
import 'package:pokedart/provider/pokemons.dart';
import 'package:provider/provider.dart';

class PokemonForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  void _loadFormData(Pokemon pokemon) {
    _formData['name'] = pokemon.name;
    _formData['id'] = pokemon.id;
    _formData['avatarUrl'] = pokemon.avatarUrl;
    _formData['type'] = pokemon.type;
  }

  PokemonForm({super.key});

  @override
  Widget build(BuildContext context) {
    final pokemon = ModalRoute.of(context)?.settings.arguments as Pokemon;

    _loadFormData(pokemon);

    return Scaffold(
      appBar: AppBar(title: Text("Pokémonsssss"), actions: [
        IconButton(
            onPressed: () {
              final isValid = _form.currentState?.validate();
              if (isValid == true) {
                _form.currentState?.save();
                Provider.of<Pokemons>(context, listen: false).put(
                  Pokemon(
                    id: _formData['id']!,
                    name: _formData['name']!,
                    type: _formData['type']!,
                    avatarUrl: _formData['avatarUrl']!,
                  ),
                );
                Navigator.of(context).pop();
              }
            },
            icon: Icon(Icons.save))
      ]),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: [
              TextFormField(
                initialValue: _formData['name'],
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Name is invalid";
                  }
                  if (value.trim().length < 3) {
                    return "Name is too short. Min. 3 letters";
                  }
                  return null;
                },
                onSaved: (value) => _formData['name'] = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Type'),
                initialValue: _formData['type'],
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Type is required";
                  }
                  return null;
                },
                onSaved: (value) => _formData['type'] = value!,
              ),
              TextFormField(
                initialValue: _formData['avatarUrl'],
                decoration: InputDecoration(labelText: 'Picture URL'),
                onSaved: (value) => _formData['avatarUrl'] = value!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
