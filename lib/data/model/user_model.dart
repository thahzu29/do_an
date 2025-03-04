import 'dart:convert';

class User {
  final String id;
  final String fullName;
  final String email;
  final String state;
  final String city;
  final String locality;
  final String password;
  final String token;

  User(
      {required this.id,
      required this.fullName,
      required this.email,
      required this.state,
      required this.city,
      required this.locality,
      required this.password,
      required this.token});

  // Chuyen doi doi tuong User thanh Map
  // Phuong thuc nay ma hoa du lieu truc tiep tu Map thanh chuoi Json
  // json.encode() chuyen doi mot doi tuong Dart (Map hoac List)
  // thanh mot chuoi Json, giup giao tiep giua cac he thong khac nhau
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'fullName': fullName,
      'email': email,
      'state': state,
      'locality': locality,
      'city': city,
      'password': password,
      'token':token,
    };
  }

  // Chuyen Map thanh Json
  String toJson() => json.encode(toMap());

  // Giai thich: Chuyen Map thanh doi tuong User
  // Muc dich: Sau khi du lieu duoc chuyen thanh doi tuong User,
  // co the de dang thao tac va su dung trong ung dung
  // Vi du: Hien thi fullName, email cua nguoi dung len giao dien
  // Hoac luu du lieu xuong local storage

  // Constructor factory lay Map (thuong la du lieu tu Json)
  // va chuyen thanh doi tuong User. Neu truong du lieu khong co, se mac dinh la chuoi rong ''
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String? ?? '',
      fullName: map['fullName'] as String? ?? '',
      email: map['email'] as String? ?? '',
      state: map['state'] as String? ?? '',
      city: map['city'] as String? ?? '',
      locality: map['locality'] as String? ?? '',
      password: map['password'] as String? ?? '',
      token: map['token'] as String? ?? '',

    );
  }

  // fromJson: Chuyen tu chuoi Json thanh Map<String, dynamic>
  // Sau do su dung fromMap de chuyen thanh doi tuong User
  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
