class UserModel {
  String userId, email, name, pic,phone,whatsapp,addres,shopname,des;

  UserModel(
      {

   required     this.userId,
  required    this.email,
  required    this.name,
  required    this.pic,
  required    this.phone,
  required    this.whatsapp,
  required    this.addres,
  required    this.shopname,
  required    this.des});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return new UserModel(
      userId: map['userId']  ,
      email: map['email']  ,
      name: map['name']  ,
      pic: map['pic']  ,
      phone: map['phone'] ,
      whatsapp: map['whatsapp']  ,
      addres: map['addres']  ,
      shopname: map['shopname'] ,
      des: map['des'] ,
    );
  }

  Map<String, dynamic> toJson() {
    // ignore: unnecessary_cast
    return {
      'userId': this.userId,
      'email': this.email,
      'name': this.name,
      'pic': this.pic,
      'phone': this.phone,
      'whatsapp': this.whatsapp,
      'addres': this.addres,
      'shopname': this.shopname,
      'des': this.des,
    } as Map<String, dynamic>;
  }
}
