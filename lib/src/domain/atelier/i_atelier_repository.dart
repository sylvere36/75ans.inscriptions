import 'package:dartz/dartz.dart';
import 'package:madeb75/src/domain/_commons/global_failure.dart';
import 'package:madeb75/src/domain/atelier/models/atelier.dart';

abstract class IAtelierRepository {
  Future<Either<GlobalFailure, Unit>> saveAtelier({required Atelier atelier});
  Future<Either<GlobalFailure, Atelier?>> getAtelier({
    required String identifiant,
  });
  Future<Either<GlobalFailure, List<Atelier>>> getAllAteliers();
  Future<Either<GlobalFailure, List<Atelier>>> getAllAteliersByVicariats({
    required String vicariatCode,
  });
  Future<Either<GlobalFailure, Unit>> deleteAtelier({
    required String identifiant,
  });
  Future<Either<GlobalFailure, Atelier>> updateAtelier({
    required Atelier atelier,
  });
  Future<Either<GlobalFailure, Unit>> deleteAllAteliers();
}
