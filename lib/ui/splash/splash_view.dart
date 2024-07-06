import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:por_maria_app/commons/initial_background_view.dart';
// import 'package:por_maria_app/pages/home_pages/home_group_pages/home_page.dart';
// import 'package:por_maria_app/ui/pages/home_pages/home_view.dart';
import 'package:por_maria_app/ui/home/main_screen.dart';
import 'package:por_maria_app/ui/profile_verify/profile_verify_view.dart';
// import 'package:por_maria_app/ui/sing_in/sign_in_page.dart';
import 'package:por_maria_app/ui/sing_in/sign_in_view.dart';
import 'package:por_maria_app/ui/splash/splash_cubit.dart';
import 'package:por_maria_app/utils/navigator_utils.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('entro aqui splash');
    return BlocProvider(
      create: (context) => SplashCubit(context.read())..init(),
      child: BlocListener<SplashCubit, SplashState>(
        listener: (context, snapshot) {
          print('splash view snapshot esta en $snapshot');
          if (snapshot == SplashState.none) {
            // pushAndReplaceToPage(context, SignInPage());
            pushAndReplaceToPage(context, SignInView());
          } else if (snapshot == SplashState.existing_user) {
            // pushAndReplaceToPage(context, MainScreenPage());
            // pushToPage(context, MainScreenPage());
            // popAndPush(context, MainScreenPage());
            // popPushAndReplaceToPage(context, MainScreenPage());
            popAllAndPush(context, MainScreenPage());
            popAllAndPushWithRoute(context, MainScreenPage(), "/main");
            // pushAndReplaceToPage(context, HomeView());
          } else {
            pushAndReplaceToPage(context, ProfileVerifyView());
          }
        },
        child: Scaffold(
          backgroundColor: Colors.red,
          body: Stack(
            children: [
              InitialBackgroundView(),
              Center(
                child: Hero(
                  tag: 'logo_hero',
                  child: Image.asset(
                    'assets/logo.png',
                    height: 100,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
