import 'package:Unsplash_Client/data/api/api_exception.dart';
import 'package:Unsplash_Client/data/api/data_service/uc_photo_data_service.dart';
import 'package:Unsplash_Client/data/api/rest/photo/uc_photo_api.dart';
import 'package:Unsplash_Client/data/api/rest/photo/uc_photo_response_parser.dart';
import 'package:Unsplash_Client/data/api/rest/response/photo/uc_photos_reponse_list.dart';
import 'package:Unsplash_Client/data/api/rest/response/photo/urls/uc_photo_reponse_item.dart';
import 'package:Unsplash_Client/data/models/uc_photo.dart';

class RestUCPhotoDataService extends UCPhotoDataService {
  final UCPhotoApi _photoApi;

  RestUCPhotoDataService(
    this._photoApi
  );

  @override
  Future<List<UCPhoto>> photoList() async {
    try {
      List<UCPhoto> photoList = new List<UCPhoto>();
      final UCPhotosResponseList ucPhotosResponseList = await _photoApi.fetchAllUCPhoto();
      ucPhotosResponseList.data.forEach((element) {
        photoList.add(UCPhotoResponseParser(photoResponse: element).parserPhoto());
      });
      return photoList;
    } on APIException catch(error) {
      print('The photos request failed');
      throw error;
    }
  }

  @override
  Future<UCPhoto> photoDetails(String photoID) async {
    try {
      UCPhoto photo = new UCPhoto();
      final UCPhotosResponseItem ucPhotosResponseItem = await _photoApi.fetchUCDetailsPhoto(photoID);
      photo = UCPhotoResponseParser(photoResponse: ucPhotosResponseItem.data).parserPhoto();
      return photo;
    } on APIException catch(error) {
      print('The photos request failed');
      throw error;
    }
  }
}