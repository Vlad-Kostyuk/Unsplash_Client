import 'package:Unsplash_Client/data/api/rest/response/photo/uc_photo_response.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class UCPhotosResponseList extends Equatable {
  final List<UCPhotoResponse> data;

  const UCPhotosResponseList({@required this.data});

  factory UCPhotosResponseList.fromJSON(json) {
    final List<dynamic> data = json[''];
    List<UCPhotoResponse> image = List<UCPhotoResponse>();
    data.forEach((element) {
      if(element['id'] != null)
        image.add(UCPhotoResponse.fromJSON(element));
    });
    return UCPhotosResponseList(data: image);
  }

  @override
  List<Object> get props => [data];
}