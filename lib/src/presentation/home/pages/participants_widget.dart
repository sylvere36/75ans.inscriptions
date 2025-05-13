import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madeb75/src/application/participant/participant_bloc.dart';
import 'package:madeb75/src/domain/participant/models/participant.dart';
import 'package:madeb75/src/domain/vicariats/models/vicariat.dart';
import 'package:madeb75/src/presentation/_commons/theming/app_color.dart';
import 'package:madeb75/src/presentation/_commons/theming/app_size.dart';
import 'package:madeb75/src/presentation/_commons_widgets/global_dialog_widget.dart';
import 'package:madeb75/src/presentation/_commons_widgets/loading_widget.dart';
import 'package:madeb75/src/presentation/_commons_widgets/my_toast.dart';
import 'package:madeb75/src/presentation/home/sheets/bottom_sheet_participant.dart';

class ParticipantsWidget extends StatefulWidget {
  final Vicariat vicariat;
  const ParticipantsWidget({super.key, required this.vicariat});

  @override
  State<ParticipantsWidget> createState() => _ParticipantsWidgetState();
}

class _ParticipantsWidgetState extends State<ParticipantsWidget> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ParticipantBloc>(context).add(
      ParticipantEvent.getAllParticipantsByVicariat(
        vicariatCode: widget.vicariat.authCode.toString(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ParticipantBloc, ParticipantState>(
      listener: (context, state) {
        if (state.action == ParticipantAction.add) {
          successToast(context: context, msg: "Participant ajouté avec succès");
          AutoRouter.of(context).pop();
        }
        if (state.action == ParticipantAction.update) {
          successToast(
            context: context,
            msg: "Participant modifié avec succès",
          );
          AutoRouter.of(context).pop();
        }
        if (state.action == ParticipantAction.delete) {
          successToast(
            context: context,
            msg: "Participant supprimé avec succès",
          );
          AutoRouter.of(context).pop();
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child:
              state.vicariatParticipants == null
                  ? Center(child: LoadingWidget())
                  : ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.vicariatParticipants!.length,
                    itemBuilder: (context, index) {
                      Participant participant =
                          state.vicariatParticipants![index];
                      return Card(
                        elevation: 1.0,
                        color: Colors.white,
                        child: ListTile(
                          leading: const Icon(Icons.person),
                          title: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${participant.identifiant}',
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontSize: AppSize.getSize(
                                    context: context,
                                    mobileValue: 12,
                                    tabletValue: 14,
                                  ),
                                ),
                              ),
                              Text(
                                '${participant.nom} ${participant.prenom}',
                                style: TextStyle(
                                  fontSize: AppSize.getSize(
                                    context: context,
                                    mobileValue: 14,
                                    tabletValue: 16,
                                  ),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '${participant.titre}',
                                style: TextStyle(
                                  fontSize: AppSize.getSize(
                                    context: context,
                                    mobileValue: 12,
                                    tabletValue: 14,
                                  ),
                                ),
                              ),
                              Text(
                                '${participant.paroisse}',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: AppSize.getSize(
                                    context: context,
                                    mobileValue: 12,
                                    tabletValue: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {
                                  bottomSheetParticipant(
                                    context: context,
                                    vicariat: widget.vicariat,
                                    participant: participant,
                                  );
                                },
                                icon: const Icon(Icons.edit),
                              ),
                              IconButton(
                                onPressed: () {
                                  customShowDialog(
                                    context: context,
                                    title: 'Suppression',
                                    description:
                                        'Voulez-vous vraiment supprimer ce participant ?',
                                    yesText: 'Oui',
                                    noText: 'Non',
                                    onTap: () {
                                      BlocProvider.of<ParticipantBloc>(
                                        context,
                                      ).add(
                                        ParticipantEvent.deleteParticipant(
                                          participant: participant,
                                        ),
                                      );
                                    },
                                  );
                                },
                                icon: const Icon(Icons.delete),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
        );
      },
    );
  }
}
