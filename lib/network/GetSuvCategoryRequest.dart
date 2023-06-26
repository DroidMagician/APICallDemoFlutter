class GetSubCategoryRequest {
  int? limit;
  int? offset;
  int? category_id;
  int? sub_category_id;

  GetSubCategoryRequest({ this.limit,  this.offset,  this.category_id,  this.sub_category_id});

  GetSubCategoryRequest.fromJson(Map<String, dynamic> json) {
    limit = json['limit'];
    offset = json['offset'];
    category_id = json['category_id'];
    sub_category_id = json['sub_category_id'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['limit'] = this.limit;
    data['offset'] = this.offset;
    data['category_id'] = this.category_id;
    data['sub_category_id'] = this.sub_category_id;

    return data;
  }
}
