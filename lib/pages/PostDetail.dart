import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_api_request/providers/PostDataProvider.dart';

class PostDetail extends StatefulWidget {
  static const routeName = '/post-detail';
  final int postId;
  const PostDetail({this.postId});

  @override
  _PostDetailState createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  PostDataProvider postProvider;

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> route = ModalRoute.of(context).settings.arguments;
    int postId = route['id'];
    postProvider = Provider.of<PostDataProvider>(context);
    postProvider.getPostDetail(context, postId);

    return Scaffold(
      appBar: postProvider.isLoading
          ? null
          : AppBar(
              title: Text(postProvider.post.title),
            ),
      body: postProvider.isLoading
          ? Center(child: CircularProgressIndicator())
          : Container(
              child: Text(postProvider.post.body),
            ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    postProvider.reset();
  }
}
