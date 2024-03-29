import 'dart:convert';

DetailTransaksi detailTransaksiFromJson(String str) =>
    DetailTransaksi.fromJson(json.decode(str));

String detailTransaksiToJson(DetailTransaksi data) =>
    json.encode(data.toJson());

class DetailTransaksi {
  DetailTransaksi({
    this.data,
    this.pesan,
    this.status,
  });

  Data? data;
  String? pesan;
  bool? status;

  factory DetailTransaksi.fromJson(Map<String, dynamic> json) =>
      DetailTransaksi(
        data: Data.fromJson(json["data"]),
        pesan: json["pesan"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": data!.toJson(),
        "pesan": pesan,
        "status": status,
      };
}

class Data {
  Data({
    this.id,
    this.transaksi,
    this.namapeminjam,
    this.tglpinjam,
    this.tglkembali,
    this.nip,
    this.noWa,
    this.dipinjam,
    this.daftarBarang,
  });

  String? id;
  String? transaksi;
  String? namapeminjam;
  DateTime? tglpinjam;
  DateTime? tglkembali;
  String? nip;
  String? noWa;
  String? dipinjam;
  List<DaftarBarang>? daftarBarang;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        transaksi: json["transaksi"],
        namapeminjam: json["namapeminjam"],
        tglpinjam: DateTime.parse(json["tglpinjam"]),
        tglkembali: DateTime.parse(json["tglkembali"]),
        nip: json["nip"],
        noWa: json["no_wa"],
        dipinjam: json["dipinjam"],
        daftarBarang: List<DaftarBarang>.from(
            json["daftar_barang"].map((x) => DaftarBarang.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "transaksi": transaksi,
        "namapeminjam": namapeminjam,
        "tglpinjam":
            "${tglpinjam!.year.toString().padLeft(4, '0')}-${tglpinjam!.month.toString().padLeft(2, '0')}-${tglpinjam!.day.toString().padLeft(2, '0')}",
        "tglkembali":
            "${tglkembali!.year.toString().padLeft(4, '0')}-${tglkembali!.month.toString().padLeft(2, '0')}-${tglkembali!.day.toString().padLeft(2, '0')}",
        "nip": nip,
        "no_wa": noWa,
        "dipinjam": dipinjam,
        "daftar_barang":
            List<dynamic>.from(daftarBarang!.map((x) => x.toJson())),
      };
}

class DaftarBarang {
  DaftarBarang({
    this.nama,
    this.kategori,
    this.inventaris,
    this.statusbarang,
  });

  String? nama;
  String? kategori;
  String? inventaris;
  String? statusbarang;

  factory DaftarBarang.fromJson(Map<String, dynamic> json) => DaftarBarang(
        nama: json["nama"],
        kategori: json["kategori"],
        inventaris: json["inventaris"],
        statusbarang: json["statusbarang"],
      );

  Map<String, dynamic> toJson() => {
        "nama": nama,
        "kategori": kategori,
        "inventaris": inventaris,
        "statusbarang": statusbarang,
      };
}
