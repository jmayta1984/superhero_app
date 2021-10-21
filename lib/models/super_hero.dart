class SuperHero {
  String name;
  String realName;
  String poster;

  SuperHero({
    required this.name,
    required this.realName,
    required this.poster,
  });

  factory SuperHero.fromJson(Map<String, dynamic> json) {
    return SuperHero(
      name: json['name'],
      realName: json['biography']['full-name'],
      poster: json['image']['url'],
    );
  }
}
