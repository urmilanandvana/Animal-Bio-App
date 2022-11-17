import 'dart:typed_data';

class SecondScreenInsert {
  final String time;
  final String price;
  SecondScreenInsert({required this.time, required this.price});
}

class SecondScreenFetch {
  final String? time;
  final String price;
  final Uint8List image;
  SecondScreenFetch({
    required this.time,
    required this.price,
    required this.image,
  });
  factory SecondScreenFetch.fromData(e) {
    return SecondScreenFetch(
      time: e['time'],
      price: e['price'],
      image: e['image'],
    );
  }
}

class LastScreenInsert {
  final String name;
  final String description;
  final String category;
  final String image;
  LastScreenInsert(
      {required this.name,
      required this.description,
      required this.category,
      required this.image});
}

class LastScreenFetch {
  final String name;
  final String description;
  final String category;
  final String image;
  LastScreenFetch(
      {required this.name,
      required this.description,
      required this.category,
      required this.image});

  factory LastScreenFetch.fromData(Map<String, dynamic> data) {
    return LastScreenFetch(
      name: data['name'],
      description: data['description'],
      category: data['category'],
      image: data['image'],
    );
  }
}
