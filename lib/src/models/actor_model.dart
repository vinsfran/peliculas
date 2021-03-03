class ActoresModel {
  List<ActorModel> actores = new List();

  ActoresModel();

  ActoresModel.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;

    jsonList.forEach((item) {
      final actor = ActorModel.fromJsonMap(item);
      actores.add(actor);
    });
  }
}

class ActorModel {
  int castId;
  String character;
  String creditId;
  int gender;
  int id;
  String name;
  int order;
  String profilePath;
  bool adult;
  String knownForDepartment;
  String originalName;
  double popularity;
  String department;
  String job;

  ActorModel({
    this.castId,
    this.character,
    this.creditId,
    this.gender,
    this.id,
    this.name,
    this.order,
    this.profilePath,
    this.adult,
    this.knownForDepartment,
    this.originalName,
    this.popularity,
    this.department,
    this.job,
  });

  ActorModel.fromJsonMap(Map<String, dynamic> json) {
    castId = json['cast_id'];
    character = json['character'];
    creditId = json['credit_id'];
    gender = json['gender'];
    id = json['id'];
    name = json['name'];
    order = json['order'];
    profilePath = json['profile_path'];
    adult = json['adult'];
    knownForDepartment = json['known_for_department'];
    originalName = json['original_name'];
    popularity = json['popularity'] / 1;
    department = json['department'];
    job = json['job'];
  }

  getFoto() {
    if (profilePath == null) {
      return 'http://forum.spaceengine.org/styles/se/theme/images/no_avatar.jpg';
    } else {
      return 'https://image.tmdb.org/t/p/w500/$profilePath';
    }
  }
}
