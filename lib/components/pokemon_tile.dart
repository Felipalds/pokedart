import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';
import 'package:pokedart/models/pokemon.dart';
import 'package:pokedart/routes/app_routes.dart';

class PokemonTile extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonTile(this.pokemon);

  @override
  Widget build(BuildContext context) {
    final avatar = pokemon.avatarUrl == null || pokemon.avatarUrl.isEmpty
        ? const CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(
            backgroundImage: NetworkImage(pokemon.avatarUrl),
          );

    return ListTile(
      leading: avatar,
      title: Text(pokemon.name),
      subtitle: Text(pokemon.type),
      trailing: Container(
          width: 100,
          child: Row(
            children: <Widget>[
              IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.USER_FORM);
                },
                icon: Icon(Icons.edit),
                color: Colors.orange,
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.delete),
                  color: Colors.red),
            ],
          )),
    );
  }
}
