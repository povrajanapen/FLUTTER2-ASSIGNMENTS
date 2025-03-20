import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:week6/EX-2-START-CODE/DTO/posts_dto.dart';
import 'package:week6/EX-2-START-CODE/model/post.dart';
import 'package:week6/EX-2-START-CODE/repository/post_repository.dart';

class HttpPostsRepository extends PostRepository {
  final String apiUrl = 'https://jsonplaceholder.typicode.com/posts';

  @override
  Future<List<Post>> getPost(int postId) async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((json) => Post.fromDTO(PostDTO.fromJson(json)))
          .toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}