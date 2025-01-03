class Profile {
  User? user;

  Profile({this.user});

  Profile.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? userName;
  String? email;
  String? phone;
  int? countryId;
  int? stateId;
  int? cityId;
  String? address;
  String? designation;
  String? aboutMe;
  String? mySkill;

  User(
      {this.id,
        this.name,
        this.userName,
        this.email,
        this.phone,
        this.countryId,
        this.stateId,
        this.cityId,
        this.address,
        this.designation,
        this.aboutMe,
        this.mySkill});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    userName = json['user_name'];
    email = json['email'];
    phone = json['phone'];
    countryId = json['country_id'];
    stateId = json['state_id'];
    cityId = json['city_id'];
    address = json['address'];
    designation = json['designation'];
    aboutMe = json['about_me'];
    mySkill = json['my_skill'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['user_name'] = this.userName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['country_id'] = this.countryId;
    data['state_id'] = this.stateId;
    data['city_id'] = this.cityId;
    data['address'] = this.address;
    data['designation'] = this.designation;
    data['about_me'] = this.aboutMe;
    data['my_skill'] = this.mySkill;
    return data;
  }
}