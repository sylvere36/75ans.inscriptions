import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:madeb75/src/application/participant/participant_bloc.dart';
import 'package:madeb75/src/domain/participant/models/participant.dart';
import 'package:madeb75/src/domain/vicariats/models/vicariat.dart';
import 'package:madeb75/src/presentation/_commons/theming/app_size.dart';
import 'package:madeb75/src/presentation/_commons_widgets/app_decoration.dart';
import 'package:madeb75/src/presentation/_commons_widgets/button_widget.dart';
import 'package:madeb75/src/presentation/_commons_widgets/global_bottom_sheet.dart';

bottomSheetParticipant({
  required BuildContext context,
  required Vicariat vicariat,
  Participant? participant,
}) {
  GlobalBottomSheet.show(
    context: context,
    maxHeight: MediaQuery.of(context).size.height * 0.7,
    widget: AddEditParticipantWidget(
      vicariat: vicariat,
      participant: participant,
    ),
  );
}

class AddEditParticipantWidget extends StatefulWidget {
  final Vicariat vicariat;
  final Participant? participant;
  const AddEditParticipantWidget({
    super.key,
    required this.vicariat,
    this.participant,
  });

  @override
  State<AddEditParticipantWidget> createState() =>
      _AddEditParticipantWidgetState();
}

class _AddEditParticipantWidgetState extends State<AddEditParticipantWidget> {
  TextEditingController nomController = TextEditingController();
  TextEditingController prenomController = TextEditingController();
  TextEditingController titreController = TextEditingController();
  TextEditingController paroisseController = TextEditingController();

  Participant participant = Participant(identifiant: '', vicariatCode: '');

  @override
  void initState() {
    init();
    super.initState();
  }

  init() {
    if (widget.participant != null) {
      setState(() {
        nomController.text = widget.participant!.nom ?? '';
        prenomController.text = widget.participant!.prenom ?? '';
        titreController.text = widget.participant!.titre ?? '';
        paroisseController.text = widget.participant!.paroisse ?? '';
        participant = widget.participant!;
      });
    } else {
      int count =
          BlocProvider.of<ParticipantBloc>(context).state.vicariatParticipants!
              .where(
                (element) =>
                    element.vicariatCode == widget.vicariat.authCode.toString(),
              )
              .length +
          1;
      String codeSuffix = count.toString().padLeft(3, '0');
      String identifiant = '${widget.vicariat.identificationCode}$codeSuffix';
      log('Identifiant: $identifiant');
      setState(() {
        participant = Participant(
          identifiant: '${widget.vicariat.identificationCode}$codeSuffix',
          vicariat: widget.vicariat.vicariat,
          vicariatCode: widget.vicariat.authCode.toString(),
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ParticipantBloc, ParticipantState>(
      builder: (context, state) {
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
                      '${widget.participant != null ? 'Modifier' : 'Ajouter'} un participant',
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
                  initialValue: widget.participant?.nom,
                  decoration: appInputDecoration(
                    hintText: 'Ex: Bossou',
                    context: context,
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      nomController.text = value ?? '';
                      participant.nom = value;
                    });
                  },
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
                  initialValue: widget.participant?.prenom,
                  decoration: appInputDecoration(
                    hintText: 'Ex: Paul',
                    context: context,
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      prenomController.text = value ?? '';
                      participant.prenom = value;
                    });
                  },
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
                  initialValue: widget.participant?.paroisse,
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
                      participant.paroisse = value;
                    });
                  },
                  items:
                      widget.vicariat.paroisses?.map((e) {
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
                  'Titre/Légion : ',
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
                  initialValue: widget.participant?.titre,
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
                      participant.titre = value;
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
                        "Aîné(e)/Ancien(ne)",
                        "Autre",
                      ].map((e) {
                        return DropdownMenuItem(value: e, child: Text(e));
                      }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ButtonWidget(
                  onpressed:
                      participant.isValid()
                          ? (() {
                            if (widget.participant == null) {
                              context.read<ParticipantBloc>().add(
                                SaveParticipant(participant: participant),
                              );
                            } else {
                              context.read<ParticipantBloc>().add(
                                UpdateParticipant(participant: participant),
                              );
                            }
                          })
                          : null,
                  title: widget.participant != null ? 'Modifier' : 'Ajouter',
                  loading: state.isLoading,
                  textColor: Colors.white,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
