import 'package:Unsplash_Client/data/models/urls.dart';
import 'package:flutter/cupertino.dart';

class Image {
  final String id;
  final UrlsImage urls;

  const Image({
    @required this.id,
    @required this.urls
  });
}