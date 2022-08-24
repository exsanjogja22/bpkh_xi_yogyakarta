// To parse this JSON data, do
//
//     final transaksi = transaksiFromJson(jsonString);

import 'dart:convert';

Transaksi transaksiFromJson(String str) => Transaksi.fromJson(json.decode(str));

String transaksiToJson(Transaksi data) => json.encode(data.toJson());

class Transaksi {
    Transaksi({
        required this.data,
        required this.pesan,
        required this.status,
    });

    Data data;
    String pesan;
    bool status;

    factory Transaksi.fromJson(Map<String, dynamic> json) => Transaksi(
        data: Data.fromJson(json["data"]),
        pesan: json["pesan"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "pesan": pesan,
        "status": status,
    };
}

class Data {
    Data({
        required this.tglpinjam,
        required this.tglkembali,
        required this.notransaksi,
    });

    DateTime tglpinjam;
    DateTime tglkembali;
    String notransaksi;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        tglpinjam: DateTime.parse(json["tglpinjam"]),
        tglkembali: DateTime.parse(json["tglkembali"]),
        notransaksi: json["notransaksi"],
    );

    Map<String, dynamic> toJson() => {
        "tglpinjam": "${tglpinjam.year.toString().padLeft(4, '0')}-${tglpinjam.month.toString().padLeft(2, '0')}-${tglpinjam.day.toString().padLeft(2, '0')}",
        "tglkembali": "${tglkembali.year.toString().padLeft(4, '0')}-${tglkembali.month.toString().padLeft(2, '0')}-${tglkembali.day.toString().padLeft(2, '0')}",
        "notransaksi": notransaksi,
    };
}
