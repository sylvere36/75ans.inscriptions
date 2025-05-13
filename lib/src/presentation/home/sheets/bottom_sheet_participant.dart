import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:madeb75/src/domain/vicariats/models/vicariat.dart';
import 'package:madeb75/src/presentation/_commons/theming/app_size.dart';
import 'package:madeb75/src/presentation/_commons_widgets/app_decoration.dart';
import 'package:madeb75/src/presentation/_commons_widgets/button_widget.dart';
import 'package:madeb75/src/presentation/_commons_widgets/global_bottom_sheet.dart';

bottomSheetParticipant({
  required BuildContext context,
  required Vicariat vicariat,
}) {
  GlobalBottomSheet.show(
    context: context,
    maxHeight: MediaQuery.of(context).size.height * 0.7,
    widget: AddEditParticipantWidget(vicariat: vicariat),
  );
}

class AddEditParticipantWidget extends StatefulWidget {
  final Vicariat? vicariat;
  const AddEditParticipantWidget({super.key, required this.vicariat});

  @override
  State<AddEditParticipantWidget> createState() =>
      _AddEditParticipantWidgetState();
}

class _AddEditParticipantWidgetState extends State<AddEditParticipantWidget> {
  TextEditingController nomController = TextEditingController();
  TextEditingController prenomController = TextEditingController();
  TextEditingController titreController = TextEditingController();
  TextEditingController paroisseController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: SizedBox(
                    width: 100,
                    height: 10,
                    child: Material(
                      color: Colors.grey[400],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(''),
                    ),
                  ),
                ),
                Text(
                  'Ajouter un participant',
                  style: TextStyle(
                    fontSize: AppSize.getSize(
                      context: context,
                      mobileValue: 18,
                      tabletValue: 22,
                    ),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              'Nom : ',
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
            padding: const EdgeInsets.all(8.0),
            child: FormBuilderTextField(
              name: 'nom',
              decoration: appInputDecoration(
                hintText: 'Ex: Bossou',
                context: context,
              ),
              keyboardType: TextInputType.number,
              style: TextStyle(
                fontSize: AppSize.getSize(
                  context: context,
                  mobileValue: 14,
                  tabletValue: 17,
                ),
              ),
              obscureText: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              'Prénom(s) : ',
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
            padding: const EdgeInsets.all(8.0),
            child: FormBuilderTextField(
              name: 'prenom',
              decoration: appInputDecoration(
                hintText: 'Ex: Paul',
                context: context,
              ),
              keyboardType: TextInputType.number,
              style: TextStyle(
                fontSize: AppSize.getSize(
                  context: context,
                  mobileValue: 14,
                  tabletValue: 17,
                ),
              ),
              obscureText: false,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              'Paroisse(s) : ',
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
            padding: const EdgeInsets.all(8.0),
            child: FormBuilderDropdown<String>(
              name: 'paroisse',
              decoration: appInputDecoration(
                hintText: 'Paroisse',
                context: context,
              ),
              style: TextStyle(
                color: Colors.black,
                fontSize: AppSize.getSize(
                  context: context,
                  mobileValue: 14,
                  tabletValue: 17,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  paroisseController.text = value ?? '';
                });
              },
              items:
                  widget.vicariat!.paroisses?.map((e) {
                    return DropdownMenuItem(
                      value: e.name,
                      child: Text(e.name ?? ''),
                    );
                  }).toList() ??
                  [],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              'Titre(s) : ',
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
            padding: const EdgeInsets.all(8.0),
            child: FormBuilderDropdown<String>(
              name: 'titre',
              decoration: appInputDecoration(
                hintText: 'Titre',
                context: context,
              ),
              style: TextStyle(
                color: Colors.black,
                fontSize: AppSize.getSize(
                  context: context,
                  mobileValue: 14,
                  tabletValue: 17,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  titreController.text = value ?? '';
                });
              },
              items:
                  [
                    "1ere Légion(Aiglon/Avette)",
                    "2ème Légion(Coeur d'or/Souriante)",
                    "3ème Légion(Ardent/Rayonnante)",
                    "4ème Légion(Entraineur/Conquérante)",
                    "Animateur(trice)",
                    "Jeune Accompagnateur(trice)",
                    "Accompagnateur(trice)",
                  ].map((e) {
                    return DropdownMenuItem(value: e, child: Text(e));
                  }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ButtonWidget(
              onpressed: (() {}),
              title: 'Ajouter',
              textColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
