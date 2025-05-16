import 'package:madeb75/src/domain/achat_pagne/models/achat_pagne.dart';
import 'package:madeb75/src/domain/atelier/models/atelier.dart';
import 'package:madeb75/src/domain/participant/models/participant.dart';
import 'package:madeb75/src/domain/vicariats/models/vicariat.dart';

List<dynamic> groupDataByVicariat({
  required List<Vicariat> vicariats,
  required List<Participant> participants,
  required List<AchatPagne> achatPagnes,
  required List<Atelier> ateliers,
}) {
  final datas = [];
  for (var vicariat in vicariats) {
    datas.add({
      'vicariat': vicariat.vicariat,
      'participants':
          participants
              .where(
                (participant) =>
                    participant.vicariatCode.toString() ==
                    vicariat.authCode.toString(),
              )
              .toList(),
      'achatPagnes':
          achatPagnes
              .where(
                (achatPagne) =>
                    achatPagne.vicariatCode.toString() ==
                    vicariat.authCode.toString(),
              )
              .toList(),
      'ateliers':
          ateliers
              .where(
                (ateliers) =>
                    ateliers.vicariatCode.toString() ==
                    vicariat.authCode.toString(),
              )
              .toList(),
    });
  }

  return datas;
}
