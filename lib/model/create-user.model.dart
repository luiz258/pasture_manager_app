class CreateUserModel {
  String fullName;
  String telephone;
  String email;
  String password;
  String office;
  String roleId;

  CreateUserModel(
      {
      this.fullName,
      this.telephone,
      this.email,
      this.password,
      this.office,
      this.roleId});

  CreateUserModel.fromJson(Map<String, dynamic> json) {

    fullName = json['fullName'];
    telephone = json['telephone'];
    email = json['email'];
    password = json['password'];
    office = json['office'];
    roleId = json['roleId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullName'] = this.fullName;
    data['telephone'] = this.telephone;
    data['email'] = this.email;
    data['password'] = this.password;
    data['office'] = this.office;
    data['roleId'] = this.roleId;
    return data;
  }
}
