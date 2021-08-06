import 'package:Unsplash_Client/data/api/api_exception.dart';
import 'package:Unsplash_Client/data/api/rest/base_rest_api.dart';
import 'package:Unsplash_Client/data/api/rest/response/photo/uc_photos_reponse_list.dart';
import 'package:Unsplash_Client/data/api/rest/response_parser.dart';
import 'package:dio/dio.dart';
import 'dart:developer' as developer;

const _photos = 'photos';

class UCPhotoApi extends BaseRestApi {
  UCPhotoApi(String baseApiEndPoint) : super(baseApiEndPoint);

  ///GET all photos
  Future<UCPhotosResponseList> fetchAllUCPhoto() async {
    try {
      final Response response = await dio.get(_photos);
      return ResponseParser<UCPhotosResponseList>().parseItem(response, (json) => UCPhotosResponseList.fromJSON(json));
    } on DioError catch(e) {
      developer.log('Failed to photos');
      throw APIException(errorMessageFrom(e, "Failed to photos"));
    }
  }

  ///Get details photo by id
  Future<UCPhotosResponseList> fetchUCDetailsPhoto(String photoID) async {
    try {
      final Response response = await dio.get('$photoID/$photoID');
      return ResponseParser<UCPhotosResponseList>().parseItem(response, (json) => UCPhotosResponseList.fromJSON(json));
    } on DioError catch(e) {
      developer.log('Failed to details photo');
      throw APIException(errorMessageFrom(e, "Failed to details photo"));
    }
  }
}