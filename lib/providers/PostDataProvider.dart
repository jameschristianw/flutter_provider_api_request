import 'package:flutter/material.dart';

import '../models/post.dart';
import '../config/api.dart';

class PostDataProvider with ChangeNotifier {
  AppApi api = AppApi();

  List<Post> _posts = [];
  Post _post;
  bool _isLoading = false;
  bool _isInitData = true;

  List<Post> get posts => _posts;
  Post get post => _post;
  bool get isLoading => _isLoading;

  getPostsData(context) async {
    if (!_isInitData) return;

    print('PostDataProvider getPostsData');
    _posts = [];
    _isLoading = true;
    _posts = await api.getAllPosts(context);

    _isLoading = false;
    _isInitData = false;
    notifyListeners();
  }

  getPostDetail(context, id) async {
    if (!_isInitData) return;
    print('PostDataProvider getPostDetail');

    _isLoading = true;
    _post = await api.getPostDetail(context, id);

    _isLoading = false;
    _isInitData = false;
    notifyListeners();
  }

  reset() {
    print("PostDataProvider reset");
    _isLoading = false;
    _isInitData = true;
  }

  refresh() {
    print("PostDataProvider refresh");
    _isLoading = false;
    _isInitData = true;
    notifyListeners();
  }
}
