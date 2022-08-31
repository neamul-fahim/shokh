

class UserDataModel {
  String? uid;
  String ? email;

  UserDataModel(this.uid, this.email);

  ///set method
  Map<String , dynamic > toMap(){
    return{
      "uid":uid,
       "email":email,
    };
  }

  ///get method
  factory UserDataModel.fromMap(map){
    return UserDataModel(
         map["uid"],
         map["email"],
    );
  }


}