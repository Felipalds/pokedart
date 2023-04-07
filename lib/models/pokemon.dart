class Pokemon {
  final String id;
  final String name;
  final String type;
  final String avatarUrl;

  const Pokemon({
    this.id = "",
    required this.name,
    required this.type,
    this.avatarUrl = "",
  });
}
