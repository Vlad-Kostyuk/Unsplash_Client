import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class PhotoEvent extends Equatable {
  const PhotoEvent();

  @override
  List<Object> get props => [];
}

class PhotoLoadingAll extends PhotoEvent {}

class PhotoLoadedDetails extends PhotoEvent {
  final String photoID;

  const PhotoLoadedDetails({@required this.photoID});

  @override
  List<Object> get props => [photoID];
}
