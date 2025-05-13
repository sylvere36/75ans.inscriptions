import 'package:dartz/dartz.dart';
import 'package:madeb75/src/domain/_commons/global_failure.dart';
import 'package:madeb75/src/domain/participant/models/participant.dart';

abstract class IParticipantRepository {
  Future<Either<GlobalFailure, Unit>> saveParticipant({
    required Participant participant,
  });
  Future<Either<GlobalFailure, Participant?>> getParticipant({
    required String identifiant,
  });
  Future<Either<GlobalFailure, List<Participant>>> getAllParticipants();
  Future<Either<GlobalFailure, List<Participant>>>
  getAllParticipantsByVicariats({required String vicariatCode});
  Future<Either<GlobalFailure, Unit>> deleteParticipant({
    required String identifiant,
  });
  Future<Either<GlobalFailure, Participant>> updateParticipant({
    required Participant participant,
  });
  Future<Either<GlobalFailure, Unit>> deleteAllParticipants();
}
