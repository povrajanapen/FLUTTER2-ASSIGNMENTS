import '../model/post.dart';

import 'post_repository.dart';

class MockPostRepository extends PostRepository {
  @override
  Future<List<Post>> getPost(int postId) async {
    return Future.delayed(Duration(seconds: 5), () {
      return [
        Post(
          id: 25,
          title: 'Who is the best',
          description: 'teacher ronan',
        ),
        Post(
          id: 26,
          title: 'Who is the best',
          description: 'meeeee',
        ),
      ];
    });
  }
}
