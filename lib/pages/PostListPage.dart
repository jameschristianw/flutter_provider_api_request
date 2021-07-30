import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_api_request/providers/PostDataProvider.dart';
import 'package:provider_api_request/widgets/PostItem.dart';

class PostListPage extends StatefulWidget {
  static const routeName = '/post-list';

  @override
  _PostListPageState createState() => _PostListPageState();
}

class _PostListPageState extends State<PostListPage> {
  PostDataProvider postProvider;

  @override
  Widget build(BuildContext context) {
    postProvider = Provider.of<PostDataProvider>(context);
    postProvider.getPostsData(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Post List'),
      ),
      body: Container(
        child: postProvider.isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                child: RefreshIndicator(
                  onRefresh: () => refreshData(),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: postProvider.posts
                          .map((post) => PostItem(post: post))
                          .toList(),
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  Future refreshData() async {
    print("PostListPage refresh");
    postProvider.refresh();
  }

  @override
  void dispose() {
    super.dispose();
    postProvider.reset();
  }
}
