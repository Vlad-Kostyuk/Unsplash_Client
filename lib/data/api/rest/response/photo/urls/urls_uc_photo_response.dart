import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class UrlsUCPhotoResponse extends Equatable {
  final String fullPhoto;
  final String regularPhoto;
  final String smallPhoto;

  const UrlsUCPhotoResponse({
    @required this.fullPhoto,
    @required this.regularPhoto,
    @required this.smallPhoto
  });

  factory UrlsUCPhotoResponse.fromJSON(json) {
    final UrlsUCPhotoResponse urls = UrlsUCPhotoResponse(
        fullPhoto: json['full'],
        regularPhoto: json['regular'],
        smallPhoto: json['small']
    );
    return urls;
  }

  @override
  List<Object> get props => [fullPhoto, regularPhoto, smallPhoto];
}