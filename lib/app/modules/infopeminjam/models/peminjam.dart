// To parse this JSON data, do
//
//     final peminjam = peminjamFromJson(jsonString);

import 'dart:convert';

Peminjam peminjamFromJson(String str) => Peminjam.fromJson(json.decode(str));

String peminjamToJson(Peminjam data) => json.encode(data.toJson());

class Peminjam {
    Peminjam({
        required this.data,
        required this.pesan,
        required this.status,
    });

    List<Datum> data;
    String pesan;
    bool status;

    factory Peminjam.fromJson(Map<String, dynamic> json) => Peminjam(
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
        required this.keterangan,
        required this.totalBarang,
        required this.tanggalPinjam,
        required this.tanggalKembali,
    });

    int id;
    String nama;
    String keterangan;
    int totalBarang;
    DateTime tanggalPinjam;
    DateTime tanggalKembali;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        nama: json["nama"],
        keterangan: json["keterangan"],
        totalBarang: json["total_barang"],
        tanggalPinjam: DateTime.parse(json["tanggal_pinjam"]),
        tanggalKembali: DateTime.parse(json["tanggal_kembali"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "keterangan": keterangan,
        "total_barang": totalBarang,
        "tanggal_pinjam": "${tanggalPinjam.year.toString().padLeft(4, '0')}-${tanggalPinjam.month.toString().padLeft(2, '0')}-${tanggalPinjam.day.toString().padLeft(2, '0')}",
        "tanggal_kembali": "${tanggalKembali.year.toString().padLeft(4, '0')}-${tanggalKembali.month.toString().padLeft(2, '0')}-${tanggalKembali.day.toString().padLeft(2, '0')}",
    };
}
