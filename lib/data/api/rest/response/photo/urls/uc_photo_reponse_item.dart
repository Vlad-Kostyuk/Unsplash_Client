import 'package:Unsplash_Client/data/api/rest/response/photo/uc_photo_response.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class UCPhotosResponseItem extends Equatable {
  final UCPhotoResponse data;

  const UCPhotosResponseItem({@required this.data});

  factory UCPhotosResponseItem.fromJSON(json) {
    final List<dynamic> data = json[''];
    UCPhotoResponse image = UCPhotoResponse();
    image = UCPhotoResponse.fromJSON(data);
    return UCPhotosResponseItem(data: image);
  }

  @override
  List<Object> get props => [data];
}