import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:por_maria_app/domain/usecases/create_group_usecase.dart';
import 'package:por_maria_app/domain/usecases/login_usecase.dart';
import 'package:por_maria_app/domain/usecases/logout_usecase.dart';
import 'package:por_maria_app/domain/usecases/profile_sign_in_usecase.dart';
import 'package:por_maria_app/impl/auth_impl.dart';
import 'package:por_maria_app/impl/image_picker_impl.dart';
import 'package:por_maria_app/impl/persistent_storage_impl.dart';
import 'package:por_maria_app/impl/stream_api_impl.dart';
import 'package:por_maria_app/impl/upload_storage_impl.dart';
import 'package:por_maria_app/repository/auth_repository.dart';
import 'package:por_maria_app/repository/image_picker_repository.dart';
import 'package:por_maria_app/repository/persistent_storage_repository.dart';
import 'package:por_maria_app/repository/stream_api_respository.dart';
import 'package:por_maria_app/repository/upload_storage_repository.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

List<RepositoryProvider> buildRepositories(StreamChatClient client) {
  return [
    RepositoryProvider<StreamApiRepository>(
        create: (_) => StreamApiImpl(client)),
    RepositoryProvider<PersistentStorageRepository>(
        create: (_) => PersistentStorageImpl()),
    RepositoryProvider<AuthRepository>(create: (_) => AuthImpl()),
    RepositoryProvider<UploadStorageRepository>(
        create: (_) => UploadStorageImpl()),
    RepositoryProvider<ImagePickerRepository>(create: (_) => ImagePickerImpl()),
    RepositoryProvider<ProfileSignInUseCase>(
      create: (context) => ProfileSignInUseCase(
        context.read(),
        context.read(),
        context.read(),
      ),
    ),
    RepositoryProvider<CreateGroupUseCase>(
      create: (context) => CreateGroupUseCase(
        context.read(),
        context.read(),
      ),
    ),
    RepositoryProvider<LogoutUseCase>(
        create: (context) => LogoutUseCase(
              context.read(),
              context.read(),
            )),
    RepositoryProvider<LoginUseCase>(
        create: (context) => LoginUseCase(
              context.read(),
              context.read(),
            )),
  ];
}
