import 'package:auto_route/auto_route.dart';
import 'package:madeb75/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:madeb75/src/domain/vicariats/models/vicariat.dart';
import 'package:madeb75/src/infrastructure/_commons/network/user_session.dart';
import 'package:madeb75/src/presentation/_commons/theming/app_color.dart';
import 'package:madeb75/src/presentation/_commons/theming/app_size.dart';
import 'package:madeb75/src/presentation/home/sheets/bottom_sheet_participant.dart';

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
            tabs: const [
              Tab(text: 'Participants'),
              Tab(text: 'Achats Pagne'),
              Tab(text: 'Atelier coloriage'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 1.0,
                    color: Colors.white,
                    child: ListTile(
                      leading: const Icon(Icons.person),
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('ID ${index + 1}'),
                          Text('Participant ${index + 1}'),
                          Text('Saint Jean Baptiste'),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.edit),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.delete),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Icon(Icons.directions_transit),
            Icon(Icons.directions_bike),
          ],
        ),

        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            if (currentVicariat == null) return;
            if (currentIndex == 0) {
              bottomSheetParticipant(
                context: context,
                vicariat: currentVicariat!,
              );
            }
          },
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          icon: const Icon(Icons.add),
          label: const Text('Ajouter'),
        ),
      ),
    );
  }
}
