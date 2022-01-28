class ProductModel {
  final String id;
  final String title;

//<editor-fold desc="Data Methods">

  const ProductModel({
    required this.id,
    required this.title,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title);

  @override
  int get hashCode => id.hashCode ^ title.hashCode;

  @override
  String toString() {
    return 'ProductModel{' + ' id: $id,' + ' title: $title,' + '}';
  }

  ProductModel copyWith({
    String? id,
    String? title,
  }) {
    return ProductModel(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] as String,
      title: map['title'] as String,
    );
  }

//</editor-fold>
}