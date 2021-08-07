import 'package:Unsplash_Client/data/api/rest/response/photo/urls/urls_uc_photo_response.dart';
import 'package:Unsplash_Client/data/models/urls_photo.dart';
import 'package:flutter/cupertino.dart';

class UrlsResponseParser {
  final UrlsUCPhotoResponse urlsImageResponse;

  const UrlsResponseParser({
    @required this.urlsImageResponse
  });

  UrlsUCPhoto parserUCImage() {
    final UrlsUCPhoto urls = UrlsUCPhoto(
      fullPhoto: urlsImageResponse.fullPhoto,
      regularPhoto: urlsImageResponse.regularPhoto,
      smallPhoto: urlsImageResponse.smallPhoto,
    );
    return urls;
  }
}