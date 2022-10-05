class ShopeModel{
  String shopeName,shopeId,whatsapp,phone,des;

  ShopeModel({required this.shopeName,required this.shopeId,required this.whatsapp,required this.phone,required this.des});

  factory ShopeModel.fromMap(Map<String, dynamic> map) {
    return new ShopeModel(
      shopeName: map['shopeName'] as String,
      shopeId: map['shopeId'] as String,
      whatsapp: map['whatsapp'] as String,
      phone: map['phone'] as String,
      des: map['des'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    // ignore: unnecessary_cast
    return {
      'shopeName': this.shopeName,
      'shopeId': this.shopeId,
      'whatsapp': this.whatsapp,
      'phone': this.phone,
      'des': this.des,
    } as Map<String, dynamic>;
  }
}