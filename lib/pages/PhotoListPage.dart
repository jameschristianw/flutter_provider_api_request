import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_api_request/providers/PhotoDataProvider.dart';
import 'package:provider_api_request/widgets/PhotoItem.dart';

class PhotoListPage extends StatefulWidget {
  static const routeName = '/photo-list';

  @override
  _PhotoListPageState createState() => _PhotoListPageState();
}

class _PhotoListPageState extends State<PhotoListPage> {
  PhotoDataProvider photoProvider;

  @override
  Widget build(BuildContext context) {
    photoProvider = Provider.of<PhotoDataProvider>(context);
    photoProvider.getPhotosData(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Photo List"),
      ),
      body: photoProvider.isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
              onRefresh: () => refreshData(),
              child: ListView.builder(
                itemCount: photoProvider.photos.length,
                itemBuilder: (context, index) => PhotoItem(
                  photo: photoProvider.photos.elementAt(index),
                  index: index,
                ),
              ),
            ),
    );
  }

  Future refreshData() async {
    print("PhotoListPage refresh");
    photoProvider.refresh();
  }

  @override
  void dispose() {
    super.dispose();
    photoProvider.reset();
  }
}
