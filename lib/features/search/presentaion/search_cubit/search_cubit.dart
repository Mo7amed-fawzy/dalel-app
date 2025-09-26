import 'package:dalel_app/core/models/data_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  final CollectionReference _collection =
      FirebaseFirestore.instance.collection('historical_periods');

  List<DataModel> allData = [];

  // Fetch data from Firebase
  Future<void> fetchData() async {
    emit(SearchLoading());
    try {
      final snapshot = await _collection.get();
      allData = snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return DataModel(
          name: data['name'] ?? '',
          image: data['image'] ?? '',
          discription: data['discription'] ?? '',
          category: data['category'] ?? '',
        );
      }).toList();

      emit(SearchLoaded(filteredData: allData));
    } catch (e) {
      emit(SearchFailure(errorMessage: e.toString()));
    }
  }

  // Search inside loaded data
  void search(String query) {
    final filtered = allData
        .where((item) => item.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    emit(SearchLoaded(filteredData: filtered));
  }
}
