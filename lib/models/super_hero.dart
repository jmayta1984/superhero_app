class SuperHero {
  String id;
  String name;
  String realName;
  String placeOfBirth;
  String publisher;
  String poster;
  String speed;
  String power;

  SuperHero({
    required this.id,
    required this.name,
    required this.realName,
    required this.placeOfBirth,
    required this.publisher,
    required this.poster,
    required this.speed,
    required this.power,
  });

  factory SuperHero.fromJson(Map<String, dynamic> json) {
    return SuperHero(
      id: json['id'],
      name: json['name'],
      realName: json['biography']['full-name'],
      placeOfBirth: json['biography']['place-of-birth'],
      publisher: json['biography']['publisher'],
      poster: json['image']['url'],
      speed: json['powerstats']['speed'],
      power: json['powerstats']['power'],
    );
  }
}
