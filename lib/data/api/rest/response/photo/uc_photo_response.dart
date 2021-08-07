import 'package:Unsplash_Client/data/api/rest/response/photo/urls/urls_uc_photo_response.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class UCPhotoResponse extends Equatable  {
  final String id;
  final UrlsUCPhotoResponse urls;

  const UCPhotoResponse({
    @required this.id,
    @required this.urls
  });

  factory UCPhotoResponse.fromJSON(json) {
    final UCPhotoResponse image = UCPhotoResponse(
        id: json['id'],
        urls: UrlsUCPhotoResponse.fromJSON(json['urls'])
    );
    return image;
  }

  @override
  List<Object> get props => [id, urls];
}