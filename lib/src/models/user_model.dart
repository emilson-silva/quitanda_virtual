class UserModel {
  String? name;
  String? email;
  String? phone;
  String? cpf;
  String? password;
  String? id;
  String? token;

  UserModel({
    this.phone,
    this.cpf,
    this.email,
    this.name,
    this.password,
    this.id,
    this.token,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      cpf: map['cpf'],
      name: map['fullname'],
      email: map['email'],
      phone: map['phone'],
      token: map['token'],
      password: map['password'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'cpf': cpf,
      'fullname': name,
      'email': email,
      'phone': phone,
      'token': token,
      'password': password,
    };
  }

  @override
  String toString() {
    return 'name: $name | cpf: $cpf';
  }
}
