class ProductModel {
  String? sellerId;
  String? name;
  String? description;
  String? nameArabic;
  String? descriptionArabic;
  String? coverPictureUrl;
  int? price;
  int? stock;
  double? weight;
  String? color;
  int? discountPercentage;
  List<String>? categoryIds;
  List<String>? productPictureUrls;

  ProductModel({
    this.sellerId,
    this.name,
    this.description,
    this.nameArabic,
    this.descriptionArabic,
    this.coverPictureUrl,
    this.price,
    this.stock,
    this.weight,
    this.color,
    this.discountPercentage,
    this.categoryIds,
    this.productPictureUrls,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    sellerId: json['sellerId'] as String?,
    name: json['name'] as String?,
    description: json['description'] as String?,
    nameArabic: json['nameArabic'] as String?,
    descriptionArabic: json['descriptionArabic'] as String?,
    coverPictureUrl: json['coverPictureUrl'] as String?,
    price: json['price'] as int?,
    stock: json['stock'] as int?,
    weight: (json['weight'] as num?)?.toDouble(),
    color: json['color'] as String?,
    discountPercentage: json['discountPercentage'] as int?,
    categoryIds: json['categoryIds'] as List<String>?,
    productPictureUrls: json['productPictureUrls'] as List<String>?,
  );

  Map<String, dynamic> toJson() => {
    'sellerId': sellerId,
    'name': name,
    'description': description,
    'nameArabic': nameArabic,
    'descriptionArabic': descriptionArabic,
    'coverPictureUrl': coverPictureUrl,
    'price': price,
    'stock': stock,
    'weight': weight,
    'color': color,
    'discountPercentage': discountPercentage,
    'categoryIds': categoryIds,
    'productPictureUrls': productPictureUrls,
  };
}
