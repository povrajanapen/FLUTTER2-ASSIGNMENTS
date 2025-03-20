import 'package:flutter/material.dart';
import 'package:week6/EX-2-START-CODE/repository/http_posts_repository.dart';
import 'package:week6/EX-2-START-CODE/repository/post_repository.dart';

import '../../model/post.dart';
import 'async_value.dart';

class PostProvider extends ChangeNotifier {
  final PostRepository _repository;
  // final HttpPostsRepository _repository;

  AsyncValue<List<Post>>? postValue;

  PostProvider({required HttpPostsRepository repository}) : _repository = repository;

  void fetchPost(int postId) async {
    // 1-  Set loading state
    postValue = AsyncValue.loading();
    notifyListeners();

    try {
      // 2   Fetch the data
      List<Post> post = await _repository.getPost(postId);

      // 3  Set success state
      postValue = AsyncValue.success(post);
    } catch (error) {
      // 4  Set error state
      postValue = AsyncValue.error(error);
    }

    notifyListeners();
  }
}
