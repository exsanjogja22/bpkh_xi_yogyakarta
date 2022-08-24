import 'dart:convert';

Aproval aprovalFromJson(String str) => Aproval.fromJson(json.decode(str));

String aprovalToJson(Aproval data) => json.encode(data.toJson());

class Aproval {
  Aproval({
    this.data,
    this.pesan,
    this.status,
  });

  List<Datum>? data;
  String? pesan;
  bool? status;

  factory Aproval.fromJson(Map<String, dynamic> json) => Aproval(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        pesan: json["pesan"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "pesan": pesan,
        "status": status,
      };
}

class Datum {
  Datum({
    this.id,
    this.idTransaksi,
    this.nama,
    this.tanggalPinjam,
    this.tanggalKembali,
    this.status,
    this.statusBarang,
    this.statusPengawas,
  });

  String? id;
  String? idTransaksi;
  String? nama;
  DateTime? tanggalPinjam;
  DateTime? tanggalKembali;
  String? status;
  bool? statusBarang;
  String? statusPengawas;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        idTransaksi: json["id_transaksi"],
        nama: json["nama"],
        tanggalPinjam: DateTime.parse(json["tanggal_pinjam"]),
        tanggalKembali: DateTime.parse(json["tanggal_kembali"]),
        status: json["status"],
        statusBarang: json["status_barang"],
        statusPengawas: json["status_pengawas"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_transaksi": idTransaksi,
        "nama": nama,
        "tanggal_pinjam":
            "${tanggalPinjam!.year.toString().padLeft(4, '0')}-${tanggalPinjam!.month.toString().padLeft(2, '0')}-${tanggalPinjam!.day.toString().padLeft(2, '0')}",
        "tanggal_kembali":
            "${tanggalKembali!.year.toString().padLeft(4, '0')}-${tanggalKembali!.month.toString().padLeft(2, '0')}-${tanggalKembali!.day.toString().padLeft(2, '0')}",
        "status": status,
        "status_barang": statusBarang,
        "status_pengawas": statusPengawas,
      };
}
