import 'package:flutter/material.dart';
import 'package:week6/EX-2-START-CODE/repository/http_posts_repository.dart';
import 'package:provider/provider.dart';

import 'ui/providers/post_provider.dart';
import 'ui/screens/post_screen.dart';

void main() {
  // 1- Create the repository
  // PostRepository postRepo = MockPostRepository();
  final httpRepo = HttpPostsRepository();

  // 2 - Run the UI
  runApp(
    ChangeNotifierProvider(
      create: (context) => PostProvider(repository: httpRepo),
      child: MaterialApp(debugShowCheckedModeBanner: false, home: PostScreen()),
    ),
  );
}
