class CategoriesModel {
  String? name;
  String? description;
  String? coverPictureUrl;

  CategoriesModel({this.name, this.description, this.coverPictureUrl});

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      name: json['name'] as String?,
      description: json['description'] as String?,
      coverPictureUrl: json['coverPictureUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'description': description,
    'coverPictureUrl': coverPictureUrl,
  };
}
