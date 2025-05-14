import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:madeb75/src/domain/achat_pagne/models/achat_pagne.dart';
import 'package:madeb75/src/infrastructure/_commons/exceptions.dart';

abstract class IAchatPagneRemoteDataSource {
  Future<void> saveAchatPagne({required AchatPagne achatPagne});
  Future<AchatPagne?> getAchatPagne({required String identifiant});
  Future<List<AchatPagne>> getAllAchatPagnes();
  Future<List<AchatPagne>> getAllAchatPagnesByVicariats({
    required String vicariatCode,
  });
  Future<void> deleteAchatPagne({required String identifiant});
  Future<AchatPagne> updateAchatPagne({required AchatPagne achatPagne});
  Future<void> deleteAllAchatPagnes();
}

String collectionName = 'achatPagnes';

class AchatPagneRemoteDataSource implements IAchatPagneRemoteDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> deleteAllAchatPagnes() async {
    try {
      QuerySnapshot snapshot =
          await _firestore.collection(collectionName).get();
      for (var doc in snapshot.docs) {
        await doc.reference.delete();
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> deleteAchatPagne({required String identifiant}) async {
    try {
      await _firestore.collection(collectionName).doc(identifiant).delete();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<AchatPagne>> getAllAchatPagnes() async {
    try {
      QuerySnapshot snapshot =
          await _firestore.collection(collectionName).get();
      List<AchatPagne> achatPagnes =
          snapshot.docs
              .map(
                (doc) => AchatPagne.fromMap(doc.data() as Map<String, dynamic>),
              )
              .toList();
      return achatPagnes;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<AchatPagne>> getAllAchatPagnesByVicariats({
    required String vicariatCode,
  }) async {
    try {
      QuerySnapshot snapshot =
          await _firestore
              .collection(collectionName)
              .where('vicariatCode', isEqualTo: vicariatCode)
              .get();
      List<AchatPagne> achatPagnes =
          snapshot.docs
              .map(
                (doc) => AchatPagne.fromMap(doc.data() as Map<String, dynamic>),
              )
              .toList();
      return achatPagnes;
    } catch (e) {
      log(e.toString());
      throw ServerException(e.toString());
    }
  }

  @override
  Future<AchatPagne?> getAchatPagne({required String identifiant}) async {
    try {
      DocumentSnapshot snapshot =
          await _firestore.collection(collectionName).doc(identifiant).get();
      if (snapshot.exists) {
        return AchatPagne.fromMap(snapshot.data() as Map<String, dynamic>);
      }
      return null;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> saveAchatPagne({required AchatPagne achatPagne}) async {
    try {
      await _firestore
          .collection(collectionName)
          .doc(achatPagne.identifiant)
          .set(achatPagne.toMap());
    } catch (e) {
      log(e.toString());
      throw ServerException(e.toString());
    }
  }

  @override
  Future<AchatPagne> updateAchatPagne({required AchatPagne achatPagne}) async {
    try {
      await _firestore
          .collection(collectionName)
          .doc(achatPagne.identifiant)
          .update(achatPagne.toMap());
      return achatPagne;
    } catch (e) {
      log(e.toString());
      throw ServerException(e.toString());
    }
  }
}
