import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:madeb75/src/domain/_commons/global_failure.dart';
import 'package:madeb75/src/domain/atelier/i_atelier_repository.dart';
import 'package:madeb75/src/domain/atelier/models/atelier.dart';

part 'atelier_event.dart';
part 'atelier_state.dart';
part 'atelier_bloc.freezed.dart';

class AtelierBloc extends Bloc<AtelierEvent, AtelierState> {
  final IAtelierRepository repository;
  AtelierBloc({required this.repository}) : super(AtelierState.initial()) {
    on<AtelierEvent>((event, emit) {});
    on<GetAllAteliers>(getAllAteliers);
    on<GetAtelier>(getAtelier);
    on<SaveAtelier>(saveAtelier);
    on<DeleteAtelier>(deleteAtelier);
    on<UpdateAtelier>(updateAtelier);
    on<DeleteAllAteliers>(deleteAllAteliers);
    on<GetAllAteliersByVicariat>(getAllAteliersByVicariat);
  }

  void getAllAteliers(GetAllAteliers event, Emitter<AtelierState> emit) async {
    emit(state.copyWith(isLoading: true, failureOrSuccessOption: none()));
    final failureOrSuccess = await repository.getAllAteliers();

    failureOrSuccess.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            failureOrSuccessOption: some(left(failure)),
          ),
        );
      },
      (ateliers) {
        emit(
          state.copyWith(
            isLoading: false,
            failureOrSuccessOption: some(right(unit)),
            ateliers: ateliers,
          ),
        );
      },
    );
  }

  void getAllAteliersByVicariat(
    GetAllAteliersByVicariat event,
    Emitter<AtelierState> emit,
  ) async {
    log("getAllAteliersByVicariat");
    emit(state.copyWith(isLoading: true, failureOrSuccessOption: none()));
    final failureOrSuccess = await repository.getAllAteliersByVicariats(
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
      (ateliers) {
        ateliers.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
        emit(
          state.copyWith(
            isLoading: false,
            failureOrSuccessOption: some(right(unit)),
            vicariatAteliers: ateliers,
          ),
        );
      },
    );
  }

  void saveAtelier(SaveAtelier event, Emitter<AtelierState> emit) async {
    emit(state.copyWith(isLoading: true, failureOrSuccessOption: none()));
    final failureOrSuccess = await repository.saveAtelier(
      atelier: event.atelier,
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
          GetAllAteliersByVicariat(vicariatCode: event.atelier.vicariatCode!),
        );
        emit(
          state.copyWith(
            isLoading: false,
            action: AtelierAction.add,
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

  void deleteAtelier(DeleteAtelier event, Emitter<AtelierState> emit) async {
    emit(state.copyWith(isLoading: true, failureOrSuccessOption: none()));
    final failureOrSuccess = await repository.deleteAtelier(
      identifiant: event.atelier.identifiant!,
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
          GetAllAteliersByVicariat(vicariatCode: event.atelier.vicariatCode!),
        );
        emit(
          state.copyWith(
            isLoading: false,
            action: AtelierAction.delete,
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

  void updateAtelier(UpdateAtelier event, Emitter<AtelierState> emit) async {
    emit(state.copyWith(isLoading: true, failureOrSuccessOption: none()));
    final failureOrSuccess = await repository.updateAtelier(
      atelier: event.atelier,
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
            action: AtelierAction.update,
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

  void deleteAllAteliers(
    DeleteAllAteliers event,
    Emitter<AtelierState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, failureOrSuccessOption: none()));
    final failureOrSuccess = await repository.deleteAllAteliers();

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

  void getAtelier(GetAtelier event, Emitter<AtelierState> emit) async {
    emit(state.copyWith(isLoading: true, failureOrSuccessOption: none()));
    final failureOrSuccess = await repository.getAtelier(
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
      (atelier) {
        emit(
          state.copyWith(
            isLoading: false,
            action: AtelierAction.get,
            failureOrSuccessOption: some(right(unit)),
            currentAtelier: atelier,
          ),
        );
        emit(
          state.copyWith(
            isLoading: false,
            action: null,
            failureOrSuccessOption: none(),
            currentAtelier: null,
          ),
        );
      },
    );
  }
}
