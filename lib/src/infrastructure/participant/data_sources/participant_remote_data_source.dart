import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:madeb75/src/domain/participant/models/participant.dart';
import 'package:madeb75/src/infrastructure/_commons/exceptions.dart';

abstract class IParticipantRemoteDataSource {
  Future<void> saveParticipant({required Participant participant});
  Future<Participant?> getParticipant({required String identifiant});
  Future<List<Participant>> getAllParticipants();
  Future<List<Participant>> getAllParticipantsByVicariats({
    required String vicariatCode,
  });
  Future<void> deleteParticipant({required String identifiant});
  Future<Participant> updateParticipant({required Participant participant});
  Future<void> deleteAllParticipants();
}

String collectionName = 'participants';

class ParticipantRemoteDataSource implements IParticipantRemoteDataSource {
  final FirebaseFirestore firestore;

  ParticipantRemoteDataSource({required this.firestore});

  @override
  Future<void> deleteAllParticipants() async {
    try {
      QuerySnapshot snapshot = await firestore.collection(collectionName).get();
      for (var doc in snapshot.docs) {
        await doc.reference.delete();
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> deleteParticipant({required String identifiant}) async {
    try {
      await firestore.collection(collectionName).doc(identifiant).delete();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<Participant>> getAllParticipants() async {
    try {
      QuerySnapshot snapshot = await firestore.collection(collectionName).get();
      List<Participant> participants =
          snapshot.docs
              .map(
                (doc) =>
                    Participant.fromMap(doc.data() as Map<String, dynamic>),
              )
              .toList();
      return participants;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<Participant>> getAllParticipantsByVicariats({
    required String vicariatCode,
  }) async {
    try {
      QuerySnapshot snapshot =
          await firestore
              .collection(collectionName)
              .where('vicariatCode', isEqualTo: vicariatCode)
              .get();
      List<Participant> participants =
          snapshot.docs
              .map(
                (doc) =>
                    Participant.fromMap(doc.data() as Map<String, dynamic>),
              )
              .toList();
      return participants;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<Participant?> getParticipant({required String identifiant}) async {
    try {
      DocumentSnapshot snapshot =
          await firestore.collection(collectionName).doc(identifiant).get();
      if (snapshot.exists) {
        return Participant.fromMap(snapshot.data() as Map<String, dynamic>);
      }
      return null;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> saveParticipant({required Participant participant}) async {
    try {
      await firestore
          .collection(collectionName)
          .doc(participant.identifiant)
          .set(participant.toMap());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<Participant> updateParticipant({
    required Participant participant,
  }) async {
    try {
      await firestore
          .collection(collectionName)
          .doc(participant.identifiant)
          .update(participant.toMap());
      return participant;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
