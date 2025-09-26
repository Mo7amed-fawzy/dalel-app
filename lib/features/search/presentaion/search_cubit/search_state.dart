part of 'search_cubit.dart';

abstract class SearchState {
  const SearchState();
}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final List<DataModel> filteredData;
  const SearchLoaded({required this.filteredData});
}

class SearchFailure extends SearchState {
  final String errorMessage;
  const SearchFailure({required this.errorMessage});
}
