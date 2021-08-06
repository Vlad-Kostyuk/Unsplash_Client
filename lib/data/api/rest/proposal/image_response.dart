import 'package:Unsplash_Client/data/api/rest/proposal/urls_image_response.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class ImageResponse extends Equatable  {
  final String id;
  final UrlsImageResponse urls;

  const ImageResponse({
    @required this.id,
    @required this.urls
  });

  factory ImageResponse.fromJSON(json) {
    final ImageResponse image = ImageResponse(
        id: json['id'],
        urls: UrlsImageResponse.fromJSON(json['urls'])
    );
    return image;
  }

  @override
  List<Object> get props => [id, urls];
}