class Pet {
  final String name, imageUrl;
  final String tips;
  final int id;
  bool isFav;

  Pet(
      {required this.id, required this.name, required this.imageUrl, required this.tips, this.isFav = false});

  Map<String, dynamic> toMap() =>
      {
        'name': name,
        'imageUrl': imageUrl,
        'tips': tips,
        'id': id,
        'isFav': isFav
      };

  factory Pet.fromMap(Map<String, dynamic> map)=>
      Pet(id: map['id'],
          name: map['name'],
          imageUrl: map['imageUrl'],
          tips: map['tips'],
          isFav: map['isFav']);
}