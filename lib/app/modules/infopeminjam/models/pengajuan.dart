// To parse this JSON data, do
//
//     final pengajuan = pengajuanFromJson(jsonString);

import 'dart:convert';

Pengajuan pengajuanFromJson(String str) => Pengajuan.fromJson(json.decode(str));

String pengajuanToJson(Pengajuan data) => json.encode(data.toJson());

class Pengajuan {
    Pengajuan({
        required this.data,
        required this.pesan,
        required this.status,
    });

    List<Datum> data;
    String pesan;
    bool status;

    factory Pengajuan.fromJson(Map<String, dynamic> json) => Pengajuan(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        pesan: json["pesan"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "pesan": pesan,
        "status": status,
    };
}

class Datum {
    Datum({
        required this.id,
        required this.nama,
        required this.accAdmin,
        required this.accPengawas,
    });

    int id;
    String nama;
    String accAdmin;
    String accPengawas;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        nama: json["nama"],
        accAdmin: json["acc_admin"],
        accPengawas: json["acc_pengawas"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "acc_admin": accAdmin,
        "acc_pengawas": accPengawas,
    };
}
