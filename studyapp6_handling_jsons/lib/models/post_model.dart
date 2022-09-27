class Post {
  const Post({
    required this.uId,
    required this.id,
    required this.title,
    required this.body,
  });

  final int uId;
  final int id;
  final String title;
  final String body;

  factory Post.fromJson(Map<String, dynamic> json) {
    final uId = json["userId"] as int;
    final id = json["id"] as int;
    final title = json["title"] as String;
    final body = json["body"] as String;
    
    return Post(
      uId: uId,
      id: id,
      title: title,
      body: body,
    );
  }

  Map<String, dynamic> toJson() => {
    "userId": uId,
    "id": id,
    "title": title,
    "body": body,
  };
  
  @override
  String toString() {
    return "Post #$id:\nuserId: $uId\ntitle: $title\nbody: $body\n";
  }
}