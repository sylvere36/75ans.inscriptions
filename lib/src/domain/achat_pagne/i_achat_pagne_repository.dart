import 'package:dartz/dartz.dart';
import 'package:madeb75/src/domain/_commons/global_failure.dart';
import 'package:madeb75/src/domain/achat_pagne/models/achat_pagne.dart';

abstract class IAchatPagneRepository {
  Future<Either<GlobalFailure, Unit>> saveAchatPagne({
    required AchatPagne achatPagne,
  });
  Future<Either<GlobalFailure, AchatPagne?>> getAchatPagne({
    required String identifiant,
  });
  Future<Either<GlobalFailure, List<AchatPagne>>> getAllAchatPagnes();
  Future<Either<GlobalFailure, List<AchatPagne>>> getAllAchatPagnesByVicariats({
    required String vicariatCode,
  });
  Future<Either<GlobalFailure, Unit>> deleteAchatPagne({
    required String identifiant,
  });
  Future<Either<GlobalFailure, AchatPagne>> updateAchatPagne({
    required AchatPagne achatPagne,
  });
  Future<Either<GlobalFailure, Unit>> deleteAllAchatPagnes();
}
