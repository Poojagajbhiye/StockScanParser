class Scan {
  late int id;
  late String name;
  late String tag;
  late String color;
  late List<dynamic> criteria;

  Scan({
    required this.id,
    required this.name,
    required this.tag,
    required this.color,
    required this.criteria,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'tag': tag,
        'color': color,
        'criteria': criteria
      };
}
