import 'package:dio/dio.dart';
import 'package:studyapp6_handling_jsons/data/network/dio_client.dart';
import 'package:studyapp6_handling_jsons/data/network/net_config.dart';
import 'package:studyapp6_handling_jsons/data/repository.dart';
import 'package:studyapp6_handling_jsons/models/post_model.dart';

class DioJsonPlaceholderRepository implements Repository {
  const DioJsonPlaceholderRepository({ required this.client });

  final DioClient client;

  @override
  Future<List<Post>> getPosts() async {
    try {
      final Response response = await client.get(Endpoints.postsEndpoint);
      final List<Post> posts = (response.data as List).map((e) => Post.fromJson(e)).toList();
      return posts;
    } catch(e) {
      rethrow;
    }
  } 

  @override
  Future<Post> getPost(int postId) async {
    try {
      final Response response = await client.get(Endpoints.postsEndpoint + postId.toString());
      final Post post = Post.fromJson(response.data as Map<String, dynamic>);
      return post;
    } catch(e) {
      rethrow;
    }
  } 
}