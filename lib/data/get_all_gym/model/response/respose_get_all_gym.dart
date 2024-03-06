class ResponseGetGymModel {
  ResponseGetGymModel({
    required this.id,
    required this.owner,
    required this.name,
    required this.category,
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
    required this.createdAt,
    required this.updatedAt,
    required this.V,
    required this.discountPrice,
  });

  late final String id;
  late final String owner;
  late final String name;
  late final String category;
  late final String rate;
  late final String status;
  late final bool enabled;
  late final List<String> gallery;
  late final String address;
  late final String coordinates;
  late final String city;
  late final String priceStart;
  late final int reservedCount;
  late final String acceptedGender;
  late final String sansStart;
  late final String sansEnd;
  late final String sansDuration;
  late final int sansPerDay;
  late final int sansLimit;
  late final bool sansVipMode;
  late final int minBookPersonCount;
  late final int maxBookPersonCount;
  late final bool changePriceByPeople;
  late final int fee;
  late final List<String> features;
  late final String reserveMethod;
  late final String description;
  late final String createdAt;
  late final String updatedAt;
  late final int V;
  late final String discountPrice;

  ResponseGetGymModel.fromJson(Map<String, dynamic> json) {

    id = json['_id'];
    name = json['name'];
    category = json['category'];
    rate = json['rate'].toString();
    enabled = json['enabled'];
    gallery = List.castFrom<dynamic, String>(json['gallery']);
    address = json['address'];
    city = json['city'];
    priceStart = json['price_start'];
    reserveMethod = json['reserve_method'];
    discountPrice = json['discount_price'].toString();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['owner'] = owner;
    _data['name'] = name;
    _data['category'] = category;
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
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['__v'] = V;
    _data['discount_price'] = discountPrice;
    return _data;
  }
}
