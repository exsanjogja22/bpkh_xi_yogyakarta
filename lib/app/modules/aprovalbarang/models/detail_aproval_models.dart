import 'dart:convert';

DetailAproval detailAprovalFromJson(String str) =>
    DetailAproval.fromJson(json.decode(str));

String detailAprovalToJson(DetailAproval data) => json.encode(data.toJson());

class DetailAproval {
  DetailAproval({
    this.data,
    this.pesan,
    this.status,
  });

  Data? data;
  String? pesan;
  bool? status;

  factory DetailAproval.fromJson(Map<String, dynamic> json) => DetailAproval(
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
    this.barang,
    this.nip,
    this.noWa,
    this.dipinjam,
  });

  String? id;
  String? transaksi;
  String? namapeminjam;
  DateTime? tglpinjam;
  DateTime? tglkembali;
  List<Barang>? barang;
  String? nip;
  String? noWa;
  String? dipinjam;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        transaksi: json["transaksi"],
        namapeminjam: json["namapeminjam"],
        tglpinjam: DateTime.parse(json["tglpinjam"]),
        tglkembali: DateTime.parse(json["tglkembali"]),
        barang:
            List<Barang>.from(json["barang"].map((x) => Barang.fromJson(x))),
        nip: json["nip"],
        noWa: json["no_wa"],
        dipinjam: json["dipinjam"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "transaksi": transaksi,
        "namapeminjam": namapeminjam,
        "tglpinjam":
            "${tglpinjam!.year.toString().padLeft(4, '0')}-${tglpinjam!.month.toString().padLeft(2, '0')}-${tglpinjam!.day.toString().padLeft(2, '0')}",
        "tglkembali":
            "${tglkembali!.year.toString().padLeft(4, '0')}-${tglkembali!.month.toString().padLeft(2, '0')}-${tglkembali!.day.toString().padLeft(2, '0')}",
        "barang": List<dynamic>.from(barang!.map((x) => x.toJson())),
        "nip": nip,
        "no_wa": noWa,
        "dipinjam": dipinjam,
      };
}

class Barang {
  Barang({
    this.nama,
    this.kategori,
    this.inventaris,
    this.statusbarang,
  });

  String? nama;
  String? kategori;
  String? inventaris;
  String? statusbarang;

  factory Barang.fromJson(Map<String, dynamic> json) => Barang(
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
