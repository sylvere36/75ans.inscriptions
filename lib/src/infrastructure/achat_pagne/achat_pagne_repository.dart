import 'package:dartz/dartz.dart';
import 'package:madeb75/src/domain/_commons/global_failure.dart';
import 'package:madeb75/src/domain/achat_pagne/i_achat_pagne_repository.dart';
import 'package:madeb75/src/domain/achat_pagne/models/achat_pagne.dart';
import 'package:madeb75/src/infrastructure/_commons/exceptions.dart';
import 'package:madeb75/src/infrastructure/_commons/network/network_info.dart';
import 'package:madeb75/src/infrastructure/achat_pagne/data_sources/achat_pagne_remote_data_source.dart';

class AchatPagneRepository implements IAchatPagneRepository {
  final INetworkInfo networkInfo;
  final IAchatPagneRemoteDataSource remoteDataSource;
  AchatPagneRepository({
    required this.networkInfo,
    required this.remoteDataSource,
  });

  @override
  Future<Either<GlobalFailure, Unit>> deleteAllAchatPagnes() async {
    if (await networkInfo.checkConnection()) {
      try {
        await remoteDataSource.deleteAllAchatPagnes();
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
  Future<Either<GlobalFailure, Unit>> deleteAchatPagne({
    required String identifiant,
  }) async {
    if (await networkInfo.checkConnection()) {
      try {
        await remoteDataSource.deleteAchatPagne(identifiant: identifiant);
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
  Future<Either<GlobalFailure, List<AchatPagne>>> getAllAchatPagnes() async {
    if (await networkInfo.checkConnection()) {
      try {
        final achatPagnes = await remoteDataSource.getAllAchatPagnes();
        return Right(achatPagnes);
      } on UnauthorizedException catch (e) {
        return Left(Unauthorized(e.errorText));
      } on ServerException catch (e) {
        return Left(ServerError(e.errorText));
      }
    }
    return const Left(NoNetwork());
  }

  @override
  Future<Either<GlobalFailure, List<AchatPagne>>> getAllAchatPagnesByVicariats({
    required String vicariatCode,
  }) async {
    if (await networkInfo.checkConnection()) {
      try {
        final achatPagnes = await remoteDataSource.getAllAchatPagnesByVicariats(
          vicariatCode: vicariatCode,
        );
        return Right(achatPagnes);
      } on UnauthorizedException catch (e) {
        return Left(Unauthorized(e.errorText));
      } on ServerException catch (e) {
        return Left(ServerError(e.errorText));
      }
    }
    return const Left(NoNetwork());
  }

  @override
  Future<Either<GlobalFailure, AchatPagne?>> getAchatPagne({
    required String identifiant,
  }) async {
    if (await networkInfo.checkConnection()) {
      try {
        final achatPagne = await remoteDataSource.getAchatPagne(
          identifiant: identifiant,
        );
        return Right(achatPagne);
      } on UnauthorizedException catch (e) {
        return Left(Unauthorized(e.errorText));
      } on ServerException catch (e) {
        return Left(ServerError(e.errorText));
      }
    }
    return const Left(NoNetwork());
  }

  @override
  Future<Either<GlobalFailure, Unit>> saveAchatPagne({
    required AchatPagne achatPagne,
  }) async {
    if (await networkInfo.checkConnection()) {
      try {
        await remoteDataSource.saveAchatPagne(achatPagne: achatPagne);
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
  Future<Either<GlobalFailure, AchatPagne>> updateAchatPagne({
    required AchatPagne achatPagne,
  }) async {
    if (await networkInfo.checkConnection()) {
      try {
        final updatedAchatPagne = await remoteDataSource.updateAchatPagne(
          achatPagne: achatPagne,
        );
        return Right(updatedAchatPagne);
      } on UnauthorizedException catch (e) {
        return Left(Unauthorized(e.errorText));
      } on ServerException catch (e) {
        return Left(ServerError(e.errorText));
      }
    }
    return const Left(NoNetwork());
  }
}
