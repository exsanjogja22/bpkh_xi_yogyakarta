import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  Login({
    this.status,
    this.token,
    this.pesan,
    this.level,
  });

  bool? status;
  String? token;
  List<String>? pesan;
  String? level;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        status: json["status"],
        token: json["token"],
        pesan: List<String>.from(json["pesan"].map((x) => x)),
        level: json["level"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "token": token ?? "null",
        "pesan": pesan == null ? [] : List<dynamic>.from(pesan!.map((x) => x)),
        "level": level,
      };
}
