import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:por_maria_app/commons/avatar_image_view.dart';
import 'package:por_maria_app/commons/loading_view.dart';
import 'package:por_maria_app/ui/home/main_screen.dart';
import 'package:por_maria_app/ui/profile_verify/profile_verify_cubit.dart';
import 'package:por_maria_app/utils/navigator_utils.dart';

class ProfileVerifyView extends StatelessWidget {
  ProfileVerifyView();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileVerifyCubit(context.read(), context.read()),
      child: BlocConsumer<ProfileVerifyCubit, ProfileState>(
          listener: (context, snapshot) {
        print('profile verify snapshot esta en $snapshot');
        if (snapshot.success) {
          // pushAndReplaceToPage(context, HomeView());
          popAndPush(context, MainScreenPage());
          // pushAndReplaceToPage(context, MainScreenPage());
          // pushToPage(context, MainScreenPage());
        }
      }, builder: (context, snapshot) {
        //refresh the photo
        return LoadingView(
          isLoading: snapshot.loading,
          key: Key(''),
          child: Scaffold(
            backgroundColor: Theme.of(context).canvasColor,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Verify your identity',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  AvatarImageView(
                    onTap: context.read<ProfileVerifyCubit>().pickImage,
                    key: Key(''),
                    child: snapshot.file != null
                        ? Image.file(
                            snapshot.file!,
                            fit: BoxFit.cover,
                          )
                        : Icon(
                            Icons.person_outline,
                            size: 100,
                            color: Colors.grey[400],
                          ),
                  ),
                  Text(
                    'Your name',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50.0,
                      vertical: 20,
                    ),
                    child: TextField(
                      controller:
                          context.read<ProfileVerifyCubit>().nameController,
                      decoration: InputDecoration(
                        fillColor: Theme.of(context)
                            .bottomNavigationBarTheme
                            .backgroundColor,
                        hintText: 'Or just how people now you',
                        hintStyle: TextStyle(
                          fontSize: 13,
                          color: Colors.grey[400],
                        ),
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  Hero(
                    tag: 'home_hero',
                    child: Material(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Theme.of(context).colorScheme.secondary,
                      child: InkWell(
                          onTap: () {
                            context.read<ProfileVerifyCubit>().startChatting();
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40.0,
                              vertical: 15,
                            ),
                            child: Text(
                              'Start chatting now',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
