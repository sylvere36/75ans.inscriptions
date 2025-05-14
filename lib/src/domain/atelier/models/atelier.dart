import 'dart:convert';

class Atelier {
  String? identifiant;
  String? nom;
  String? prenom;
  String? vicariat;
  String? vicariatCode;
  String? titre;
  String? paroisse;
  DateTime? createdAt;
  DateTime? updatedAt;

  Atelier({
    this.identifiant,
    this.nom,
    this.prenom,
    this.vicariat,
    this.vicariatCode,
    this.titre,
    this.paroisse,
    this.createdAt,
    this.updatedAt,
  });

  Atelier copyWith({
    String? identifiant,
    String? nom,
    String? prenom,
    String? vicariat,
    String? vicariatCode,
    String? titre,
    String? paroisse,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => Atelier(
    identifiant: identifiant ?? this.identifiant,
    nom: nom ?? this.nom,
    prenom: prenom ?? this.prenom,
    vicariat: vicariat ?? this.vicariat,
    vicariatCode: vicariatCode ?? this.vicariatCode,
    titre: titre ?? this.titre,
    paroisse: paroisse ?? this.paroisse,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );

  factory Atelier.fromJson(String str) => Atelier.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Atelier.fromMap(Map<String, dynamic> json) => Atelier(
    identifiant: json["identifiant"],
    nom: json["nom"],
    prenom: json["prenom"],
    vicariat: json["vicariat"],
    vicariatCode: json["vicariatCode"],
    titre: json["titre"],
    paroisse: json["paroisse"],
    createdAt:
        json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt:
        json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toMap() => {
    "identifiant": identifiant,
    "nom": nom,
    "prenom": prenom,
    "vicariat": vicariat,
    "vicariatCode": vicariatCode,
    "titre": titre,
    "paroisse": paroisse,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };

  bool isValid() {
    return identifiant != null &&
        nom != null &&
        prenom != null &&
        vicariat != null &&
        vicariatCode != null &&
        titre != null &&
        paroisse != null;
  }
}
