import 'package:flutter/material.dart';

import '../models/photo.dart';
import '../config/api.dart';

class PhotoDataProvider with ChangeNotifier {
  AppApi api = AppApi();

  List<Photo> _photos = [];
  Photo _photo;
  bool _isLoading = false;
  bool _isInitData = true;

  List<Photo> get photos => _photos;
  Photo get photo => _photo;

  bool get isLoading => _isLoading;
  bool get isInitData => _isInitData;

  getPhotosData(context) async {
    if (!_isInitData) return;

    print('PhotoDataProvider getPostsData');
    _photos = [];
    _isLoading = true;
    _photos = await api.getAllPhotos(context);

    _isLoading = false;
    _isInitData = false;
    notifyListeners();
  }

  reset() {
    print("PhotoDataProvider reset");
    _isLoading = false;
    _isInitData = true;
  }

  refresh() {
    print("PhotoDataProvider refresh");
    _isLoading = false;
    _isInitData = true;
    notifyListeners();
  }
}
