import 'package:studyapp6_handling_jsons/data/network/dio_client.dart';
import 'package:studyapp6_handling_jsons/data/dio_jsonplaceholder_repository.dart';
import 'package:studyapp6_handling_jsons/services/post_service.dart';

void main(List<String> arguments) async {
  final client = DioClient();
  final repo = DioJsonPlaceholderRepository(client: client);
  final postService = PostService(repository: repo);

  final posts = await postService.getPosts();
  final post = await postService.getPostById(1);

  print("");
  posts.sublist(0, 2).forEach((element) => print(element.toString()));
  print("");
  print(post.toString());
}
