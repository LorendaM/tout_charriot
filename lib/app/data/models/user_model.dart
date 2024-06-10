class UserModel {
  final String? id;
  final String? username;
  final String? email;
  final String? phone;
  final String? password;
  final String? device_token;
  final String? photo;
  final String? provider;

  UserModel({
    this.id,
    this.username,
    this.email,
    this.phone,
    this.photo,
    this.device_token,
    this.password,
    this.provider,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'phone': phone,
      'provider': provider,
      'password': password,
      'photo': photo,
      'device_token': device_token,
    };
  }

  factory UserModel.fromJson(json) {
    return UserModel(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      phone: json['phone'],
      provider: json['provider'],
      password: json['password'],
    );
  }
}
