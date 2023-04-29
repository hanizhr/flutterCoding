class PostList{
  final List<Post> posts;

  PostList({required this.posts});
  factory PostList.fromJson(List<dynamic> parsedjson) {
    List<Post> posts = <Post>[];
    posts = parsedjson.map((i) => Post.fromJson(i)).toList();
    return (new PostList(posts: posts));
  }
}

 class Post{
  late int userId;
  late int id;
  late String title;
  late String body;

  Post({required this.userId, required this.id, required this.title, required this.body});

  factory Post.fromJson(Map<String,dynamic> json){
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}