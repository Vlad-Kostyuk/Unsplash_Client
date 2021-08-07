import 'package:Unsplash_Client/data/models/uc_photo.dart';
import 'package:Unsplash_Client/domain/blocs/photo_bloc/photo_bloc.dart';
import 'package:Unsplash_Client/domain/blocs/photo_bloc/photo_event.dart';
import 'package:Unsplash_Client/domain/blocs/photo_bloc/photo_state.dart';
import 'package:Unsplash_Client/presentation/screen/photos_screen/local_widget/uc_behavior.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UcPhotosPage extends StatefulWidget {
  const UcPhotosPage({Key key}) : super(key: key);

  @override
  _UcPhotosPageState createState() => _UcPhotosPageState();
}

class _UcPhotosPageState extends State<UcPhotosPage> {
  final TextEditingController _searchInputPhotoController = TextEditingController();
  List<UCPhoto> photoList = new List<UCPhoto>();

  @override
  void initState() {
    BlocProvider.of<PhotoBloc>(context).add(PhotoLoadingAll());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _searchInputPhotoController.dispose();
  }

  Future<void> _onRefreshList() async {
    BlocProvider.of<PhotoBloc>(context).add(PhotoLoadingAll());
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ScrollConfiguration(
                  behavior: MyBehavior(),
                  child: CustomScrollView(
                    physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                    slivers: [
                      _buildAppBar(),
                      CupertinoSliverRefreshControl(onRefresh: _onRefreshList),
                      BlocBuilder<PhotoBloc, PhotoState>(builder: (context, state) {
                         if(state is PhotoLoadingInProgress) {
                           return _buildNoPhotosList(true);
                         }
                         if (state is PhotoLoaded) {
                           this.photoList = state.photoList;
                           return _buildPhotosList(photoList);
                         }
                         if (state is PhotoError) {
                           return _buildNoPhotosList(false);
                         }
                         return _buildNoPhotosList(true);
                        },
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }

  SliverAppBar _buildAppBar() {
    return SliverAppBar(
        expandedHeight: 120,
        backgroundColor: Colors.white,
        leading: Container(),
        flexibleSpace: FlexibleSpaceBar(
          background: Column(
            children: <Widget>[
              Container(
                child: Center(
                  child: _buildSearchTitle("Photos"),
                ),
              ),
            ],
          ),
        )
    );
  }

  SliverList _buildPhotosList(List<UCPhoto> photoList) => SliverList(
    delegate: SliverChildBuilderDelegate((BuildContext context, int item) => Row(
      key: Key(photoList[item].id),
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Image.network(photoList[item].urls.smallPhoto),
        )
      ],
    ), childCount: photoList.length),
  );

  SliverList _buildNoPhotosList(bool isLoading) => SliverList(
    delegate: SliverChildListDelegate([
      Center(
        child: isLoading ? CircularProgressIndicator() :
        _buildSearchTitle("Error :("),
      ),
    ]),
  );

  Widget _buildSearchTitle(String title) => Text(title,
    style: TextStyle(
        fontSize: 35.0,
        fontWeight: FontWeight.bold,
        color: Colors.black
    ),
  );
}
