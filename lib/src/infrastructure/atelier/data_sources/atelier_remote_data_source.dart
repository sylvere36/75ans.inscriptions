import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:madeb75/src/domain/atelier/models/atelier.dart';
import 'package:madeb75/src/infrastructure/_commons/exceptions.dart';

abstract class IAtelierRemoteDataSource {
  Future<void> saveAtelier({required Atelier atelier});
  Future<Atelier?> getAtelier({required String identifiant});
  Future<List<Atelier>> getAllAteliers();
  Future<List<Atelier>> getAllAteliersByVicariats({
    required String vicariatCode,
  });
  Future<void> deleteAtelier({required String identifiant});
  Future<Atelier> updateAtelier({required Atelier atelier});
  Future<void> deleteAllAteliers();
}

String collectionName = 'ateliers';

class AtelierRemoteDataSource implements IAtelierRemoteDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<void> deleteAllAteliers() async {
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
  Future<void> deleteAtelier({required String identifiant}) async {
    try {
      await _firestore.collection(collectionName).doc(identifiant).delete();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<Atelier>> getAllAteliers() async {
    try {
      QuerySnapshot snapshot =
          await _firestore.collection(collectionName).get();
      List<Atelier> ateliers =
          snapshot.docs
              .map((doc) => Atelier.fromMap(doc.data() as Map<String, dynamic>))
              .toList();
      return ateliers;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<Atelier>> getAllAteliersByVicariats({
    required String vicariatCode,
  }) async {
    try {
      QuerySnapshot snapshot =
          await _firestore
              .collection(collectionName)
              .where('vicariatCode', isEqualTo: vicariatCode)
              .get();
      List<Atelier> ateliers =
          snapshot.docs
              .map((doc) => Atelier.fromMap(doc.data() as Map<String, dynamic>))
              .toList();
      return ateliers;
    } catch (e) {
      log(e.toString());
      throw ServerException(e.toString());
    }
  }

  @override
  Future<Atelier?> getAtelier({required String identifiant}) async {
    try {
      DocumentSnapshot snapshot =
          await _firestore.collection(collectionName).doc(identifiant).get();
      if (snapshot.exists) {
        return Atelier.fromMap(snapshot.data() as Map<String, dynamic>);
      }
      return null;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> saveAtelier({required Atelier atelier}) async {
    try {
      await _firestore
          .collection(collectionName)
          .doc(atelier.identifiant)
          .set(atelier.toMap());
    } catch (e) {
      log(e.toString());
      throw ServerException(e.toString());
    }
  }

  @override
  Future<Atelier> updateAtelier({required Atelier atelier}) async {
    try {
      await _firestore
          .collection(collectionName)
          .doc(atelier.identifiant)
          .update(atelier.toMap());
      return atelier;
    } catch (e) {
      log(e.toString());
      throw ServerException(e.toString());
    }
  }
}
