import 'dart:convert';

class AchatPagne {
  String? identifiant;
  String? nom;
  String? prenom;
  String? vicariat;
  String? vicariatCode;
  String? titre;
  String? paroisse;
  int? nombrePagne;
  DateTime? createdAt;
  DateTime? updatedAt;

  AchatPagne({
    this.identifiant,
    this.nom,
    this.prenom,
    this.vicariat,
    this.vicariatCode,
    this.titre,
    this.paroisse,
    this.nombrePagne,
    this.createdAt,
    this.updatedAt,
  });

  AchatPagne copyWith({
    String? identifiant,
    String? nom,
    String? prenom,
    String? vicariat,
    String? vicariatCode,
    String? titre,
    String? paroisse,
    int? nombrePagne,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => AchatPagne(
    identifiant: identifiant ?? this.identifiant,
    nom: nom ?? this.nom,
    prenom: prenom ?? this.prenom,
    vicariat: vicariat ?? this.vicariat,
    vicariatCode: vicariatCode ?? this.vicariatCode,
    titre: titre ?? this.titre,
    paroisse: paroisse ?? this.paroisse,
    nombrePagne: nombrePagne ?? this.nombrePagne,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );

  factory AchatPagne.fromJson(String str) =>
      AchatPagne.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AchatPagne.fromMap(Map<String, dynamic> json) => AchatPagne(
    identifiant: json["identifiant"],
    nom: json["nom"],
    prenom: json["prenom"],
    vicariat: json["vicariat"],
    vicariatCode: json["vicariatCode"],
    titre: json["titre"],
    paroisse: json["paroisse"],
    nombrePagne: json["nombrePagne"],
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
    "nombrePagne": nombrePagne,
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
        nombrePagne != null &&
        nombrePagne! > 0 &&
        paroisse != null;
  }
}
