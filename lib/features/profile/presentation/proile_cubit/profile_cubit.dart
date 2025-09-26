import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel_app/features/profile/data/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  Future<void> fetchUser(String email) async {
    emit(ProfileLoading());
    try {
      final query = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: email)
          .get();

      if (query.docs.isEmpty) {
        emit(ProfileFailure(errorMessage: 'User not found'));
        return;
      }

      final doc = query.docs.first;
      final user = UserModel.fromFirestore(doc);
      emit(ProfileLoaded(user: user));
    } catch (e) {
      emit(ProfileFailure(errorMessage: e.toString()));
    }
  }
}
