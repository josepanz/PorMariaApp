import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:por_maria_app/commons/initial_background_view.dart';
import 'package:por_maria_app/ui/home/main_screen.dart';
import 'package:por_maria_app/ui/profile_verify/profile_verify_view.dart';
import 'package:por_maria_app/ui/sing_in/sign_in_cubit.dart';
import 'package:por_maria_app/utils/navigator_utils.dart';

class SignInView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(context.read()),
      child:
          BlocConsumer<SignInCubit, SignInState>(listener: (context, snapshot) {
        print('signinview snapshot esta en $snapshot');
        if (snapshot == SignInState.none) {
          pushAndReplaceToPage(context, ProfileVerifyView());
        } else {
          // popAllAndPush(context, MainScreenPage());
          // pushAndReplaceToPage(context, MainScreenPage());
          popAndPush(context, MainScreenPage());
          // pushToPage(context, MainScreenPage());
          // popAllAndPush(context, HomeView());
        }
      }, builder: (context, snapshot) {
        return Scaffold(
          backgroundColor: Theme.of(context).canvasColor,
          body: Stack(children: [
            InitialBackgroundView(),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 150),
                  Hero(
                    tag: 'logo_hero',
                    child: Image.asset(
                      'assets/logo.png',
                      height: 50,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Bienvenido a\nPor Maria App',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 40),
                    child: Text(
                      'A Jesús Por Maria',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Material(
                    elevation: 2,
                    shadowColor: Colors.black45,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Theme.of(context)
                        .bottomNavigationBarTheme
                        .backgroundColor,
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            context.read<SignInCubit>().signIn();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/icon-google.png',
                                    height: 20),
                                const SizedBox(width: 15),
                                Text('Iniciar sesión con Google'),
                              ],
                            ),
                          ),
                        ),
                        // Divider(
                        //   height: 5,
                        // ),
                        // InkWell(
                        //   onTap: () {
                        //     context.read<SignInCubit>().signInAsGuest();
                        //   },
                        //   child: Padding(
                        //     padding: const EdgeInsets.all(20.0),
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.center,
                        //       children: [
                        //         Image.asset('assets/icon-google.png',
                        //             height: 20),
                        //         const SizedBox(width: 15),
                        //         Text('Login with email'),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        // Divider(
                        //   height: 5,
                        // ),
                        // InkWell(
                        //   onTap: () {
                        //     context.read<SignInCubit>().signInAsGuest();
                        //   },
                        //   child: Padding(
                        //     padding: const EdgeInsets.all(20.0),
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.center,
                        //       children: [
                        //         Image.asset('assets/icon-google.png',
                        //             height: 20),
                        //         const SizedBox(width: 15),
                        //         Text('Login as Guest'),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      '"La forma de hacer comunidad siguiendo\nel ejemplo de MARIA"',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ]),
        );
      }),
    );
  }
}
