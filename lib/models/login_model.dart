
class LoginModel {
/*
{
  "success": "Başarı ile giriş yaptınız.",
  "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiI5NjFhMDUyOC0yNmRhLTQ5NjYtOWE2NC1lN2JjYmE1MmVlOTUiLCJqdGkiOiJlZmMxZWMxNmRkYzllNTI4OTlhMjdiOTYwMmY4NjdmZTgzY2E0Y2ViZTAyZDVhZDM2ZmVlMTEyMDQ4ODgwMTU1YjJmNWNhY2M0N2VlYTUwNSIsImlhdCI6MTY1MDQzNDg3My45MTQ0MjksIm5iZiI6MTY1MDQzNDg3My45MTQ1NDYsImV4cCI6MTY4MTk3MDg3My44MTkwMjMsInN1YiI6IjI2Iiwic2NvcGVzIjpbXX0.enA8iFRn8jFN1wQY3WbNLMxhB4ugGyvj8lMmmO4wjJyZ9Tb3e3vUp4Hnu5V7eHruymk6tXi0_SPhuD4lfeyxDuQHKDOGSq8WcSSypdZVzyaxzexq_rAjaJSeAZUf_C2h2lZzCO99siet02BQMqb37rK-fF_0a4CJgb1h1OtLeT0puLqfWEbk3yS5FYVJuWDWzNFZdXEVSQOnxn98VclaRFcKNdLTvht2K3zJKpgBLsP28gXoWqcKRLgv-EM49OtluGSlkEk0SZlWh8Vdu88tpppspZTP6ldipHT-e80Xj2ck0XmhbKgptcgOXzKHw7C-gd8oU9PwVBaXiZSedVP2ZwTSBLCnwJhoQTHyFINaEYcrBltr_4puP6UDb0naK8Kp2GIjKArZj0MGrX1025kqBEyhofC65GWIkDELpl6L7kJqM0GPmThJ7PwVVhskpsRs0ns35HC-X00GTLOZWyYNVeHt4GVsRUdR9MmWIx5FkdeIUbE0nbdt9CTR1CK2dTLTRpj3-KeerFGW5ECs5FBb904cAod6ErxFwXIuGNOj7jM-MUaSRJKgm4niTG1nVh3QHyduquU9H-Xsq6B8gWMiS_o5veeF31UEDte-3VlHvnbmCphYMoBnE12-2CfDBOvtNDTASsYQOUEyi9mTyuFoePb1hzttBjwGfBxL7W3Em-o"
}
*/

  String? success;
  String? token;

  LoginModel({
    this.success,
    this.token,
  });
  LoginModel.fromJson(Map<String, dynamic> json) {
    success = json['success']?.toString();
    token = json['token']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['success'] = success;
    data['token'] = token;
    return data;
  }
}
