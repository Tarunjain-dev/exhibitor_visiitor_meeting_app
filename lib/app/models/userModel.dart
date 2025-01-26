class UserModel {
  final String? userId;
  final String? name;
  final String? email;
  final String? phone;
  final String? companyName;
  final String? companyDesc;
  final String? qrId;
  final String? role;
  final String? stallNo;
  final String? password;
  final UserType? userType;


  final String? profileUrl;

  UserModel({
    this.userId,
    this.name,
    this.email,
    this.phone,
    this.companyName,
    this.companyDesc,
    this.qrId,
    this.role,
    this.profileUrl,
    this.password,
    this.stallNo,
    this.userType,
  });

  UserModel copyWith({
    String? userId,
    String? name,
    String? email,
    String? phone,
    String? companyName,
    String? companyDesc,
    String? qrId,
    String? password,
    String? role,
    String? profileUrl,
    String? stallNo,
    UserType? userType
  }) {
    return UserModel(
      userId: userId ?? this.userId,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      companyName: companyName ?? this.companyName,
      companyDesc: companyDesc ?? this.companyDesc,
      qrId: qrId ?? this.qrId,
      role: role ?? this.role,
      profileUrl: profileUrl ?? this.profileUrl,
      stallNo: stallNo ?? this.stallNo,
      password: password ?? this.password,
      userType: userType ?? this.userType
    );
  }

  UserModel.fromJson(Map<String, dynamic> json)
      : userId = json['userId'] as String?,
        name = json['name'] as String?,
        email = json['email'] as String?,
        phone = json['phone'] as String?,
        companyName = json['companyName'] as String?,
        companyDesc = json['companyDesc'] as String?,
        qrId = json['qrId'] as String?,
        role = json['role'] as String?,
        stallNo = json['stallNo'] as String?,
        password = json['password'] as String?,
        userType = EnumConverter.fromMapUserRole(json['userType']),
        profileUrl = json['profileUrl'] as String?;

  Map<String, dynamic> toJson() => {
    'userId' : userId,
    'name' : name,
    'email' : email,
    'phone' : phone,
    'companyName' : companyName,
    'companyDesc' : companyDesc,
    'password' : password,
    'qrId' : qrId,
    'role' : role,
    'stallNo' : stallNo,
    'profileUrl' : profileUrl,
    'userType' : EnumConverter.toMapUserRole(userType!)
  };
}

enum UserType{
  EXHIBITOR,
  VISITOR,
}

class EnumConverter{
  static UserType fromMapUserRole(String userType){
    if(userType == 'EXHIBITOR'){
      return UserType.EXHIBITOR;
    }else {
      return UserType.VISITOR;
    }
  }

  static String toMapUserRole(UserType userType){
    if (userType == UserType.EXHIBITOR) {
      return 'EXHIBITOR';
    } else if (userType == UserType.VISITOR) {
      return 'VISITOR';
    }else{
      return '';
    }
  }
}