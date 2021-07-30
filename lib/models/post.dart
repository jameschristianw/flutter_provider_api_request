class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  factory Post.fromJson(Map<String, dynamic> result) {
    return Post(
      userId: result['userId'],
      id: result['id'],
      title: result['title'],
      body: result['body'],
    );
  }
}
