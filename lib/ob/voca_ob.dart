class VocabularyOb {
  String? image;
  String? title;
  List<Vocalist>? vocalist;

  VocabularyOb({this.image, this.title, this.vocalist});

  VocabularyOb.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    title = json['title'];
    if (json['vocalist'] != null) {
      vocalist = <Vocalist>[];
      json['vocalist'].forEach((v) {
        vocalist!.add(Vocalist.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['image'] = this.image;
    data['title'] = this.title;
    if (this.vocalist != null) {
      data['vocalist'] = this.vocalist!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Vocalist {
  String? voca;
  String? gram;
  String? myanmar;

  Vocalist({this.voca, this.gram, this.myanmar});

  Vocalist.fromJson(Map<String, dynamic> json) {
    voca = json['voca'];
    gram = json['gram'];
    myanmar = json['myanmar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['voca'] = this.voca;
    data['gram'] = this.gram;
    data['myanmar'] = this.myanmar;
    return data;
  }
}
