class UserEntity {
  final String id;
  final String name;
  final String email;
  final String avatar;
  final String password;
  final String createdAt;
  final String updatedAt;
  final String isActive;
  final List<String> roles;
  final String type;
  final String token;

  UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.avatar,
    required this.password,
    required this.createdAt,
    required this.updatedAt,
    required this.isActive,
    required this.type,
    required this.roles,
    required this.token,
  });

  bool get isAdmin => roles.contains('admin');
}
