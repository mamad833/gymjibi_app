class BookesUser {
  final String? id;

  final Gym? gym;
  final String? day;

  final String? status;


  BookesUser({
    this.id,

    this.gym,
    this.day,

    this.status,

  });

  BookesUser.fromJson(Map<String, dynamic> json)
      : id = json['_id'] as String?,

        gym = (json['gym'] as Map<String,dynamic>?) != null ? Gym.fromJson(json['gym'] as Map<String,dynamic>) : null,
        day = json['day'] as String?,

        status = json['status'] as String?
       ;

  Map<String, dynamic> toJson() => {
    '_id' : id,

    'gym' : gym?.toJson(),
    'day' : day,


    'status' : status,

  };
}

class Gym {
  final String? id;
  final String? owner;
  final String? name;

  final List<String>? gallery;


  Gym({
    this.id,
    this.owner,
    this.name,

    this.gallery,

  });

  Gym.fromJson(Map<String, dynamic> json)
      : id = json['_id'] as String?,
        owner = json['owner'] as String?,
        name = json['name'] as String?,

        gallery = (json['gallery'] as List?)?.map((dynamic e) => e as String).toList();

  Map<String, dynamic> toJson() => {
    '_id' : id,
    'owner' : owner,
    'name' : name,

    'gallery' : gallery,


  };
}