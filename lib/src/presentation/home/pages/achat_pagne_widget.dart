import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madeb75/src/application/achat_pagne/achat_pagne_bloc.dart';
import 'package:madeb75/src/domain/achat_pagne/models/achat_pagne.dart';
import 'package:madeb75/src/domain/vicariats/models/vicariat.dart';
import 'package:madeb75/src/presentation/_commons/theming/app_color.dart';
import 'package:madeb75/src/presentation/_commons/theming/app_size.dart';
import 'package:madeb75/src/presentation/_commons_widgets/global_dialog_widget.dart';
import 'package:madeb75/src/presentation/_commons_widgets/loading_widget.dart';
import 'package:madeb75/src/presentation/_commons_widgets/my_toast.dart';
import 'package:madeb75/src/presentation/home/sheets/bottom_sheet_achat_pagne.dart';

class AchatPagnesWidget extends StatefulWidget {
  final Vicariat vicariat;
  const AchatPagnesWidget({super.key, required this.vicariat});

  @override
  State<AchatPagnesWidget> createState() => _AchatPagnesWidgetState();
}

class _AchatPagnesWidgetState extends State<AchatPagnesWidget> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AchatPagneBloc>(context).add(
      AchatPagneEvent.getAllAchatPagnesByVicariat(
        vicariatCode: widget.vicariat.authCode.toString(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AchatPagneBloc, AchatPagneState>(
      listener: (context, state) {
        if (state.action == AchatPagneAction.add) {
          successToast(context: context, msg: "AchatPagne ajouté avec succès");
          AutoRouter.of(context).pop();
        }
        if (state.action == AchatPagneAction.update) {
          successToast(context: context, msg: "AchatPagne modifié avec succès");
          AutoRouter.of(context).pop();
        }
        if (state.action == AchatPagneAction.delete) {
          successToast(
            context: context,
            msg: "AchatPagne supprimé avec succès",
          );
          AutoRouter.of(context).pop();
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child:
              state.vicariatAchatPagnes == null
                  ? Center(child: LoadingWidget())
                  : ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.vicariatAchatPagnes!.length,
                    itemBuilder: (context, index) {
                      AchatPagne achatPagne = state.vicariatAchatPagnes![index];
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
                                '${achatPagne.identifiant}',
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
                                '${achatPagne.nom} ${achatPagne.prenom}',
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
                                '${achatPagne.titre}',
                                style: TextStyle(
                                  fontSize: AppSize.getSize(
                                    context: context,
                                    mobileValue: 12,
                                    tabletValue: 14,
                                  ),
                                ),
                              ),
                              Text(
                                '${achatPagne.paroisse}',
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
                                  bottomSheetAchatPagne(
                                    context: context,
                                    vicariat: widget.vicariat,
                                    achatPagne: achatPagne,
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
                                        'Voulez-vous vraiment supprimer ce achatPagne ?',
                                    yesText: 'Oui',
                                    noText: 'Non',
                                    onTap: () {
                                      BlocProvider.of<AchatPagneBloc>(
                                        context,
                                      ).add(
                                        AchatPagneEvent.deleteAchatPagne(
                                          achatPagne: achatPagne,
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
