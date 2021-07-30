import 'package:flutter/material.dart';
import 'package:provider_api_request/models/photo.dart';

class PhotoItem extends StatelessWidget {
  final Photo photo;
  final int index;
  const PhotoItem({this.photo, this.index});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: customPadding(),
      onTap: () => {},
      leading: Container(
        width: 150,
        height: 150,
        child: Image.network(
          photo.thumbnailUrl,
          fit: BoxFit.cover,
        ),
        // alignment: Alignment.center,
      ),
      title: Text(photo.title),
    );
  }

  EdgeInsets customPadding() {
    if (index == 0) {
      return EdgeInsets.fromLTRB(15, 15, 15, 10);
    }

    return EdgeInsets.only(top: 10, bottom: 10, right: 15, left: 15);
  }
}
