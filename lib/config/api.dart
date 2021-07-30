import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/post.dart';
import '../models/photo.dart';

class AppApi {
  static const BASE_URL = "https://jsonplaceholder.typicode.com";

  Future<List<Photo>> getAllPhotos(context) async {
    print('AppApi getAllPhotos');

    List<Photo> results = [];
    const String PHOTOS_URL = '/photos';

    Uri photosUri = Uri.parse(BASE_URL + PHOTOS_URL);

    try {
      final response = await http.get(
        photosUri,
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      );

      if (response.statusCode == 200) {
        final items = jsonDecode(response.body);
        print("Photos count: " + items.length.toString());
        for (var item in items) {
          Photo result = Photo.fromJson(item);
          results.add(result);
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Something went wrong'),
          ),
        );
      }
    } catch (e) {
      print(e.toString());
    }

    return results;
  }

  Future<List<Post>> getAllPosts(context) async {
    print('AppApi getAllPosts');

    List<Post> results = [];
    const String POST_URL = '/posts';

    Uri postUri = Uri.parse(BASE_URL + POST_URL);

    try {
      final response = await http.get(
        postUri,
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      );

      if (response.statusCode == 200) {
        final items = jsonDecode(response.body);
        for (var item in items) {
          Post result = Post.fromJson(item);
          results.add(result);
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Something went wrong'),
          ),
        );
      }
    } catch (e) {
      print(e.toString());
    }

    print("Results count: " + results.length.toString());
    return results;
  }

  Future<Post> getPostDetail(context, id) async {
    print('AppApi getPostDetail');
    Post result;
    const String POST_URL = '/posts';
    String url = '$BASE_URL$POST_URL/$id';

    Uri postUri = Uri.parse(url);
    try {
      final response = await http.get(
        postUri,
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      );

      if (response.statusCode == 200) {
        result = Post.fromJson(jsonDecode(response.body));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Something went wrong'),
          ),
        );
      }
    } catch (e) {
      print(e.toString());
    }

    return result;
  }
}
