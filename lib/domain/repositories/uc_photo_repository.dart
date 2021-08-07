import 'package:Unsplash_Client/data/api/data_service/uc_rest_photo_data_service.dart';
import 'package:Unsplash_Client/data/models/uc_photo.dart';

class PhotoRepository {
  final RestUCPhotoDataService _dataService;

  const PhotoRepository(this._dataService);

  Future<List<UCPhoto>> photoList() =>
      _dataService.photoList();

  Future<UCPhoto> photoDetails(String photoID) =>
      _dataService.photoDetails(photoID);
}