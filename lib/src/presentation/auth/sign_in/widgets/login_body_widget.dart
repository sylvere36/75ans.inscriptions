import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:madeb75/gen/assets.gen.dart';
import 'package:madeb75/injection_container.dart';

import 'package:madeb75/src/application/auth/login/login_bloc.dart';
import 'package:madeb75/src/domain/vicariats/models/vicariat.dart';
import 'package:madeb75/src/presentation/_commons/route/app_router.gr.dart';
import 'package:madeb75/src/presentation/_commons/theming/app_color.dart';
import 'package:flutter/material.dart';
import 'package:madeb75/src/presentation/_commons/theming/app_size.dart';
import 'package:madeb75/src/presentation/_commons_widgets/app_decoration.dart';
import 'package:madeb75/src/presentation/_commons_widgets/button_widget.dart';
import 'package:madeb75/src/presentation/_commons_widgets/my_toast.dart';

class LoginBodyWidget extends StatefulWidget {
  const LoginBodyWidget({super.key});

  @override
  State<LoginBodyWidget> createState() => _LoginBodyWidgetState();
}

class _LoginBodyWidgetState extends State<LoginBodyWidget> {
  Vicariat? selectedVicariat;
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LoginBloc>()..add(LoginEvent.loadVicariats()),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.errorMessage != null) {
            errorToast(context: context, msg: state.errorMessage!);
          }

          if (state.isLoggedIn == true) {
            AutoRouter.of(context).replaceAll([HomeRoute()]);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Assets.images.logo.image(width: 200, height: 200),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Inscription pour les 75ans du MADEB',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FormBuilderDropdown<Vicariat>(
                    name: 'vicariat',
                    decoration: appInputDecoration(
                      labelText: 'Vicariat',
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
                        selectedVicariat = value;
                      });
                    },
                    items:
                        state.vicariats?.map((e) {
                          return DropdownMenuItem(
                            value: e,
                            child: Text(e.vicariat ?? ''),
                          );
                        }).toList() ??
                        [],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FormBuilderTextField(
                    name: 'password',
                    decoration: appInputDecoration(
                      labelText: 'Code d\'accès',
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
                    controller: passwordController,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ButtonWidget(
                    onpressed: (() {
                      if (selectedVicariat == null) {
                        errorToast(
                          context: context,
                          msg: 'Veuillez choisir un vicariat',
                        );
                        return;
                      }
                      BlocProvider.of<LoginBloc>(context).add(
                        Submit(
                          vicariat: selectedVicariat!,
                          code: passwordController.text,
                        ),
                      );
                    }),
                    title: 'Connexion',
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
