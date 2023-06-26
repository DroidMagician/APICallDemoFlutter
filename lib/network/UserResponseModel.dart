class UserResponseModel {
	Users? users;

	UserResponseModel({this.users});

	UserResponseModel.fromJson(Map<String, dynamic> json) {
		users = json['Users'] != null ? new Users.fromJson(json['Users']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.users != null) {
			data['Users'] = this.users!.toJson();
		}
		return data;
	}
}

class Users {
	int? id;
	int? workshopId;
	String? firstname;
	String? lastname;
	String? username;
	String? email;
	String? userProfile;
	int? roleId;
	int? syncDataId;
	int? accessLevel;
	Null? stripeCustomerId;
	Null? stripeToken;
	String? desktopApp;
	String? mobileApp;
	String? suburb;
	String? postcode;
	String? city;
	Null? state;

	Users(
			{this.id,
				this.workshopId,
				this.firstname,
				this.lastname,
				this.username,
				this.email,
				this.userProfile,
				this.roleId,
				this.syncDataId,
				this.accessLevel,
				this.stripeCustomerId,
				this.stripeToken,
				this.desktopApp,
				this.mobileApp,
				this.suburb,
				this.postcode,
				this.city,
				this.state});

	Users.fromJson(Map<String, dynamic> json) {
		id = json['id'];
		workshopId = json['workshop_id'];
		firstname = json['firstname'];
		lastname = json['lastname'];
		username = json['username'];
		email = json['email'];
		userProfile = json['user_profile'];
		roleId = json['role_id'];
		syncDataId = json['sync_data_id'];
		accessLevel = json['access_level'];
		stripeCustomerId = json['stripe_customer_id'];
		stripeToken = json['stripe_token'];
		desktopApp = json['desktop_app'];
		mobileApp = json['mobile_app'];
		suburb = json['suburb'];
		postcode = json['postcode'];
		city = json['city'];
		state = json['state'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['id'] = this.id;
		data['workshop_id'] = this.workshopId;
		data['firstname'] = this.firstname;
		data['lastname'] = this.lastname;
		data['username'] = this.username;
		data['email'] = this.email;
		data['user_profile'] = this.userProfile;
		data['role_id'] = this.roleId;
		data['sync_data_id'] = this.syncDataId;
		data['access_level'] = this.accessLevel;
		data['stripe_customer_id'] = this.stripeCustomerId;
		data['stripe_token'] = this.stripeToken;
		data['desktop_app'] = this.desktopApp;
		data['mobile_app'] = this.mobileApp;
		data['suburb'] = this.suburb;
		data['postcode'] = this.postcode;
		data['city'] = this.city;
		data['state'] = this.state;
		return data;
	}
}