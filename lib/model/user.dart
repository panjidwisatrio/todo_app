// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  int? id;
  String? email;
  String? nameUser;
  String? username;
  String? password;
  String? confirmPassword;

  User({
    this.id,
    this.email,
    this.nameUser,
    this.username,
    this.password,
    this.confirmPassword,
  });

  User login(String email, String password) {
    var userLog = User();
    userList.forEach((user) {
      if (user.email == email && user.password == password) {
        userLog = User(
          id: user.id,
          email: user.email,
          nameUser: user.nameUser,
          username: user.username,
          password: user.password,
          confirmPassword: user.confirmPassword,
        );
      } else {
        userLog = User();
      }
    });

    return userLog;
  }

  User register(String email, String nameUser, String username, String password,
      String confirmPassword) {
    var userReg = User();

    if (email.isNotEmpty ||
        nameUser.isNotEmpty ||
        username.isNotEmpty ||
        password.isNotEmpty ||
        confirmPassword.isNotEmpty) {
      userList.add(User(
        id: userList.length + 1,
        email: email,
        nameUser: nameUser,
        username: username,
        password: password,
        confirmPassword: confirmPassword,
      ));
    }

    userList.forEach((user) {
      if (user.email == email && user.password == password) {
        // ini salah, kenapa? karena password yang di cek adalah password yang baru di inputkan oleh user
        userReg = User(
          id: user.id,
          email: user.email,
          nameUser: user.nameUser,
          username: user.username,
          password: user.password,
          confirmPassword: user.confirmPassword,
        );
      } else {
        userReg = User();
      }
    });

    return userReg;
  }
}

var userList = <User>[
  User(
    id: 1,
    email: 'panjisatrio888@gmail.com',
    nameUser: 'Panji Satrio',
    username: 'panjidwisatrio',
    password: 'password123',
    confirmPassword: 'password123',
  ),
];
