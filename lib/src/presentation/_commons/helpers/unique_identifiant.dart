String generateUniqueIdentitant({
  required List<String> identifiants,
  required int count,
  required String identificationCode,
}) {
  String codeSuffix = count.toString().padLeft(3, '0');
  String identifiant = '$identificationCode$codeSuffix';
  if (identifiants.contains(identifiant)) {
    return generateUniqueIdentitant(
      identifiants: identifiants,
      count: count + 1,
      identificationCode: identificationCode,
    );
  } else {
    return identifiant;
  }
}
