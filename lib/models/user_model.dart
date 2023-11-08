class UserModel {
  final String id;
  final String firstName;
  final String? lastName;
  final String? displayName;
  final String email;
  final String? bio;
  final int? flowing;
  final int? flowers;
  final int? posts;

  UserModel({
    required this.id,
    required this.firstName,
    this.lastName,
    this.displayName,
    required this.email,
    this.bio,
    this.flowers,
    this.flowing,
    this.posts,
  });
}
