import 'package:apicalldemo/network/GetSuvCategoryRequest.dart';
import 'package:apicalldemo/network/ProductDetailsResponse.dart';
import 'package:apicalldemo/network/SubCategoryResponseModel.dart';
import 'package:apicalldemo/network/UserDetails.dart';
import 'package:apicalldemo/network/base_api_response_array.dart';
import 'package:dio/dio.dart';

import 'Logging.dart';
import 'UserResponseModel.dart';

class DioClient {
  final Dio _dio = Dio()..interceptors.add(Logging());

  final _baseUrl = 'api.aljashaami.com';

  Future<UserResponseModel?> createUser({required UserDetails userInfo}) async {
    UserResponseModel? retrievedUser;
    try {
      Response response = await _dio.post(_baseUrl, data: userInfo.toJson(),);
      print('User created: ${response.data}');
      retrievedUser = UserResponseModel.fromJson(response.data['data']);
      print('User created: retrievedUser ${response.data['data'].toString()}');
    } catch (e) {
      print('Error creating user: $e');
    }
    return retrievedUser;
  }

  Future<BaseApiResponseArray<SubCategoryResponseModel>?> getSubCategoryList() async {

    GetSubCategoryRequest getSubCategoryRequest = new GetSubCategoryRequest();
      getSubCategoryRequest.limit = 1000;
      getSubCategoryRequest.offset = 0;
      getSubCategoryRequest.category_id = 1;


    BaseApiResponseArray<SubCategoryResponseModel>? retrievedUser;

    try {
      Response response = await _dio.post(getURI(path: "/categories/getAllSubCategory").toString(), data: getSubCategoryRequest.toJson(),);
      print('Get Sub Category: ${response.data}');
      retrievedUser = BaseApiResponseArray<SubCategoryResponseModel>.fromJson(response.data, (response) => SubCategoryResponseModel.fromJson(response));
      print('User created: retrievedUser ${retrievedUser.data?.length.toString()}');
    } catch (e) {
      print('Error creating user: $e');
    }
    return retrievedUser;
  }


  Future<BaseApiResponseArray<ProductDetailsResponse>?> getProductDetails({required int subCategoryId}) async {

    GetSubCategoryRequest getSubCategoryRequest = new GetSubCategoryRequest();
    getSubCategoryRequest.limit = 1000;
    getSubCategoryRequest.offset = 0;
    getSubCategoryRequest.category_id = 1;
    getSubCategoryRequest.sub_category_id = subCategoryId;


    BaseApiResponseArray<ProductDetailsResponse>? retrievedUser;

    try {
      Response response = await _dio.post(getURI(path: "/product/getAllProductBySubCategoryId").toString(), data: getSubCategoryRequest.toJson(),);
      print('Get Sub Category: ${response.data}');
      retrievedUser = BaseApiResponseArray<ProductDetailsResponse>.fromJson(response.data, (response) => ProductDetailsResponse.fromJson(response));
      print('Product Details ${retrievedUser.data?.length.toString()}');
    } catch (e) {
      print('Error creating user: $e');
    }
    return retrievedUser;
  }


  final Map<String, String> _queryParameters = <String, String>{
    'lang': 'ar',
  };

   getURI({required String path}) {
     final uri = Uri.https(_baseUrl, path, _queryParameters);
     return uri;
   }


}