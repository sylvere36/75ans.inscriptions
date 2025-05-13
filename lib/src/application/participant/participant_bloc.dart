import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:madeb75/src/domain/_commons/global_failure.dart';
import 'package:madeb75/src/domain/participant/i_participant_repository.dart';
import 'package:madeb75/src/domain/participant/models/participant.dart';

part 'participant_event.dart';
part 'participant_state.dart';
part 'participant_bloc.freezed.dart';

class ParticipantBloc extends Bloc<ParticipantEvent, ParticipantState> {
  final IParticipantRepository repository;
  ParticipantBloc({required this.repository})
    : super(ParticipantState.initial()) {
    on<ParticipantEvent>((event, emit) {});
    on<GetAllParticipants>(getAllParticipants);
    on<GetParticipant>(getParticipant);
    on<SaveParticipant>(saveParticipant);
    on<DeleteParticipant>(deleteParticipant);
    on<UpdateParticipant>(updateParticipant);
    on<DeleteAllParticipants>(deleteAllParticipants);
    on<GetAllParticipantsByVicariat>(getAllParticipantsByVicariat);
  }

  void getAllParticipants(
    GetAllParticipants event,
    Emitter<ParticipantState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, failureOrSuccessOption: none()));
    final failureOrSuccess = await repository.getAllParticipants();

    failureOrSuccess.fold(
      (failure) {
        emit(
          state.copyWith(
            isLoading: false,
            failureOrSuccessOption: some(left(failure)),
          ),
        );
      },
      (participants) {
        emit(
          state.copyWith(
            isLoading: false,
            failureOrSuccessOption: some(right(unit)),
            participants: participants,
          ),
        );
      },
    );
  }

  void getAllParticipantsByVicariat(
    GetAllParticipantsByVicariat event,
    Emitter<ParticipantState> emit,
  ) async {
    log("getAllParticipantsByVicariat");
    emit(state.copyWith(isLoading: true, failureOrSuccessOption: none()));
    final failureOrSuccess = await repository.getAllParticipantsByVicariats(
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
      (participants) {
        participants.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
        emit(
          state.copyWith(
            isLoading: false,
            failureOrSuccessOption: some(right(unit)),
            vicariatParticipants: participants,
          ),
        );
      },
    );
  }

  void saveParticipant(
    SaveParticipant event,
    Emitter<ParticipantState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, failureOrSuccessOption: none()));
    final failureOrSuccess = await repository.saveParticipant(
      participant: event.participant,
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
          GetAllParticipantsByVicariat(
            vicariatCode: event.participant.vicariatCode!,
          ),
        );
        emit(
          state.copyWith(
            isLoading: false,
            action: ParticipantAction.add,
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

  void deleteParticipant(
    DeleteParticipant event,
    Emitter<ParticipantState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, failureOrSuccessOption: none()));
    final failureOrSuccess = await repository.deleteParticipant(
      identifiant: event.participant.identifiant!,
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
          GetAllParticipantsByVicariat(
            vicariatCode: event.participant.vicariatCode!,
          ),
        );
        emit(
          state.copyWith(
            isLoading: false,
            action: ParticipantAction.delete,
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

  void updateParticipant(
    UpdateParticipant event,
    Emitter<ParticipantState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, failureOrSuccessOption: none()));
    final failureOrSuccess = await repository.updateParticipant(
      participant: event.participant,
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
            action: ParticipantAction.update,
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

  void deleteAllParticipants(
    DeleteAllParticipants event,
    Emitter<ParticipantState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, failureOrSuccessOption: none()));
    final failureOrSuccess = await repository.deleteAllParticipants();

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

  void getParticipant(
    GetParticipant event,
    Emitter<ParticipantState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, failureOrSuccessOption: none()));
    final failureOrSuccess = await repository.getParticipant(
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
      (participant) {
        emit(
          state.copyWith(
            isLoading: false,
            action: ParticipantAction.get,
            failureOrSuccessOption: some(right(unit)),
            currentParticipant: participant,
          ),
        );
        emit(
          state.copyWith(
            isLoading: false,
            action: null,
            failureOrSuccessOption: none(),
            currentParticipant: null,
          ),
        );
      },
    );
  }
}
