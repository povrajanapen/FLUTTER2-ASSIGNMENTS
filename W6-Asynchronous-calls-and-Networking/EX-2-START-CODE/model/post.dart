import 'package:week6/EX-2-START-CODE/DTO/posts_dto.dart';

class Post {
  final int id;
  final String title;
  final String description;

  Post({required this.id, required this.title, required this.description});

  static Post fromDTO(PostDTO dto){
    return Post(id: dto.id, title: dto.title, description: dto.body);
  }
}
