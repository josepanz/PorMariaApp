import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:por_maria_app/commons/avatar_image_view.dart';
import 'package:por_maria_app/ui/app_theme_cubit.dart';
import 'package:por_maria_app/ui/home/settings/settings_view_cubit.dart';
import 'package:por_maria_app/ui/sing_in/sign_in_view.dart';
import 'package:por_maria_app/utils/design_utils/design.dart';
import 'package:por_maria_app/utils/navigator_utils.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class SettingsView extends StatelessWidget {
  static const String routeName = "/settings";
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final user = StreamChat.of(context).client.state.currentUser;
    final image = user?.extraData['image'] as String? ??
        DesignUtils.getUserImageWithSize(user?.name ?? "jpanza", "250");
    final textColor = Theme.of(context).appBarTheme.backgroundColor;
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) =>
                SettingsSwitchCubit(context.read<AppThemeCubit>().isDark),
          ),
          BlocProvider(
            create: (_) => SettingsLogoutCubit(context.read()),
          ),
        ],
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Settings',
              style: TextStyle(
                fontSize: 24,
                color: textColor,
                fontWeight: FontWeight.w800,
              ),
            ),
            centerTitle: false,
            elevation: 0,
            backgroundColor: Theme.of(context).canvasColor,
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  AvatarImageView(
                    //TODO: implement change avatar
                    onTap: () => null,
                    key: Key(''),
                    child: image != ''
                        ? Image.network(
                            image as String? ??
                                'https://ui-avatars.com/api/?background=random&color=random&name=jpanza&rounded=true&size=250',
                            fit: BoxFit.cover,
                          )
                        : Icon(
                            Icons.person_outline,
                            size: 100,
                            color: Colors.grey[400],
                          ),
                  ),
                  Text(
                    user!.name,
                    style: TextStyle(
                      fontSize: 24,
                      color: textColor,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.nights_stay_outlined),
                      const SizedBox(width: 10),
                      Text(
                        'Dark Mode',
                        style: TextStyle(
                          color: textColor,
                        ),
                      ),
                      Spacer(),
                      BlocBuilder<SettingsSwitchCubit, bool>(
                          builder: (context, snapshot) {
                        return Switch(
                          value: snapshot,
                          onChanged: (val) {
                            context
                                .read<SettingsSwitchCubit>()
                                .onChangeDarkMode(val);
                            context.read<AppThemeCubit>().updateTheme(val);
                          },
                        );
                      }),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Builder(builder: (context) {
                    return GestureDetector(
                      onTap: context.read<SettingsLogoutCubit>().logOut,
                      child: BlocListener<SettingsLogoutCubit, void>(
                        listener: (context, snapshot) {
                          popAllAndPush(context, SignInView());
                        },
                        child: Row(children: [
                          Icon(Icons.logout),
                          const SizedBox(width: 10),
                          Text(
                            'Logout',
                            style: TextStyle(
                              color: textColor,
                            ),
                          ),
                          Spacer(),
                          Icon(Icons.arrow_right),
                        ]),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
