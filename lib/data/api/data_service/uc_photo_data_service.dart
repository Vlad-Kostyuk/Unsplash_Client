import 'package:Unsplash_Client/data/models/uc_photo.dart';

abstract class UCPhotoDataService {
  Future<List<UCPhoto>> photoList();
}