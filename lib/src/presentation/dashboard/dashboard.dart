import 'package:auto_route/auto_route.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madeb75/gen/assets.gen.dart';
import 'package:madeb75/src/application/achat_pagne/achat_pagne_bloc.dart';
import 'package:madeb75/src/application/atelier/atelier_bloc.dart';
import 'package:madeb75/src/application/participant/participant_bloc.dart';
import 'package:madeb75/src/presentation/_commons/helpers/excel_helper.dart';
import 'package:madeb75/src/presentation/_commons/helpers/participant_helper.dart';
import 'package:madeb75/src/presentation/_commons/theming/app_color.dart';
import 'package:madeb75/src/presentation/_commons/theming/app_size.dart';
import 'package:madeb75/src/presentation/_commons_widgets/loading_widget.dart';
import 'package:madeb75/src/presentation/home/pages/achat_pagne_widget.dart';

@RoutePage()
class DashboardPage extends StatefulWidget {
  static const routeName = '/dashboard';
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    BlocProvider.of<ParticipantBloc>(
      context,
    ).add(ParticipantEvent.getAllParticipants());
    BlocProvider.of<AchatPagneBloc>(
      context,
    ).add(AchatPagneEvent.getAllAchatPagnes());
    BlocProvider.of<AtelierBloc>(context).add(AtelierEvent.getAllAteliers());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ParticipantBloc, ParticipantState>(
      builder: (context, state) {
        return BlocBuilder<AchatPagneBloc, AchatPagneState>(
          builder: (context, stateAchatPagne) {
            return BlocBuilder<AtelierBloc, AtelierState>(
              builder: (context, stateAtelier) {
                return Scaffold(
                  appBar: AppBar(
                    leading: Image.asset(
                      Assets.icons.icon.path,
                      height: 30,
                      width: 30,
                    ),
                    backgroundColor: Colors.white,
                    shadowColor: Colors.white,
                    surfaceTintColor: Colors.white,
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '75 ans et 4ème édition JDM',
                          style: TextStyle(
                            fontSize: AppSize.getSize(
                              context: context,
                              mobileValue: 14,
                            ),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Dashboard',
                          style: TextStyle(
                            fontSize: AppSize.getSize(
                              context: context,
                              mobileValue: 12,
                              tabletValue: 16,
                            ),
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    centerTitle: true,
                    elevation: 1.0,
                  ),
                  body:
                      state.participants == null ||
                              state.vicariats == null ||
                              stateAchatPagne.achatPagnes == null ||
                              stateAtelier.ateliers == null
                          ? Center(child: LoadingWidget())
                          : Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                ),
                                child: Text(
                                  'Nombre participant par vicariats',
                                  style: TextStyle(
                                    fontSize: AppSize.getSize(
                                      context: context,
                                      mobileValue: 14,
                                      tabletValue: 16,
                                    ),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),

                              SizedBox(
                                height: 600,
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: DataTable2(
                                    columnSpacing: 12,
                                    horizontalMargin: 12,
                                    minWidth: 600,
                                    columns: [
                                      DataColumn2(label: Text('Vicariats')),
                                      DataColumn(
                                        label: Text('Nombre de participant'),
                                        numeric: true,
                                      ),
                                      DataColumn(
                                        label: Text('Exporter Participant'),
                                      ),
                                      DataColumn(
                                        label: Text('Metre/piece'),
                                        numeric: true,
                                      ),
                                      DataColumn(
                                        label: Text('Exporter Achat Pagne'),
                                      ),
                                      DataColumn(
                                        label: Text('Exporter Enfant Atelier'),
                                      ),
                                    ],
                                    rows:
                                        groupDataByVicariat(
                                              vicariats: state.vicariats!,
                                              participants: state.participants!,
                                              achatPagnes:
                                                  stateAchatPagne.achatPagnes!,
                                              ateliers: stateAtelier.ateliers!,
                                            )
                                            .map(
                                              (val) => DataRow(
                                                cells: [
                                                  DataCell(
                                                    Text(val['vicariat']),
                                                  ),
                                                  DataCell(
                                                    Text(
                                                      val['participants'].length
                                                          .toString(),
                                                    ),
                                                  ),
                                                  DataCell(
                                                    TextButton(
                                                      onPressed: (() {
                                                        exportParticipant(
                                                          vicariat:
                                                              val['vicariat'],
                                                          participants:
                                                              val['participants'],
                                                        );
                                                      }),
                                                      child: Text(
                                                        'Exporter ',
                                                        style: TextStyle(
                                                          color:
                                                              AppColors.primary,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  DataCell(
                                                    Text(
                                                      '${getTotalMetre(val['achatPagnes'] ?? [])} m / ${(getTotalMetre(val['achatPagnes'] ?? []) / 12).toInt()} Pieces',
                                                    ),
                                                  ),
                                                  DataCell(
                                                    TextButton(
                                                      onPressed: (() {
                                                        exportAchatPagne(
                                                          vicariat:
                                                              val['vicariat'],
                                                          achatsPagnes:
                                                              val['achatPagnes'],
                                                        );
                                                      }),
                                                      child: Text(
                                                        'Exporter(${val['achatPagnes']?.length ?? 0})',
                                                        style: TextStyle(
                                                          color:
                                                              AppColors.primary,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  DataCell(
                                                    TextButton(
                                                      onPressed: (() {
                                                        exportAtelier(
                                                          vicariat:
                                                              val['vicariat'],
                                                          ateliers:
                                                              val['ateliers'],
                                                        );
                                                      }),
                                                      child: Text(
                                                        'Exporter(${val['ateliers']?.length ?? 0})',
                                                        style: TextStyle(
                                                          color:
                                                              AppColors.primary,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                            .toList(),
                                  ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8,
                                          ),
                                          child: Text(
                                            'Nombre total participants',
                                            style: TextStyle(
                                              fontSize: AppSize.getSize(
                                                context: context,
                                                mobileValue: 14,
                                                tabletValue: 16,
                                              ),
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8,
                                          ),
                                          child: Text(
                                            (state.participants?.length ?? 0)
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: AppSize.getSize(
                                                context: context,
                                                mobileValue: 16,
                                                tabletValue: 22,
                                              ),
                                              color: AppColors.primary,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                );
              },
            );
          },
        );
      },
    );
  }
}
