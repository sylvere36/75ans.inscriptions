import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:madeb75/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:madeb75/src/application/achat_pagne/achat_pagne_bloc.dart';
import 'package:madeb75/src/application/atelier/atelier_bloc.dart';
import 'package:madeb75/src/application/participant/participant_bloc.dart';
import 'package:madeb75/src/domain/vicariats/models/vicariat.dart';
import 'package:madeb75/src/infrastructure/_commons/network/user_session.dart';
import 'package:madeb75/src/presentation/_commons/route/app_router.gr.dart';
import 'package:madeb75/src/presentation/_commons/theming/app_color.dart';
import 'package:madeb75/src/presentation/_commons/theming/app_size.dart';
import 'package:madeb75/src/presentation/_commons_widgets/loading_widget.dart';
import 'package:madeb75/src/presentation/home/pages/achat_pagne_widget.dart';
import 'package:madeb75/src/presentation/home/pages/atelier_widget.dart';
import 'package:madeb75/src/presentation/home/pages/participants_widget.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  static const String routeName = '/home';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Vicariat? currentVicariat;
  int currentIndex = 0;

  @override
  void initState() {
    init();
    super.initState();
  }

  init() async {
    Vicariat? vic = await UserSession().getVicariat();
    if (vic != null) {
      setState(() {
        currentVicariat = vic;
      });
    } else {
      // ignore: use_build_context_synchronously
      AutoRouter.of(context).replaceAll([LoginRoute()]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: Image.asset(Assets.icons.icon.path, height: 30, width: 30),
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
                  fontSize: AppSize.getSize(context: context, mobileValue: 14),
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                currentVicariat != null ? currentVicariat!.vicariat! : '',
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
          actions: [
            IconButton(
              onPressed: () {
                UserSession().deleteVicariat();
                context.router.replaceAll([LoginRoute()]);
              },
              icon: const Icon(Icons.logout),
            ),
          ],
          bottom: TabBar(
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            labelStyle: TextStyle(
              fontSize: AppSize.getSize(context: context, mobileValue: 12),
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: AppSize.getSize(context: context, mobileValue: 12),
              fontWeight: FontWeight.w400,
            ),
            indicatorWeight: 3.0,
            indicatorSize: TabBarIndicatorSize.label,
            indicator: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(color: AppColors.primary, width: 3.0),
              ),
            ),
            onTap:
                (value) => setState(() {
                  currentIndex = value;
                }),
            tabs: [
              Tab(
                text:
                    'Participants (${BlocProvider.of<ParticipantBloc>(context, listen: true).state.vicariatParticipants?.length ?? 0})',
              ),
              Tab(
                text:
                    'Achats Pagne (${BlocProvider.of<AchatPagneBloc>(context, listen: true).state.vicariatAchatPagnes?.length ?? 0})',
              ),
              Tab(
                text:
                    'Atelier coloriage (${BlocProvider.of<AtelierBloc>(context, listen: true).state.vicariatAteliers?.length ?? 0})',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            currentVicariat == null
                ? Center(child: LoadingWidget())
                : ParticipantsWidget(vicariat: currentVicariat!),
            currentVicariat == null
                ? Center(child: LoadingWidget())
                : AchatPagnesWidget(vicariat: currentVicariat!),
            currentVicariat == null
                ? Center(child: LoadingWidget())
                : AteliersWidget(vicariat: currentVicariat!),
          ],
        ),
      ),
    );
  }
}
