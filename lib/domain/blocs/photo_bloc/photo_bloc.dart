import 'package:Unsplash_Client/data/api/api_exception.dart';
import 'package:Unsplash_Client/data/models/uc_photo.dart';
import 'package:Unsplash_Client/domain/blocs/photo_bloc/photo_event.dart';
import 'package:Unsplash_Client/domain/blocs/photo_bloc/photo_state.dart';
import 'package:Unsplash_Client/domain/repositories/uc_photo_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  final PhotoRepository _repository;

  PhotoBloc(this._repository) : super(PhotoInitial());

  @override
  Stream<PhotoState> mapEventToState(PhotoEvent event) async* {
    yield PhotoLoadingInProgress();
    if(event is PhotoLoadingAll) {
      yield* _mapPhotoLoading(event);
    }
    if(event is PhotoLoadedDetails) {
      yield* _mapPhotoLoadedDetails(event);
    }
  }

  Stream<PhotoState> _mapPhotoLoading(PhotoLoadingAll event) async* {
    try {
      final List<UCPhoto> photoList = await _repository.photoList();
      yield PhotoLoaded(photoList: photoList);
    } on APIException catch(e) {
      print(e.toString());
      yield PhotoError();
    }
  }

  Stream<PhotoState> _mapPhotoLoadedDetails(PhotoLoadedDetails event) async* {
    try {
      final currentState = state;
      if(currentState is PhotoLoaded) {
        final UCPhoto photo = await _repository.photoDetails(event.photoID);
        yield currentState.copyWith(photo: photo);
      }
    } on APIException catch(e) {
      yield PhotoError();
    }
  }

}