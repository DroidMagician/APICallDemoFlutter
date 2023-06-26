
class BaseApiResponseArray<T> {
  String? message;
  List<T>? data;
  BaseApiResponseArray({this.message, this.data});

  factory BaseApiResponseArray.fromJson(Map<String, dynamic> json, Function(Map<String, dynamic>) create) {

    return BaseApiResponseArray<T>(
      message: json["message"],
      data:  List<T>.from(
          json["data"].map((x) => create(x)))
    );
  }
}

abstract class Serializable {
  Map<String, dynamic> toJson();
}
