
class SignupModel {
/*
{
  "success": "Başarı ile üye oldunuz."
}
*/

  String? success;

  SignupModel({
    this.success,
  });
  SignupModel.fromJson(Map<String, dynamic> json) {
    success = json['success']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['success'] = success;
    return data;
  }
}
