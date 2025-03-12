import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/model/user_model.dart';

class UserProvider extends StateNotifier<User?> {
  // constructor khởi tạo với User mặc định
  // // mục đích: Quản lý trạng thái của đối tượng người dùng cho phép cập nhật
  UserProvider()
      : super(User(
          id: '',
          fullName: '',
          email: '',
          state: '',
          city: '',
          locality: '',
          password: '',
          token: '',
        ));

  // Getter method to extract value form an object
  User? get user => state;

  // method to set user state form Json
  // purpose: updates he user state base on json String representation of user Object

  void setUser(String userJson){
    state = User.fromJson(userJson);
  }

  // Method to clear user state
  void signOut(){
    state = null;
  }
}


// make the data accessible within the application
final userProvider =
StateNotifierProvider<UserProvider, User?> ((ref) => UserProvider());
