class PostModel {
  final String? body;
  final String? imageUrl;
  final String userId;

  PostModel({required this.userId, this.imageUrl, this.body});

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'body': body,
      'imageUrl': imageUrl,
    };
  }
}
