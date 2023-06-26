class ProductDetailsResponse {
  bool? isfavourited;
  bool? liked;
  bool? available;
  bool? active;
  int? id;
  String? title;
  String? description;
  String? information;
  double? price;
  double? averageRatings;
  SubCategory? subCategory;
  List<ProductMedia>? productMedia;
  int? availabilityDate;
  String? titleAr;
  String? descriptionAr;
  String? informationAr;
  int? totalReviews;
  String? priceAr;
  double? priceArEn;
  Category? category;
  int? totalProductLike;

  ProductDetailsResponse(
      {this.isfavourited,
        this.liked,
        this.available,
        this.active,
        this.id,
        this.title,
        this.description,
        this.information,
        this.price,
        this.averageRatings,
        this.subCategory,
        this.productMedia,
        this.availabilityDate,
        this.titleAr,
        this.descriptionAr,
        this.informationAr,
        this.totalReviews,
        this.priceAr,
        this.priceArEn,
        this.category,
        this.totalProductLike});

  ProductDetailsResponse.fromJson(Map<String, dynamic> json) {
    isfavourited = json['isfavourited'];
    liked = json['liked'];
    available = json['available'];
    active = json['active'];
    id = json['id'];
    title = json['title'];
    description = json['description'];
    information = json['information'];
    price = json['price'];
    averageRatings = json['average_ratings'];
    subCategory = json['sub_category'] != null
        ? new SubCategory.fromJson(json['sub_category'])
        : null;
    if (json['product_media'] != null) {
      productMedia = <ProductMedia>[];
      json['product_media'].forEach((v) {
        productMedia!.add(new ProductMedia.fromJson(v));
      });
    }
    availabilityDate = json['availability_date'];
    titleAr = json['title_ar'];
    descriptionAr = json['description_ar'];
    informationAr = json['information_ar'];
    totalReviews = json['total_reviews'];
    priceAr = json['price_ar'];
    priceArEn = json['price_ar_en'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    totalProductLike = json['total_product_like'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isfavourited'] = this.isfavourited;
    data['liked'] = this.liked;
    data['available'] = this.available;
    data['active'] = this.active;
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['information'] = this.information;
    data['price'] = this.price;
    data['average_ratings'] = this.averageRatings;
    if (this.subCategory != null) {
      data['sub_category'] = this.subCategory!.toJson();
    }
    if (this.productMedia != null) {
      data['product_media'] =
          this.productMedia!.map((v) => v.toJson()).toList();
    }
    data['availability_date'] = this.availabilityDate;
    data['title_ar'] = this.titleAr;
    data['description_ar'] = this.descriptionAr;
    data['information_ar'] = this.informationAr;
    data['total_reviews'] = this.totalReviews;
    data['price_ar'] = this.priceAr;
    data['price_ar_en'] = this.priceArEn;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    data['total_product_like'] = this.totalProductLike;
    return data;
  }
}

class SubCategory {
  bool? active;
  int? id;
  String? subCategoryName;
  int? position;

  SubCategory({this.active, this.id, this.subCategoryName, this.position});

  SubCategory.fromJson(Map<String, dynamic> json) {
    active = json['active'];
    id = json['id'];
    subCategoryName = json['sub_category_name'];
    position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['active'] = this.active;
    data['id'] = this.id;
    data['sub_category_name'] = this.subCategoryName;
    data['position'] = this.position;
    return data;
  }
}

class ProductMedia {
  int? id;
  String? url;
  String? mediaName;
  String? mediaType;

  ProductMedia({this.id, this.url, this.mediaName, this.mediaType});

  ProductMedia.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    mediaName = json['media_name'];
    mediaType = json['media_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    data['media_name'] = this.mediaName;
    data['media_type'] = this.mediaType;
    return data;
  }
}

class Category {
  int? id;
  String? categoryName;

  Category({this.id, this.categoryName});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['category_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_name'] = this.categoryName;
    return data;
  }
}