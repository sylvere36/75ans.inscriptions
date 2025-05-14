import 'package:dartz/dartz.dart';
import 'package:madeb75/src/domain/_commons/global_failure.dart';
import 'package:madeb75/src/domain/atelier/i_atelier_repository.dart';
import 'package:madeb75/src/domain/atelier/models/atelier.dart';
import 'package:madeb75/src/infrastructure/_commons/exceptions.dart';
import 'package:madeb75/src/infrastructure/_commons/network/network_info.dart';
import 'package:madeb75/src/infrastructure/atelier/data_sources/atelier_remote_data_source.dart';

class AtelierRepository implements IAtelierRepository {
  final INetworkInfo networkInfo;
  final IAtelierRemoteDataSource remoteDataSource;
  AtelierRepository({
    required this.networkInfo,
    required this.remoteDataSource,
  });

  @override
  Future<Either<GlobalFailure, Unit>> deleteAllAteliers() async {
    if (await networkInfo.checkConnection()) {
      try {
        await remoteDataSource.deleteAllAteliers();
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
  Future<Either<GlobalFailure, Unit>> deleteAtelier({
    required String identifiant,
  }) async {
    if (await networkInfo.checkConnection()) {
      try {
        await remoteDataSource.deleteAtelier(identifiant: identifiant);
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
  Future<Either<GlobalFailure, List<Atelier>>> getAllAteliers() async {
    if (await networkInfo.checkConnection()) {
      try {
        final ateliers = await remoteDataSource.getAllAteliers();
        return Right(ateliers);
      } on UnauthorizedException catch (e) {
        return Left(Unauthorized(e.errorText));
      } on ServerException catch (e) {
        return Left(ServerError(e.errorText));
      }
    }
    return const Left(NoNetwork());
  }

  @override
  Future<Either<GlobalFailure, List<Atelier>>> getAllAteliersByVicariats({
    required String vicariatCode,
  }) async {
    if (await networkInfo.checkConnection()) {
      try {
        final ateliers = await remoteDataSource.getAllAteliersByVicariats(
          vicariatCode: vicariatCode,
        );
        return Right(ateliers);
      } on UnauthorizedException catch (e) {
        return Left(Unauthorized(e.errorText));
      } on ServerException catch (e) {
        return Left(ServerError(e.errorText));
      }
    }
    return const Left(NoNetwork());
  }

  @override
  Future<Either<GlobalFailure, Atelier?>> getAtelier({
    required String identifiant,
  }) async {
    if (await networkInfo.checkConnection()) {
      try {
        final atelier = await remoteDataSource.getAtelier(
          identifiant: identifiant,
        );
        return Right(atelier);
      } on UnauthorizedException catch (e) {
        return Left(Unauthorized(e.errorText));
      } on ServerException catch (e) {
        return Left(ServerError(e.errorText));
      }
    }
    return const Left(NoNetwork());
  }

  @override
  Future<Either<GlobalFailure, Unit>> saveAtelier({
    required Atelier atelier,
  }) async {
    if (await networkInfo.checkConnection()) {
      try {
        await remoteDataSource.saveAtelier(atelier: atelier);
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
  Future<Either<GlobalFailure, Atelier>> updateAtelier({
    required Atelier atelier,
  }) async {
    if (await networkInfo.checkConnection()) {
      try {
        final updatedAtelier = await remoteDataSource.updateAtelier(
          atelier: atelier,
        );
        return Right(updatedAtelier);
      } on UnauthorizedException catch (e) {
        return Left(Unauthorized(e.errorText));
      } on ServerException catch (e) {
        return Left(ServerError(e.errorText));
      }
    }
    return const Left(NoNetwork());
  }
}
