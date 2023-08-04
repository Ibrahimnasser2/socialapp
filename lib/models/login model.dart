class login_model{
  String? id;
  String? name;
  String? email;
  String? phone;
  bool? isemailvalid;
  String? image;
  String? bio;
  String? cover;



  login_model({this.name,this.email,this.phone,this.id,this.isemailvalid,this.image,this.bio,this.cover});
    login_model.fromJson(Map<String,dynamic>json){
      id=json["id"];
      email=json["email"];
      name=json["name"];
      phone=json["phone"];
      isemailvalid=json["isemailvalid"];
      image=json["image"];
      bio=json["bio"];
      cover=json["cover"];



    }
  Map<String,dynamic>tomap(){
      return{
        "name":name,
        "email":email,
        "phone":phone,
        "isemailvalid":isemailvalid,
        "image":image,
        "bio":bio,
        "cover":cover,

      };

  }

  }


