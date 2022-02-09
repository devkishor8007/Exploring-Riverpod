class NoteModel {
  int? id;
  String? name;
  String? desc;
  NoteModel({
    this.id,
    this.name,
    this.desc,
  });

  factory NoteModel.fromMap(Map<String, dynamic> json) => NoteModel(
        id: json['id'],
        name: json['name'],
        desc: json['desc'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      "name": name,
      "desc": desc,
    };
  }
}
