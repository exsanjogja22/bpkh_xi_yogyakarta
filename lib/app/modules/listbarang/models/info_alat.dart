// To parse this JSON data, do
//
//     final infoAlat = infoAlatFromJson(jsonString);

import 'dart:convert';

InfoAlat infoAlatFromJson(String str) => InfoAlat.fromJson(json.decode(str));

String infoAlatToJson(InfoAlat data) => json.encode(data.toJson());

class InfoAlat {
    InfoAlat({
        required this.data,
        required this.pesan,
        required this.status,
    });

    List<Datum> data;
    String pesan;
    bool status;

    factory InfoAlat.fromJson(Map<String, dynamic> json) => InfoAlat(
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
        required this.status,
        required this.kondisi,
        required this.nama,
        required this.merk,
        required this.kategori,
        required this.inventaris,
        required this.gambar,
        required this.keterangan,
    });

    int id;
    bool status;
    String kondisi;
    String nama;
    String merk;
    String kategori;
    String inventaris;
    String gambar;
    String keterangan;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        status: json["status"],
        kondisi: json["kondisi"],
        nama: json["nama"],
        merk: json["merk"],
        kategori: json["kategori"],
        inventaris: json["inventaris"],
        gambar: json["gambar"],
        keterangan: json["keterangan"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "kondisi": kondisi,
        "nama": nama,
        "merk": merk,
        "kategori": kategori,
        "inventaris": inventaris,
        "gambar": gambar,
        "keterangan": keterangan,
    };
}
