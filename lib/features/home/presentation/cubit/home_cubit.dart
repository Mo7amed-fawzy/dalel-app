import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel_app/core/functions/print_statement.dart';
import 'package:dalel_app/core/utils/app_strings.dart';
import 'package:dalel_app/features/home/data/models/historical_periods_model.dart';
import 'package:dalel_app/features/home/data/models/wars_model.dart';
import 'package:dalel_app/features/home/presentation/cubit/home_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  List<HistoricalPeriodsModel> historicalPeriods = [];
  List<WarsModel> warsList = [];

  Future<void> getHistoricalPeridos() async {
    try {
      emit(GetHistoricalPeriodsLoading());
      warsList.clear(); // لتجنب تكدس البيانات السابقة
      historicalPeriods.clear(); // لتنظيف القائمة قبل إعادة التحديث

      QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
          .instance
          .collection(FireBaseStrings.historicalPeriods)
          .get();

      for (var element in snapshot.docs) {
        await getWarsList(element);
        historicalPeriods.add(
          HistoricalPeriodsModel.fromJson(
            element.data(),
            warsList,
          ),
        );
        emit(GetHistoricalPeriodsSuccess());
      }
    } catch (e) {
      emit(GetHistoricalPeriodsFailure(errMessage: e.toString()));
    }
  }

  Future<void> getWarsList(
      QueryDocumentSnapshot<Map<String, dynamic>> element) async {
    try {
      warsList.clear(); // تنظيف القائمة لضمان البيانات الصحيحة
      QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
          .instance
          .collection(FireBaseStrings.historicalPeriods)
          .doc(element.id)
          .collection(FireBaseStrings.wars)
          .get();

      for (var warElement in snapshot.docs) {
        warsList.add(
          WarsModel.fromjson(
            warElement.data(),
          ),
        );
      }
    } catch (e) {
      printHere('Error in getWarsList: $e'); // لتشخيص المشكلة إذا حدثت
    }
  }
}
