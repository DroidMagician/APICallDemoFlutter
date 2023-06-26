class UserDetails {
  String? username;
  String? password;
  String? url;
  MultipleUserLogin? multipleUserLogin;

  UserDetails({ this.username,  this.password,  this.url,  this.multipleUserLogin});

  UserDetails.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    url = json['url'];
    multipleUserLogin = (json['multiple_user_login'] != null
        ? new MultipleUserLogin.fromJson(json['multiple_user_login'])
        : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['password'] = this.password;
    data['url'] = this.url;
    if (this.multipleUserLogin != null) {
      data['multiple_user_login'] = this.multipleUserLogin?.toJson();
    }
    return data;
  }
}

class MultipleUserLogin {
  String? deviceToken;
  String? deviceType;
  String? dedeviceviceModel;
  String? sVersion;
  String? appVersion;
  String? deviceName;
  String? deviceUid;

  MultipleUserLogin(
      {this.deviceToken,
      this.deviceType,
      this.dedeviceviceModel,
      this.sVersion,
      this.appVersion,
      this.deviceName,
      this.deviceUid});

  MultipleUserLogin.fromJson(Map<String, dynamic> json) {
    deviceToken = json['device_token'];
    deviceType = json['device_type'];
    dedeviceviceModel = json['dedevicevice_model'];
    sVersion = json['_version'];
    appVersion = json['app_version'];
    deviceName = json['device_name'];
    deviceUid = json['device_uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['device_token'] = this.deviceToken;
    data['device_type'] = this.deviceType;
    data['dedevicevice_model'] = this.dedeviceviceModel;
    data['_version'] = this.sVersion;
    data['app_version'] = this.appVersion;
    data['device_name'] = this.deviceName;
    data['device_uid'] = this.deviceUid;
    return data;
  }
}