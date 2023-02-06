enum Tag { SPORTS, COMPETITION, HUMOROUS }

final tagValues = EnumValues({"competition": Tag.COMPETITION, "humorous": Tag.HUMOROUS, "sports": Tag.SPORTS});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
