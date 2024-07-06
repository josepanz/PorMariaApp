import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:io';
import 'package:por_maria_app/domain/usecases/profile_sign_in_usecase.dart';
import 'package:por_maria_app/repository/image_picker_repository.dart';

class ProfileState {
  const ProfileState(
    this.file, {
    this.success = false,
    this.loading = false,
  });
  final File? file;
  final bool success;
  final bool loading;
}

class ProfileVerifyCubit extends Cubit<ProfileState> {
  ProfileVerifyCubit(
    this._imagePickerRepository,
    this._profileSignInUseCase,
  ) : super(ProfileState(null));

  final nameController = TextEditingController();
  final ImagePickerRepository _imagePickerRepository;
  final ProfileSignInUseCase _profileSignInUseCase;

  void startChatting() async {
    final file = state.file!;
    emit(ProfileState(file, loading: true));
    final name = nameController.text;
    await _profileSignInUseCase.verify(ProfileInput(
      imageFile: file,
      name: name,
    ));
    emit(ProfileState(file, success: true, loading: false));
  }

  void pickImage() async {
    final file = await _imagePickerRepository.pickImage();
    emit(ProfileState(file));
  }
}
