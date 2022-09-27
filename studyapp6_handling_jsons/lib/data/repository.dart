import 'package:studyapp6_handling_jsons/models/post_model.dart';

abstract class Repository {
  Future<List<Post>> getPosts();
  Future<Post> getPost(int postId);
}