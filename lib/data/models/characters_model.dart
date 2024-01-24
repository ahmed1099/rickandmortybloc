class Character {
  int? charId;
  String? name;
  String? status;
  String? species;
  String? type;
  String? gender;
  String? image;
  List<String>? episode;
  String? url;
  String? created;

  Character.fromJson(
    Map<String, dynamic> json,
  ) {
    charId = json['id'];
    name = json['name'];
    status = json['status'];
    species = json['species'];
    type = json['type'];
    gender = json['gender'];
    image = json['image'];
    episode = json['episode'].cast<String>();
    url = json['url'];
    created = json['created'];
  }
}
