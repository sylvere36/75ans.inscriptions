import 'package:dartz/dartz.dart';
import 'package:madeb75/src/domain/_commons/global_failure.dart';
import 'package:madeb75/src/domain/participant/i_participant_repository.dart';
import 'package:madeb75/src/domain/participant/models/participant.dart';
import 'package:madeb75/src/infrastructure/_commons/exceptions.dart';
import 'package:madeb75/src/infrastructure/_commons/network/network_info.dart';
import 'package:madeb75/src/infrastructure/participant/data_sources/participant_remote_data_source.dart';

class ParticipantRepository implements IParticipantRepository {
  final INetworkInfo networkInfo;
  final IParticipantRemoteDataSource remoteDataSource;
  ParticipantRepository({
    required this.networkInfo,
    required this.remoteDataSource,
  });

  @override
  Future<Either<GlobalFailure, Unit>> deleteAllParticipants() async {
    if (await networkInfo.checkConnection()) {
      try {
        await remoteDataSource.deleteAllParticipants();
        return Right(unit);
      } on UnauthorizedException catch (e) {
        return Left(Unauthorized(e.errorText));
      } on ServerException catch (e) {
        return Left(ServerError(e.errorText));
      }
    }
    return const Left(NoNetwork());
  }

  @override
  Future<Either<GlobalFailure, Unit>> deleteParticipant({
    required String identifiant,
  }) async {
    if (await networkInfo.checkConnection()) {
      try {
        await remoteDataSource.deleteParticipant(identifiant: identifiant);
        return Right(unit);
      } on UnauthorizedException catch (e) {
        return Left(Unauthorized(e.errorText));
      } on ServerException catch (e) {
        return Left(ServerError(e.errorText));
      }
    }
    return const Left(NoNetwork());
  }

  @override
  Future<Either<GlobalFailure, List<Participant>>> getAllParticipants() async {
    if (await networkInfo.checkConnection()) {
      try {
        final participants = await remoteDataSource.getAllParticipants();
        return Right(participants);
      } on UnauthorizedException catch (e) {
        return Left(Unauthorized(e.errorText));
      } on ServerException catch (e) {
        return Left(ServerError(e.errorText));
      }
    }
    return const Left(NoNetwork());
  }

  @override
  Future<Either<GlobalFailure, List<Participant>>>
  getAllParticipantsByVicariats({required String vicariatCode}) async {
    if (await networkInfo.checkConnection()) {
      try {
        final participants = await remoteDataSource
            .getAllParticipantsByVicariats(vicariatCode: vicariatCode);
        return Right(participants);
      } on UnauthorizedException catch (e) {
        return Left(Unauthorized(e.errorText));
      } on ServerException catch (e) {
        return Left(ServerError(e.errorText));
      }
    }
    return const Left(NoNetwork());
  }

  @override
  Future<Either<GlobalFailure, Participant?>> getParticipant({
    required String identifiant,
  }) async {
    if (await networkInfo.checkConnection()) {
      try {
        final participant = await remoteDataSource.getParticipant(
          identifiant: identifiant,
        );
        return Right(participant);
      } on UnauthorizedException catch (e) {
        return Left(Unauthorized(e.errorText));
      } on ServerException catch (e) {
        return Left(ServerError(e.errorText));
      }
    }
    return const Left(NoNetwork());
  }

  @override
  Future<Either<GlobalFailure, Unit>> saveParticipant({
    required Participant participant,
  }) async {
    if (await networkInfo.checkConnection()) {
      try {
        await remoteDataSource.saveParticipant(participant: participant);
        return Right(unit);
      } on UnauthorizedException catch (e) {
        return Left(Unauthorized(e.errorText));
      } on ServerException catch (e) {
        return Left(ServerError(e.errorText));
      }
    }
    return const Left(NoNetwork());
  }

  @override
  Future<Either<GlobalFailure, Participant>> updateParticipant({
    required Participant participant,
  }) async {
    if (await networkInfo.checkConnection()) {
      try {
        final updatedParticipant = await remoteDataSource.updateParticipant(
          participant: participant,
        );
        return Right(updatedParticipant);
      } on UnauthorizedException catch (e) {
        return Left(Unauthorized(e.errorText));
      } on ServerException catch (e) {
        return Left(ServerError(e.errorText));
      }
    }
    return const Left(NoNetwork());
  }
}
