class PostData {
  final String id;
  final String userId;
  final String title;
  final String body;

  PostData({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });

  factory PostData.fromJson(Map<String, dynamic> json) {
    return PostData(
      id: json['id'],
      userId: json['user_id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
