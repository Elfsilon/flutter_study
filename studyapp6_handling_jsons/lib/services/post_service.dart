import 'package:studyapp6_handling_jsons/data/repository.dart';
import 'package:studyapp6_handling_jsons/models/post_model.dart';

class PostService {
  PostService({ required this.repository });

  final Repository repository;

  Future<List<Post>> getPosts() async {
    try {
      return await repository.getPosts();
    } catch (e) {
      rethrow;
    }
  }

  Future<Post> getPostById(int postId) async {
    try {
      return await repository.getPost(postId);
    } catch (e) {
      rethrow;
    }
  }
}

