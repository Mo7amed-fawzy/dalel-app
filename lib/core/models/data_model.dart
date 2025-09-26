class DataModel {
  final String name;
  final String image;
  final String discription;
  final String category; // <--- أضف هذه الخاصية

  DataModel({
    required this.name,
    required this.image,
    required this.discription,
    required this.category, // <--- تأكد تمررها عند إنشاء العناصر
  });

  // Optional: لو بتجيب البيانات من Firebase كـ Map
  factory DataModel.fromMap(Map<String, dynamic> map) {
    return DataModel(
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      discription: map['discription'] ?? '',
      category: map['category'] ?? 'places', // افتراضي
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'discription': discription,
      'category': category,
    };
  }
}
