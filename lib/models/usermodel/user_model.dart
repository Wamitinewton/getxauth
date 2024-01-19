class UserModel {
  final String name;
  final String avatar;
  final String bio;
  final String link;
  final List followers;
  final List following;
  final String email;
  final String id;

  UserModel({
    required this.name,
    required this.avatar,
    required this.bio,
    required this.link,
    required this.followers,
    required this.following,
    required this.email,
    required this.id,
  });

  static UserModel fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      avatar: json["avatar"],
      bio: json["bio"],
      link: json["link"],
      followers: json["followers"],
      following: json["following"],
      email: json["email"],
      id: json["id"],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['avatar'] = avatar;
    data['bio'] = bio;
    data['link'] = link;
    data['followers'] = followers;
    data['following'] = following;
    data['email'] = email;
    data['id'] = id;
    return data;
  }
}
