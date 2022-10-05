import 'dart:convert';

ZooAnimal zooAnimalFromMap(String str) => ZooAnimal.fromMap(json.decode(str));

String zooAnimalToMap(ZooAnimal data) => json.encode(data.toMap());

class ZooAnimal {
  ZooAnimal({
    required this.name,
    required this.latinName,
    required this.animalType,
    required this.activeTime,
    required this.lengthMin,
    required this.lengthMax,
    required this.weightMin,
    required this.weightMax,
    required this.lifespan,
    required this.habitat,
    required this.diet,
    required this.geoRange,
    required this.imageLink,
    required this.id,
  });

  final String name;
  final String latinName;
  final String animalType;
  final String activeTime;
  final String lengthMin;
  final String lengthMax;
  final String weightMin;
  final String weightMax;
  final String lifespan;
  final String habitat;
  final String diet;
  final String geoRange;
  final String imageLink;
  final int id;

  factory ZooAnimal.fromMap(Map<String, dynamic> json) => ZooAnimal(
        name: json["name"],
        latinName: json["latin_name"],
        animalType: json["animal_type"],
        activeTime: json["active_time"],
        lengthMin: json["length_min"],
        lengthMax: json["length_max"],
        weightMin: json["weight_min"],
        weightMax: json["weight_max"],
        lifespan: json["lifespan"],
        habitat: json["habitat"],
        diet: json["diet"],
        geoRange: json["geo_range"],
        imageLink: json["image_link"],
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "latin_name": latinName,
        "animal_type": animalType,
        "active_time": activeTime,
        "length_min": lengthMin,
        "length_max": lengthMax,
        "weight_min": weightMin,
        "weight_max": weightMax,
        "lifespan": lifespan,
        "habitat": habitat,
        "diet": diet,
        "geo_range": geoRange,
        "image_link": imageLink,
        "id": id,
      };
}
