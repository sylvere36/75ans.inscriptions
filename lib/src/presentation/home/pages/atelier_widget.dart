import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madeb75/src/application/atelier/atelier_bloc.dart';
import 'package:madeb75/src/domain/atelier/models/atelier.dart';
import 'package:madeb75/src/domain/vicariats/models/vicariat.dart';
import 'package:madeb75/src/presentation/_commons/theming/app_color.dart';
import 'package:madeb75/src/presentation/_commons/theming/app_size.dart';
import 'package:madeb75/src/presentation/_commons_widgets/global_dialog_widget.dart';
import 'package:madeb75/src/presentation/_commons_widgets/loading_widget.dart';
import 'package:madeb75/src/presentation/_commons_widgets/my_toast.dart';
import 'package:madeb75/src/presentation/home/sheets/bottom_sheet_atelier.dart';

class AteliersWidget extends StatefulWidget {
  final Vicariat vicariat;
  const AteliersWidget({super.key, required this.vicariat});

  @override
  State<AteliersWidget> createState() => _AteliersWidgetState();
}

class _AteliersWidgetState extends State<AteliersWidget> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AtelierBloc>(context).add(
      AtelierEvent.getAllAteliersByVicariat(
        vicariatCode: widget.vicariat.authCode.toString(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AtelierBloc, AtelierState>(
      listener: (context, state) {
        if (state.action == AtelierAction.add) {
          successToast(context: context, msg: "Atelier ajouté avec succès");
          AutoRouter.of(context).pop();
        }
        if (state.action == AtelierAction.update) {
          successToast(context: context, msg: "Atelier modifié avec succès");
          AutoRouter.of(context).pop();
        }
        if (state.action == AtelierAction.delete) {
          successToast(context: context, msg: "Atelier supprimé avec succès");
          AutoRouter.of(context).pop();
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child:
              state.vicariatAteliers == null
                  ? Center(child: LoadingWidget())
                  : ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.vicariatAteliers!.length,
                    itemBuilder: (context, index) {
                      Atelier atelier = state.vicariatAteliers![index];
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
                                '${atelier.identifiant}',
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
                                '${atelier.nom} ${atelier.prenom}',
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
                                '${atelier.titre}',
                                style: TextStyle(
                                  fontSize: AppSize.getSize(
                                    context: context,
                                    mobileValue: 12,
                                    tabletValue: 14,
                                  ),
                                ),
                              ),
                              Text(
                                '${atelier.paroisse}',
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
                                  bottomSheetAtelier(
                                    context: context,
                                    vicariat: widget.vicariat,
                                    atelier: atelier,
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
                                        'Voulez-vous vraiment supprimer ce atelier ?',
                                    yesText: 'Oui',
                                    noText: 'Non',
                                    onTap: () {
                                      BlocProvider.of<AtelierBloc>(context).add(
                                        AtelierEvent.deleteAtelier(
                                          atelier: atelier,
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
