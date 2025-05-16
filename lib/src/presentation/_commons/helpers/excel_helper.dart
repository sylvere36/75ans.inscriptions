// ignore: deprecated_member_use, avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:madeb75/src/domain/achat_pagne/models/achat_pagne.dart';
import 'package:madeb75/src/domain/atelier/models/atelier.dart';
import 'package:madeb75/src/domain/participant/models/participant.dart';
import 'package:excel/excel.dart';

void exportParticipant({
  required String vicariat,
  required List<Participant> participants,
}) async {
  final excel = Excel.createExcel();
  final String defaultSheet = excel.getDefaultSheet()!;
  String sheetName = 'Participants $vicariat';
  excel.rename(defaultSheet, sheetName);
  final Sheet sheet = excel[sheetName];

  final rows = [
    [
      TextCellValue('Identifiant'),
      TextCellValue('Nom'),
      TextCellValue('Prénom(s)'),
      TextCellValue('Titre/légion'),
      TextCellValue('Vicariat'),
      TextCellValue('Paroisse'),
    ],
  ];

  for (var participant in participants) {
    rows.add([
      TextCellValue(participant.identifiant!),
      TextCellValue(participant.nom ?? ''),
      TextCellValue(participant.prenom ?? ''),
      TextCellValue(participant.titre ?? ''),
      TextCellValue(vicariat),
      TextCellValue(participant.paroisse ?? ''),
    ]);
  }

  for (var row in rows) {
    sheet.appendRow(row);
  }

  autoAdjustColumns(sheet, rows);

  final List<int>? bytes = excel.encode();

  if (bytes != null) {
    final blob = html.Blob([bytes]);
    final url = html.Url.createObjectUrlFromBlob(blob);
    html.AnchorElement(href: url)
      ..setAttribute("download", "liste_participants_$vicariat.xlsx")
      ..click();
    html.Url.revokeObjectUrl(url);
  }
}

void exportAchatPagne({
  required String vicariat,
  required List<AchatPagne> achatsPagnes,
}) async {
  final excel = Excel.createExcel();
  final String defaultSheet = excel.getDefaultSheet()!;
  String sheetName = 'Achat Pagne $vicariat';
  excel.rename(defaultSheet, sheetName);
  final Sheet sheet = excel[sheetName];

  final rows = [
    [
      TextCellValue('Nom'),
      TextCellValue('Prénom(s)'),
      TextCellValue('Titre/légion'),
      TextCellValue('Vicariat'),
      TextCellValue('Paroisse'),
      TextCellValue('Nombre de mètre'),
    ],
  ];

  for (var dt in achatsPagnes) {
    rows.add([
      TextCellValue(dt.nom ?? ''),
      TextCellValue(dt.prenom ?? ''),
      TextCellValue(dt.titre ?? ''),
      TextCellValue(vicariat),
      TextCellValue(dt.paroisse ?? ''),
      TextCellValue(dt.nombrePagne?.toString() ?? ''),
    ]);
  }

  for (var row in rows) {
    sheet.appendRow(row);
  }

  autoAdjustColumns(sheet, rows);

  final List<int>? bytes = excel.encode();

  if (bytes != null) {
    final blob = html.Blob([bytes]);
    final url = html.Url.createObjectUrlFromBlob(blob);
    html.AnchorElement(href: url)
      ..setAttribute("download", "achat_pagne_$vicariat.xlsx")
      ..click();
    html.Url.revokeObjectUrl(url);
  }
}

void exportAtelier({
  required String vicariat,
  required List<Atelier> ateliers,
}) async {
  final excel = Excel.createExcel();
  final String defaultSheet = excel.getDefaultSheet()!;
  String sheetName = 'Atelier $vicariat';
  excel.rename(defaultSheet, sheetName);
  final Sheet sheet = excel[sheetName];

  final rows = [
    [
      TextCellValue('Nom'),
      TextCellValue('Prénom(s)'),
      TextCellValue('Titre/légion'),
      TextCellValue('Vicariat'),
      TextCellValue('Paroisse'),
    ],
  ];

  for (var dt in ateliers) {
    rows.add([
      TextCellValue(dt.nom ?? ''),
      TextCellValue(dt.prenom ?? ''),
      TextCellValue(dt.titre ?? ''),
      TextCellValue(vicariat),
      TextCellValue(dt.paroisse ?? ''),
    ]);
  }

  for (var row in rows) {
    sheet.appendRow(row);
  }

  autoAdjustColumns(sheet, rows);

  final List<int>? bytes = excel.encode();

  if (bytes != null) {
    final blob = html.Blob([bytes]);
    final url = html.Url.createObjectUrlFromBlob(blob);
    html.AnchorElement(href: url)
      ..setAttribute("download", "atelier_$vicariat.xlsx")
      ..click();
    html.Url.revokeObjectUrl(url);
  }
}

void autoAdjustColumns(Sheet sheet, List<List<TextCellValue>> data) {
  final Map<int, int> maxLengths = {};

  for (final row in data) {
    for (int i = 0; i < row.length; i++) {
      final length = row[i].value.text!.length;
      if (maxLengths[i] == null || length > maxLengths[i]!) {
        maxLengths[i] = length;
      }
    }
  }

  maxLengths.forEach((colIndex, length) {
    sheet.setColumnWidth(colIndex, length.toDouble() + 5); // +5 pour du padding
  });
}
