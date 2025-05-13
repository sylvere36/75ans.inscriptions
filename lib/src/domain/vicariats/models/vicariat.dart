import 'dart:convert';

class Vicariat {
  int? authCode;
  String? identificationCode;
  String? vicariat;
  List<Paroiss>? paroisses;

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
    List<Paroiss>? paroisses,
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
            : List<Paroiss>.from(
              json["paroisses"]!.map((x) => Paroiss.fromMap(x)),
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

class Paroiss {
  String? name;

  Paroiss({this.name});

  Paroiss copyWith({String? name}) => Paroiss(name: name ?? this.name);

  factory Paroiss.fromJson(String str) => Paroiss.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Paroiss.fromMap(Map<String, dynamic> json) =>
      Paroiss(name: json["name"]);

  Map<String, dynamic> toMap() => {"name": name};
}
