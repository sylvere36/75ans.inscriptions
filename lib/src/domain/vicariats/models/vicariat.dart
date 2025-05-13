import 'dart:convert';

class Vicariat {
  int? authCode;
  String? identificationCode;
  String? vicariat;
  List<Paroisse>? paroisses;

  Vicariat({
    this.authCode,
    this.identificationCode,
    this.vicariat,
    this.paroisses,
  });

  Vicariat copyWith({
    int? authCode,
    String? identificationCode,
    String? vicariat,
    List<Paroisse>? paroisses,
  }) => Vicariat(
    authCode: authCode ?? this.authCode,
    identificationCode: identificationCode ?? this.identificationCode,
    vicariat: vicariat ?? this.vicariat,
    paroisses: paroisses ?? this.paroisses,
  );

  factory Vicariat.fromJson(String str) => Vicariat.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Vicariat.fromMap(Map<String, dynamic> json) => Vicariat(
    authCode: json["authCode"],
    identificationCode: json["identificationCode"],
    vicariat: json["vicariat"],
    paroisses:
        json["paroisses"] == null
            ? []
            : List<Paroisse>.from(
              json["paroisses"]!.map((x) => Paroisse.fromMap(x)),
            ),
  );

  Map<String, dynamic> toMap() => {
    "authCode": authCode,
    "identificationCode": identificationCode,
    "vicariat": vicariat,
    "paroisses":
        paroisses == null
            ? []
            : List<dynamic>.from(paroisses!.map((x) => x.toMap())),
  };
}

class Paroisse {
  String? name;

  Paroisse({this.name});

  Paroisse copyWith({String? name}) => Paroisse(name: name ?? this.name);

  factory Paroisse.fromJson(String str) => Paroisse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Paroisse.fromMap(Map<String, dynamic> json) =>
      Paroisse(name: json["name"]);

  Map<String, dynamic> toMap() => {"name": name};
}
