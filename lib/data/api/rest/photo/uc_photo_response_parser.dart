import 'package:Unsplash_Client/data/api/rest/photo/urls/urls_response_parser.dart';
import 'package:Unsplash_Client/data/api/rest/response/photo/uc_photo_response.dart';
import 'package:Unsplash_Client/data/models/uc_photo.dart';
import 'package:flutter/cupertino.dart';

class UCPhotoResponseParser {
  final UCPhotoResponse photoResponse;

  const UCPhotoResponseParser({
    @required this.photoResponse
  });

  UCPhoto parserPhoto() {
    final UCPhoto image = UCPhoto(
      id: photoResponse.id,
      urls: UrlsResponseParser(urlsImageResponse: photoResponse.urls).parserUCImage()
    );
    return image;
  }
}