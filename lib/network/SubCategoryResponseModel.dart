class SubCategoryResponseModel {
  bool? active;
  int? id;
  String? subCategoryName;
  int? position;

  SubCategoryResponseModel(
      {this.active, this.id, this.subCategoryName, this.position});

  SubCategoryResponseModel.fromJson(Map<String, dynamic> json) {
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