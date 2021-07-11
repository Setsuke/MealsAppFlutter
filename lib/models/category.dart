class Category {
  final String strCategory;
  final String strCategoryThumb;
  final String strCategoryDescription;

  const Category({
    required this.strCategory,
    required this.strCategoryThumb,
    required this.strCategoryDescription,
  });

  static Category fromJson(json) => Category(
        strCategory: json['strCategory'],
        strCategoryThumb: json['strCategoryThumb'],
        strCategoryDescription: json['strCategoryDescription'],
      );
}
