import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:madeb75/src/domain/_commons/global_failure.dart';
import 'package:madeb75/src/domain/achat_pagne/i_achat_pagne_repository.dart';
import 'package:madeb75/src/domain/achat_pagne/models/achat_pagne.dart';

part 'achat_pagne_event.dart';
part 'achat_pagne_state.dart';
part 'achat_pagne_bloc.freezed.dart';

class AchatPagneBloc extends Bloc<AchatPagneEvent, AchatPagneState> {
  final IAchatPagneRepository repository;
  AchatPagneBloc({required this.repository})
    : super(AchatPagneState.initial()) {
    on<AchatPagneEvent>((event, emit) {});
    on<GetAllAchatPagnes>(getAllAchatPagnes);
    on<GetAchatPagne>(getAchatPagne);
    on<SaveAchatPagne>(saveAchatPagne);
    on<DeleteAchatPagne>(deleteAchatPagne);
    on<UpdateAchatPagne>(updateAchatPagne);
    on<DeleteAllAchatPagnes>(deleteAllAchatPagnes);
    on<GetAllAchatPagnesByVicariat>(getAllAchatPagnesByVicariat);
  }

  void getAllAchatPagnes(
    GetAllAchatPagnes event,
    Emitter<AchatPagneState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, failureOrSuccessOption: none()));
    final failureOrSuccess = await repository.getAllAchatPagnes();

    failureOrSuccess.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            failureOrSuccessOption: some(left(failure)),
          ),
        );
      },
      (achatPagnes) {
        emit(
          state.copyWith(
            isLoading: false,
            failureOrSuccessOption: some(right(unit)),
            achatPagnes: achatPagnes,
          ),
        );
      },
    );
  }

  void getAllAchatPagnesByVicariat(
    GetAllAchatPagnesByVicariat event,
    Emitter<AchatPagneState> emit,
  ) async {
    log("getAllAchatPagnesByVicariat");
    emit(state.copyWith(isLoading: true, failureOrSuccessOption: none()));
    final failureOrSuccess = await repository.getAllAchatPagnesByVicariats(
      vicariatCode: event.vicariatCode,
    );

    failureOrSuccess.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            failureOrSuccessOption: some(left(failure)),
          ),
        );
      },
      (achatPagnes) {
        achatPagnes.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
        emit(
          state.copyWith(
            isLoading: false,
            failureOrSuccessOption: some(right(unit)),
            vicariatAchatPagnes: achatPagnes,
          ),
        );
      },
    );
  }

  void saveAchatPagne(
    SaveAchatPagne event,
    Emitter<AchatPagneState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, failureOrSuccessOption: none()));
    final failureOrSuccess = await repository.saveAchatPagne(
      achatPagne: event.achatPagne,
    );

    failureOrSuccess.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            action: null,
            failureOrSuccessOption: some(left(failure)),
          ),
        );
      },
      (unit) {
        add(
          GetAllAchatPagnesByVicariat(
            vicariatCode: event.achatPagne.vicariatCode!,
          ),
        );
        emit(
          state.copyWith(
            isLoading: false,
            action: AchatPagneAction.add,
            failureOrSuccessOption: some(right(unit)),
          ),
        );

        emit(
          state.copyWith(
            isLoading: false,
            action: null,
            failureOrSuccessOption: none(),
          ),
        );
      },
    );
  }

  void deleteAchatPagne(
    DeleteAchatPagne event,
    Emitter<AchatPagneState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, failureOrSuccessOption: none()));
    final failureOrSuccess = await repository.deleteAchatPagne(
      identifiant: event.achatPagne.identifiant!,
    );

    failureOrSuccess.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            action: null,
            failureOrSuccessOption: some(left(failure)),
          ),
        );
      },
      (unit) {
        add(
          GetAllAchatPagnesByVicariat(
            vicariatCode: event.achatPagne.vicariatCode!,
          ),
        );
        emit(
          state.copyWith(
            isLoading: false,
            action: AchatPagneAction.delete,
            failureOrSuccessOption: some(right(unit)),
          ),
        );
        emit(
          state.copyWith(
            isLoading: false,
            action: null,
            failureOrSuccessOption: none(),
          ),
        );
      },
    );
  }

  void updateAchatPagne(
    UpdateAchatPagne event,
    Emitter<AchatPagneState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, failureOrSuccessOption: none()));
    final failureOrSuccess = await repository.updateAchatPagne(
      achatPagne: event.achatPagne,
    );

    failureOrSuccess.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            action: null,
            failureOrSuccessOption: some(left(failure)),
          ),
        );
      },
      (unit) {
        emit(
          state.copyWith(
            isLoading: false,
            action: AchatPagneAction.update,
            failureOrSuccessOption: none(),
          ),
        );
        emit(
          state.copyWith(
            isLoading: false,
            action: null,
            failureOrSuccessOption: none(),
          ),
        );
      },
    );
  }

  void deleteAllAchatPagnes(
    DeleteAllAchatPagnes event,
    Emitter<AchatPagneState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, failureOrSuccessOption: none()));
    final failureOrSuccess = await repository.deleteAllAchatPagnes();

    failureOrSuccess.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            failureOrSuccessOption: some(left(failure)),
          ),
        );
      },
      (unit) {
        emit(
          state.copyWith(
            isLoading: false,
            failureOrSuccessOption: some(right(unit)),
          ),
        );
      },
    );
  }

  void getAchatPagne(GetAchatPagne event, Emitter<AchatPagneState> emit) async {
    emit(state.copyWith(isLoading: true, failureOrSuccessOption: none()));
    final failureOrSuccess = await repository.getAchatPagne(
      identifiant: event.identifiant,
    );

    failureOrSuccess.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            action: null,
            failureOrSuccessOption: some(left(failure)),
          ),
        );
      },
      (achatPagne) {
        emit(
          state.copyWith(
            isLoading: false,
            action: AchatPagneAction.get,
            failureOrSuccessOption: some(right(unit)),
            currentAchatPagne: achatPagne,
          ),
        );
        emit(
          state.copyWith(
            isLoading: false,
            action: null,
            failureOrSuccessOption: none(),
            currentAchatPagne: null,
          ),
        );
      },
    );
  }
}
