import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:madeb75/src/application/achat_pagne/achat_pagne_bloc.dart';
import 'package:madeb75/src/domain/achat_pagne/models/achat_pagne.dart';
import 'package:madeb75/src/domain/vicariats/models/vicariat.dart';
import 'package:madeb75/src/presentation/_commons/constance/app_constance.dart';
import 'package:madeb75/src/presentation/_commons/helpers/unique_identifiant.dart';
import 'package:madeb75/src/presentation/_commons/theming/app_size.dart';
import 'package:madeb75/src/presentation/_commons_widgets/app_decoration.dart';
import 'package:madeb75/src/presentation/_commons_widgets/button_widget.dart';
import 'package:madeb75/src/presentation/_commons_widgets/global_bottom_sheet.dart';

bottomSheetAchatPagne({
  required BuildContext context,
  required Vicariat vicariat,
  AchatPagne? achatPagne,
}) {
  GlobalBottomSheet.show(
    context: context,
    maxHeight: MediaQuery.of(context).size.height * 0.7,
    widget: AddEditAchatPagneWidget(vicariat: vicariat, achatPagne: achatPagne),
  );
}

class AddEditAchatPagneWidget extends StatefulWidget {
  final Vicariat vicariat;
  final AchatPagne? achatPagne;
  const AddEditAchatPagneWidget({
    super.key,
    required this.vicariat,
    this.achatPagne,
  });

  @override
  State<AddEditAchatPagneWidget> createState() =>
      _AddEditAchatPagneWidgetState();
}

class _AddEditAchatPagneWidgetState extends State<AddEditAchatPagneWidget> {
  TextEditingController nomController = TextEditingController();
  TextEditingController prenomController = TextEditingController();
  TextEditingController titreController = TextEditingController();
  TextEditingController paroisseController = TextEditingController();

  AchatPagne achatPagne = AchatPagne(identifiant: '', vicariatCode: '');

  @override
  void initState() {
    init();
    super.initState();
  }

  init() {
    if (widget.achatPagne != null) {
      setState(() {
        nomController.text = widget.achatPagne!.nom ?? '';
        prenomController.text = widget.achatPagne!.prenom ?? '';
        titreController.text = widget.achatPagne!.titre ?? '';
        paroisseController.text = widget.achatPagne!.paroisse ?? '';
        achatPagne = widget.achatPagne!;
      });
    } else {
      int count =
          BlocProvider.of<AchatPagneBloc>(context).state.vicariatAchatPagnes!
              .where(
                (element) =>
                    element.vicariatCode == widget.vicariat.authCode.toString(),
              )
              .length +
          1;
      String identifiant = generateUniqueIdentitant(
        identifiants:
            BlocProvider.of<AchatPagneBloc>(context).state.vicariatAchatPagnes!
                .map((e) => e.identifiant ?? '')
                .toList(),
        count: count,
        identificationCode: widget.vicariat.identificationCode!,
      );
      setState(() {
        achatPagne = AchatPagne(
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
    return BlocBuilder<AchatPagneBloc, AchatPagneState>(
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
                      '${widget.achatPagne != null ? 'Modifier' : 'Ajouter'} un achat',
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
                  initialValue: widget.achatPagne?.nom,
                  decoration: appInputDecoration(
                    hintText: 'Ex: Bossou',
                    context: context,
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      nomController.text = value ?? '';
                      achatPagne.nom = value;
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
                  initialValue: widget.achatPagne?.prenom,
                  decoration: appInputDecoration(
                    hintText: 'Ex: Paul',
                    context: context,
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      prenomController.text = value ?? '';
                      achatPagne.prenom = value;
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
                  initialValue: widget.achatPagne?.paroisse,
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
                      achatPagne.paroisse = value;
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
                  initialValue: widget.achatPagne?.titre,
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
                      achatPagne.titre = value;
                    });
                  },
                  items:
                      legionTitre.map((e) {
                        return DropdownMenuItem(value: e, child: Text(e));
                      }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  'Nombre de mètre : ',
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
                  name: 'metre',
                  initialValue: widget.achatPagne?.prenom,
                  decoration: appInputDecoration(
                    hintText: '',
                    context: context,
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      achatPagne.nombrePagne = int.tryParse(value ?? '') ?? 0;
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
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ButtonWidget(
                  onpressed:
                      achatPagne.isValid()
                          ? (() {
                            if (widget.achatPagne == null) {
                              context.read<AchatPagneBloc>().add(
                                SaveAchatPagne(achatPagne: achatPagne),
                              );
                            } else {
                              context.read<AchatPagneBloc>().add(
                                UpdateAchatPagne(achatPagne: achatPagne),
                              );
                            }
                          })
                          : null,
                  title: widget.achatPagne != null ? 'Modifier' : 'Ajouter',
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
