class AuthenticateModel {
  String email;
  String passwordHash;

  AuthenticateModel({this.email, this.passwordHash});

  AuthenticateModel.fromJson(Map<String, dynamic> json) {
    email = json['Email'];
    passwordHash = json['PasswordHash'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Email'] = this.email;
    data['PasswordHash'] = this.passwordHash;
    return data;
  }
}