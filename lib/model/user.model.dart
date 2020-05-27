class UserModel {
  String roleId;
  String id;
  String farmId;
  String token;
  String name;

  UserModel({this.roleId, this.id, this.farmId, this.token, this.name});

  UserModel.fromJson(Map<String, dynamic> json) {
    roleId = json['roleId'];
    id = json['id'];
    farmId = json['farmId'];
    token = json['token'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['roleId'] = this.roleId;
    data['id'] = this.id;
    data['farmId'] = this.farmId;
    data['token'] = this.token;
    data['name'] = this.name;
    return data;
  }
}
