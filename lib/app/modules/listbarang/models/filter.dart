// To parse this JSON data, do
//
//     final filter = filterFromJson(jsonString);

import 'dart:convert';

Filter filterFromJson(String str) => Filter.fromJson(json.decode(str));

String filterToJson(Filter data) => json.encode(data.toJson());

class Filter {
    Filter({
        required this.data,
        required this.pesan,
        required this.status,
    });

    List<Datum> data;
    String pesan;
    bool status;

    factory Filter.fromJson(Map<String, dynamic> json) => Filter(
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
        required this.katregori,
        required this.deskripsi,
    });

    int id;
    String katregori;
    String deskripsi;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        katregori: json["katregori"],
        deskripsi: json["deskripsi"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "katregori": katregori,
        "deskripsi": deskripsi,
    };
}
