
import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    String? user;
    String? pass;

    LoginModel({
        this.user,
        this.pass,
    });

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        user: json["user"],
        pass: json["pass"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "pass": pass,
    };
}
