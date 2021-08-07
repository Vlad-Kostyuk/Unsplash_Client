import 'package:Unsplash_Client/data/models/uc_photo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class PhotoState extends Equatable {
  const PhotoState();

  @override
  List<Object> get props => [];
}

class PhotoInitial extends PhotoState {}

class PhotoLoadingInProgress extends PhotoState {}

class PhotoLoaded extends PhotoState {
  final List<UCPhoto> photoList;
  final UCPhoto photo;

  const PhotoLoaded({@required this.photoList, this.photo});

  PhotoLoaded copyWith({List<UCPhoto> photoList, UCPhoto photo}) {
    return PhotoLoaded(
      photoList: photoList ?? this.photoList,
      photo: photo ?? this.photo
    );
 }

  @override
  List<Object> get props => [photoList, this.photo];
}

class PhotoError extends PhotoState {}