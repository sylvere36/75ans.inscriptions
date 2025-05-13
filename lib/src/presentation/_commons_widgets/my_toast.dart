import 'package:madeb75/src/domain/_commons/global_failure.dart';
import 'package:dartz/dartz.dart';

import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

errorFailureHandle({
  required BuildContext context,
  required GlobalFailure failure,
}) {
  toastification.show(
    type: ToastificationType.error,
    style: ToastificationStyle.fillColored,
    alignment: Alignment.topCenter,
    autoCloseDuration: const Duration(seconds: 3),
    description: RichText(
      text: TextSpan(
        text: failure.customMap(
          serverError: (serverError) => serverError.errorText.toString(),
          unauthorized: (unauthorized) => unauthorized.errorText.toString(),
          noNetwork: (noNetwork) => 'Error connexion',
        ),
        style: const TextStyle(color: Colors.white),
      ),
    ),
    context: context,
  );
}

successToast({required BuildContext context, required String msg}) {
  toastification.show(
    type: ToastificationType.success,
    style: ToastificationStyle.fillColored,
    autoCloseDuration: const Duration(seconds: 3),
    description: RichText(
      text: TextSpan(text: msg, style: const TextStyle(color: Colors.white)),
    ),
    context: context,
    alignment: Alignment.topCenter,
    direction: TextDirection.ltr,
  );
}

errorToast({required BuildContext context, required String msg}) {
  toastification.show(
    type: ToastificationType.error,
    style: ToastificationStyle.fillColored,
    autoCloseDuration: const Duration(seconds: 3),
    alignment: Alignment.topCenter,
    description: RichText(
      text: TextSpan(text: msg, style: const TextStyle(color: Colors.white)),
    ),
    context: context,
  );
}

handleGlobalExceptionToast({
  required BuildContext context,
  required Option<Either<GlobalFailure, Unit>> failureOrSuccessOption,
}) {
  if (failureOrSuccessOption.isSome()) {
    String? error = failureOrSuccessOption.fold(
      () => null,
      (a) => a.fold(
        (l) => l.customMap(
          serverError: (val) {
            return val.errorText;
          },
          unauthorized: (val) => val.errorText,
          noNetwork: (val) => 'Problème de connexion',
        ),
        (r) => null,
      ),
    );
    if (error != null) {
      errorToast(context: context, msg: error);
    }
  }
}

getTextFromGlobalException({
  required Option<Either<GlobalFailure, Unit>> failureOrSuccessOption,
}) {
  return failureOrSuccessOption.fold(
    () => null,
    (a) => a.fold(
      (l) => l.customMap(
        serverError: (val) {
          return val.errorText;
        },
        unauthorized: (val) => val.errorText,
        noNetwork: (val) => 'Problème de connexion',
      ),
      (r) => null,
    ),
  );
}
