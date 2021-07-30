import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_api_request/models/post.dart';
import 'package:provider_api_request/pages/PostDetail.dart';
import 'package:provider_api_request/providers/PostDataProvider.dart';

class PostItem extends StatelessWidget {
  final Post post;
  PostItem({this.post});

  @override
  Widget build(BuildContext context) {
    PostDataProvider postProvider = Provider.of<PostDataProvider>(context);

    return GestureDetector(
      onTap: () {
        postProvider.reset();
        Navigator.of(context).pushNamed(
          PostDetail.routeName,
          arguments: {'id': post.id},
        );
      },
      child: Container(
        padding: EdgeInsets.all(10),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(post.title),
            SizedBox(height: 10),
            Text(post.body),
            Divider(),
          ],
        ),
      ),
    );
  }
}
