class user_model {
  String? id;
  String? username;
  String? password;
  String? noTelp;
  String? alamat;

  user_model({this.id, this.username, this.password, this.noTelp, this.alamat});

  user_model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    password = json['password'];
    noTelp = json['no_telp'];
    alamat = json['alamat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['password'] = this.password;
    data['no_telp'] = this.noTelp;
    data['alamat'] = this.alamat;
    return data;
  }
}
