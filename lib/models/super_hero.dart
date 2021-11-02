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

  // Parsing data from json for networking
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

  // Serializing to map for local persistence
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  // Parsing data from map for local persistence
  factory SuperHero.fromMap(Map<String, dynamic> map) {
    return SuperHero(
      id: map['id'],
      name: map['name'],
      realName: '',
      placeOfBirth: '',
      publisher: '',
      poster: '',
      speed: '',
      power: '',
    );
  }
}
