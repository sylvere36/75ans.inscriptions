import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:madeb75/src/application/atelier/atelier_bloc.dart';
import 'package:madeb75/src/domain/atelier/models/atelier.dart';
import 'package:madeb75/src/domain/vicariats/models/vicariat.dart';
import 'package:madeb75/src/presentation/_commons/constance/app_constance.dart';
import 'package:madeb75/src/presentation/_commons/helpers/unique_identifiant.dart';
import 'package:madeb75/src/presentation/_commons/theming/app_size.dart';
import 'package:madeb75/src/presentation/_commons_widgets/app_decoration.dart';
import 'package:madeb75/src/presentation/_commons_widgets/button_widget.dart';
import 'package:madeb75/src/presentation/_commons_widgets/global_bottom_sheet.dart';

bottomSheetAtelier({
  required BuildContext context,
  required Vicariat vicariat,
  Atelier? atelier,
}) {
  GlobalBottomSheet.show(
    context: context,
    maxHeight: MediaQuery.of(context).size.height * 0.7,
    widget: AddEditAtelierWidget(vicariat: vicariat, atelier: atelier),
  );
}

class AddEditAtelierWidget extends StatefulWidget {
  final Vicariat vicariat;
  final Atelier? atelier;
  const AddEditAtelierWidget({super.key, required this.vicariat, this.atelier});

  @override
  State<AddEditAtelierWidget> createState() => _AddEditAtelierWidgetState();
}

class _AddEditAtelierWidgetState extends State<AddEditAtelierWidget> {
  TextEditingController nomController = TextEditingController();
  TextEditingController prenomController = TextEditingController();
  TextEditingController titreController = TextEditingController();
  TextEditingController paroisseController = TextEditingController();

  Atelier atelier = Atelier(identifiant: '', vicariatCode: '');

  @override
  void initState() {
    init();
    super.initState();
  }

  init() {
    if (widget.atelier != null) {
      setState(() {
        nomController.text = widget.atelier!.nom ?? '';
        prenomController.text = widget.atelier!.prenom ?? '';
        titreController.text = widget.atelier!.titre ?? '';
        paroisseController.text = widget.atelier!.paroisse ?? '';
        atelier = widget.atelier!;
      });
    } else {
      int count =
          BlocProvider.of<AtelierBloc>(context).state.vicariatAteliers!
              .where(
                (element) =>
                    element.vicariatCode == widget.vicariat.authCode.toString(),
              )
              .length +
          1;
      String identifiant = generateUniqueIdentitant(
        identifiants:
            BlocProvider.of<AtelierBloc>(
              context,
            ).state.vicariatAteliers!.map((e) => e.identifiant ?? '').toList(),
        count: count,
        identificationCode: widget.vicariat.identificationCode!,
      );
      setState(() {
        atelier = Atelier(
          identifiant: identifiant,
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
    return BlocBuilder<AtelierBloc, AtelierState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          color: Colors.white,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
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
                          '${widget.atelier != null ? 'Modifier' : 'Ajouter'} un enfant',
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
                      initialValue: widget.atelier?.nom,
                      decoration: appInputDecoration(
                        hintText: 'Ex: Bossou',
                        context: context,
                      ),
                      keyboardType: TextInputType.text,
                      onChanged: (value) {
                        setState(() {
                          nomController.text = value ?? '';
                          atelier.nom = value;
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
                      initialValue: widget.atelier?.prenom,
                      decoration: appInputDecoration(
                        hintText: 'Ex: Paul',
                        context: context,
                      ),
                      keyboardType: TextInputType.text,
                      onChanged: (value) {
                        setState(() {
                          prenomController.text = value ?? '';
                          atelier.prenom = value;
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
                      initialValue: widget.atelier?.paroisse,
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
                          atelier.paroisse = value;
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
                      initialValue: widget.atelier?.titre,
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
                          atelier.titre = value;
                        });
                      },
                      items:
                          deuxfirstLegion.map((e) {
                            return DropdownMenuItem(value: e, child: Text(e));
                          }).toList(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ButtonWidget(
                      onpressed:
                          atelier.isValid()
                              ? (() {
                                if (widget.atelier == null) {
                                  context.read<AtelierBloc>().add(
                                    SaveAtelier(atelier: atelier),
                                  );
                                } else {
                                  context.read<AtelierBloc>().add(
                                    UpdateAtelier(atelier: atelier),
                                  );
                                }
                              })
                              : null,
                      title: widget.atelier != null ? 'Modifier' : 'Ajouter',
                      loading: state.isLoading,
                      textColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
