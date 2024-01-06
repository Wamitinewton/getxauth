class UserModel {
  final String? id;
  final String fullName;
  final String email;
  final String password;

  UserModel(
      {this.id,
      required this.fullName,
      required this.email,
      required this.password});

      toJson(){
        return {
          'id' : id,
          'fullName' : fullName,
          'email' : email,
          'password' : password,
        };
      }
}
