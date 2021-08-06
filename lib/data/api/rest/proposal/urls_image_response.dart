import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class UrlsImageResponse extends Equatable {
  final String fullImage;
  final String regularImage;
  final String smallImage;

  const UrlsImageResponse({
    @required this.fullImage,
    @required this.regularImage,
    @required this.smallImage
  });

  factory UrlsImageResponse.fromJSON(json) {
    final UrlsImageResponse urls = UrlsImageResponse(
        fullImage: json['full'],
        regularImage: json['regular'],
        smallImage: json['small']
    );
    return urls;
  }

  @override
  List<Object> get props => [fullImage, regularImage, smallImage];
}