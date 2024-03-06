class PanelProfileUserResponse {
  final String? id;
  final String? profile;
  final String? fullname;
  final String? phone;
  final String? dateOfBirth;
  final String? city;
  final String? gender;
  final String? email;
  final int? favoritesCount;
  final int? bookedsCount;
  final int? commentsCount;
  final List<Actions>? actions;
  final YaldaAward? yaldaAward;

  PanelProfileUserResponse({
    this.id,
    this.profile,
    this.fullname,
    this.phone,
    this.dateOfBirth,
    this.city,
    this.gender,
    this.email,
    this.favoritesCount,
    this.bookedsCount,
    this.commentsCount,
    this.actions,
    this.yaldaAward,
  });

  PanelProfileUserResponse.fromJson(Map<String, dynamic> json)
      : id = json['_id'] as String?,
        profile = json['profile'] as String?,
        fullname = json['fullname'] as String?,
        phone = json['phone'] as String?,
        dateOfBirth = json['date_of_birth'] as String?,
        city = json['city'] as String?,
        gender = json['gender'] as String?,
        email = json['email'] as String?,
        favoritesCount = json['favorites_count'] as int?,
        bookedsCount = json['bookeds_count'] as int?,
        commentsCount = json['comments_count'] as int?,
        actions = (json['actions'] as List?)?.map((dynamic e) => Actions.fromJson(e as Map<String,dynamic>)).toList(),
        yaldaAward = (json['yalda_award'] as Map<String,dynamic>?) != null ? YaldaAward.fromJson(json['yalda_award'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    '_id' : id,
    'profile' : profile,
    'fullname' : fullname,
    'phone' : phone,
    'date_of_birth' : dateOfBirth,
    'city' : city,
    'gender' : gender,
    'email' : email,
    'favorites_count' : favoritesCount,
    'bookeds_count' : bookedsCount,
    'comments_count' : commentsCount,
    'actions' : actions?.map((e) => e.toJson()).toList(),
    'yalda_award' : yaldaAward?.toJson()
  };
}

class Actions {
  final String? id;
  final String? user;
  final String? type;
  final String? image;
  final String? description;
  final String? createdAt;
  final String? updatedAt;
  final int? v;

  Actions({
    this.id,
    this.user,
    this.type,
    this.image,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Actions.fromJson(Map<String, dynamic> json)
      : id = json['_id'] as String?,
        user = json['user'] as String?,
        type = json['type'] as String?,
        image = json['image'] as String?,
        description = json['description'] as String?,
        createdAt = json['createdAt'] as String?,
        updatedAt = json['updatedAt'] as String?,
        v = json['__v'] as int?;

  Map<String, dynamic> toJson() => {
    '_id' : id,
    'user' : user,
    'type' : type,
    'image' : image,
    'description' : description,
    'createdAt' : createdAt,
    'updatedAt' : updatedAt,
    '__v' : v
  };
}

class YaldaAward {
  final bool? used;

  YaldaAward({
    this.used,
  });

  YaldaAward.fromJson(Map<String, dynamic> json)
      : used = json['used'] as bool?;

  Map<String, dynamic> toJson() => {
    'used' : used
  };
}