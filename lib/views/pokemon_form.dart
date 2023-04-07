import 'package:flutter/material.dart';

class PokemonForm extends StatelessWidget {
  const PokemonForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pokémonsssss"), actions: [
        IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.save))
      ]),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Type'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Picture URL'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
