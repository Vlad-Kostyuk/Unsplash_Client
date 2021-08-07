import 'package:Unsplash_Client/domain/blocs/photo_bloc/photo_bloc.dart';
import 'package:Unsplash_Client/presentation/screen/photos_screen/photos_screen.dart';
import 'package:Unsplash_Client/strings/uc_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'data/api/data_service/uc_rest_photo_data_service.dart';
import 'data/api/rest/photo/uc_photo_api.dart';
import 'domain/repositories/uc_photo_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [

        RepositoryProvider<PhotoRepository>(
            create: (context) => PhotoRepository(
                RestUCPhotoDataService(
                UCPhotoApi(UsStrings.baseApiEndPoint)
            )),
        )

      ],
      child: MultiBlocProvider(
        providers: [

          BlocProvider<PhotoBloc>(
            create: (context) => PhotoBloc(
                PhotoRepository(
                    RestUCPhotoDataService(
                        UCPhotoApi(UsStrings.baseApiEndPoint)
                    )
                ),
            ),
          )

        ],
        child: MaterialApp(
          title: 'Unsplash Client',
          debugShowCheckedModeBanner: false,
          home: UcPhotosPage(),
        ),
      ),
    );
  }
}