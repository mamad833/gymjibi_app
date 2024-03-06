class ResponseGetSingelGym {
  ResponseGetSingelGym({
    required this.gym,
    required this.isFavorite,
    required this.bookeds,
    required this.notes,
    required this.comments,
    required this.additionalProducts,
  });
  late final Gym gym;
  late final bool isFavorite;
  late final List<Bookeds> bookeds;
  late final List<dynamic> notes;
  late final List<Comments> comments;
  late final List<AdditionalProducts> additionalProducts;

  ResponseGetSingelGym.fromJson(Map<String, dynamic> json){
    gym = Gym.fromJson(json['gym']);
    isFavorite = json['isFavorite'];
    bookeds = List.from(json['bookeds']).map((e)=>Bookeds.fromJson(e)).toList();
    notes = List.castFrom<dynamic, dynamic>(json['notes']);
    comments = List.from(json['comments']).map((e)=>Comments.fromJson(e)).toList();
    additionalProducts = List.from(json['additional_products']).map((e)=>AdditionalProducts.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['gym'] = gym.toJson();
    _data['isFavorite'] = isFavorite;
    _data['bookeds'] = bookeds.map((e)=>e.toJson()).toList();
    _data['notes'] = notes;
    _data['comments'] = comments.map((e)=>e.toJson()).toList();
    _data['additional_products'] = additionalProducts.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Gym {
  Gym({
    required this.id,
    required this.owner,
    required this.name,
    required this.category,
    required this.poolDetails,
    required this.rate,
    required this.status,
    required this.enabled,
    required this.gallery,
    required this.address,
    required this.coordinates,
    required this.city,
    required this.priceStart,
    required this.reservedCount,
    required this.acceptedGender,
    required this.sansStart,
    required this.sansEnd,
    required this.sansDuration,
    required this.sansPerDay,
    required this.sansLimit,
    required this.sansVipMode,
    required this.minBookPersonCount,
    required this.maxBookPersonCount,
    required this.changePriceByPeople,
    required this.fee,
    required this.features,
    required this.reserveMethod,
    required this.description,
    required this.priceTable,
    required this.createdAt,
    required this.updatedAt,
    required this.V,
    required this.discountPrice,
  });
  late final String id;
  late final String owner;
  late final String name;
  late final String category;
  late final PoolDetails? poolDetails;
  late final num rate;
  late final String status;
  late final bool enabled;
  late final List<String> gallery;
  late final String address;
  late final String coordinates;
  late final String city;
  late final String priceStart;
  late final int reservedCount;
  late final String acceptedGender;
  late final String? sansStart;
  late final String? sansEnd;
  late final String sansDuration;
  late final int? sansPerDay;
  late final int sansLimit;
  late final bool sansVipMode;
  late final num? minBookPersonCount;
  late final num? maxBookPersonCount;
  late final bool changePriceByPeople;
  late final num fee;
  late final List<String> features;
  late final String reserveMethod;
  late final String description;
  late final List<PriceTable> priceTable;
  late final String createdAt;
  late final String updatedAt;
  late final int V;
  int discountPrice =0;

  Gym.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    owner = json['owner'];
    name = json['name'];
    category = json['category'];
    poolDetails = PoolDetails?.fromJson(json['pool_details']);
    rate = json['rate'];
    status = json['status'];
    enabled = json['enabled'];
    gallery = List.castFrom<dynamic, String>(json['gallery']);
    address = json['address'];
    coordinates = json['coordinates'];
    city = json['city'];
    priceStart = json['price_start'];
    reservedCount = json['reserved_count'];
    acceptedGender = json['accepted_gender'];
    sansStart = json['sans_start'];
    sansEnd = json['sans_end'];
    sansDuration = json['sans_duration'];
    sansPerDay = json['sans_per_day'];
    sansLimit = json['sans_limit'];
    sansVipMode = json['sans_vip_mode'];
    minBookPersonCount = json['min_book_person_count'];
    maxBookPersonCount = json['max_book_person_count'];
    changePriceByPeople = json['change_price_by_people'];
    fee = json['fee'];
    features = List.castFrom<dynamic, String>(json['features']);
    reserveMethod = json['reserve_method'];
    description = json['description'];
    priceTable = List.from(json['price_table']).map((e)=>PriceTable.fromJson(e)).toList();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    V = json['__v'];
    json['discount_price'] == null ? null :discountPrice = json['discount_price'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['owner'] = owner;
    _data['name'] = name;
    _data['category'] = category;
    _data['pool_details'] = poolDetails?.toJson();
    _data['rate'] = rate;
    _data['status'] = status;
    _data['enabled'] = enabled;
    _data['gallery'] = gallery;
    _data['address'] = address;
    _data['coordinates'] = coordinates;
    _data['city'] = city;
    _data['price_start'] = priceStart;
    _data['reserved_count'] = reservedCount;
    _data['accepted_gender'] = acceptedGender;
    _data['sans_start'] = sansStart;
    _data['sans_end'] = sansEnd;
    _data['sans_duration'] = sansDuration;
    _data['sans_per_day'] = sansPerDay;
    _data['sans_limit'] = sansLimit;
    _data['sans_vip_mode'] = sansVipMode;
    _data['min_book_person_count'] = minBookPersonCount;
    _data['max_book_person_count'] = maxBookPersonCount;
    _data['change_price_by_people'] = changePriceByPeople;
    _data['fee'] = fee;
    _data['features'] = features;
    _data['reserve_method'] = reserveMethod;
    _data['description'] = description;
    _data['price_table'] = priceTable.map((e)=>e.toJson()).toList();
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['__v'] = V;
    _data['discount_price'] = discountPrice;
    return _data;
  }
}

class PoolDetails {
  PoolDetails({
    required this.description,
    required this.tableImg,
  });
  late final String? description;
  late final String? tableImg;

  PoolDetails.fromJson(Map<String, dynamic>? json){
    description = json?['description'];
    tableImg = json?['table_img'];
  }

  Map<String, dynamic>? toJson() {
    final _data = <String, dynamic>{};
    _data['description'] = description;
    _data['table_img'] = tableImg;
    return _data;
  }
}

class PriceTable {
  PriceTable({
    required this.day,
    required this.period,
    required this.price,
    required this.discount,
    required this.enable,
  });
  late final String day;
  late final String period;
  late final int price;
  late final int discount;
  late final bool enable;

  PriceTable.fromJson(Map<String, dynamic> json){
    day = json['day'];
    period = json['period'];
    price = json['price'];
    discount = json['discount'];
    enable = json['enable'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['day'] = day;
    _data['period'] = period;
    _data['price'] = price;
    _data['discount'] = discount;
    _data['enable'] = enable;
    return _data;
  }
}

class Bookeds {
  Bookeds({
    required this.paying,
    required this.handlingValidation,
    required this.id,
    required this.code,
    required this.customer,
    required this.gym,
    required this.day,
    required this.date,
    required this.period,
    required this.personsCount,
    required this.status,
    required this.cost,
    required this.additionalProducts,
    required this.createdAt,
    required this.updatedAt,
    required this.V,
    required this.suggestedComment,
  });
  late final bool paying;
  late final bool handlingValidation;
  late final String id;
  late final int code;
  late final String customer;
  late final String gym;
  late final String day;
  late final String date;
  late final String period;
  late final int personsCount;
  late final String status;
  late final int cost;
  late final List<dynamic> additionalProducts;
  late final String createdAt;
  late final String updatedAt;
  late final int V;
  late final bool suggestedComment;

  Bookeds.fromJson(Map<String, dynamic> json){
    paying = json['paying'];
    handlingValidation = json['handlingValidation'];
    id = json['_id'];
    code = json['code'];
    customer = json['customer'];
    gym = json['gym'];
    day = json['day'];
    date = json['date'];
    period = json['period'];
    personsCount = json['persons_count'];
    status = json['status'];
    cost = json['cost'];
    additionalProducts = List.castFrom<dynamic, dynamic>(json['additional_products']);
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    V = json['__v'];
    suggestedComment = json['suggested_comment'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['paying'] = paying;
    _data['handlingValidation'] = handlingValidation;
    _data['_id'] = id;
    _data['code'] = code;
    _data['customer'] = customer;
    _data['gym'] = gym;
    _data['day'] = day;
    _data['date'] = date;
    _data['period'] = period;
    _data['persons_count'] = personsCount;
    _data['status'] = status;
    _data['cost'] = cost;
    _data['additional_products'] = additionalProducts;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['__v'] = V;
    _data['suggested_comment'] = suggestedComment;
    return _data;
  }
}

class Comments {
  Comments({
    required this.id,
    required this.username,
    required this.userprofile,
    required this.userrole,
    required this.title,
    required this.body,
    required this.rate,
    required this.postedAt,
    required this.updatedAt,
    required this.replys,
  });
  late final String id;
  late final String username;
  late final String userprofile;
  late final String userrole;
  late final String title;
  late final String body;
  late final Rate rate;
  late final String postedAt;
  late final String updatedAt;
  late final List<dynamic> replys;

  Comments.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    username = json['username'];
    userprofile = json['userprofile'];
    userrole = json['userrole'];
    title = json['title'];
    body = json['body'];
    rate = Rate.fromJson(json['rate']);
    postedAt = json['postedAt'];
    updatedAt = json['updatedAt'];
    replys = List.castFrom<dynamic, dynamic>(json['replys']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['username'] = username;
    _data['userprofile'] = userprofile;
    _data['userrole'] = userrole;
    _data['title'] = title;
    _data['body'] = body;
    _data['rate'] = rate.toJson();
    _data['postedAt'] = postedAt;
    _data['updatedAt'] = updatedAt;
    _data['replys'] = replys;
    return _data;
  }
}

class Rate {
  Rate({
    required this.cleanliness,
    required this.location,
    required this.price,
    required this.service,
  });
  late final int cleanliness;
  late final int location;
  late final int price;
  late final int service;

  Rate.fromJson(Map<String, dynamic> json){
    cleanliness = json['cleanliness'];
    location = json['location'];
    price = json['price'];
    service = json['service'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['cleanliness'] = cleanliness;
    _data['location'] = location;
    _data['price'] = price;
    _data['service'] = service;
    return _data;
  }
}

class AdditionalProducts {
  AdditionalProducts({
    required this.id,
    required this.gym,
    required this.title,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
    required this.V,
  });
  late final String id;
  late final String gym;
  late final String title;
  late final int price;
  late final String createdAt;
  late final String updatedAt;
  late final int V;

  AdditionalProducts.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    gym = json['gym'];
    title = json['title'];
    price = json['price'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    V = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['gym'] = gym;
    _data['title'] = title;
    _data['price'] = price;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['__v'] = V;
    return _data;
  }
}