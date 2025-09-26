import 'package:dalel_app/features/search/presentaion/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';
import 'package:dalel_app/core/widgets/custom_data_list_view_item.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SearchCubit()..fetchData(),
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: AppColors.offWhite,
          body: SafeArea(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.offWhite, AppColors.primaryColor],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // App Bar
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Search",
                            style: CustomTextStyles.pacifico400style64
                                .copyWith(fontSize: 28)),
                        Icon(Icons.search,
                            color: AppColors.deepBrown, size: 28),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Search Bar
                    _SearchBar(),
                    const SizedBox(height: 20),
                    // Tabs
                    TabBar(
                      labelColor: AppColors.deepBrown,
                      unselectedLabelColor: AppColors.lightGrey,
                      indicatorColor: AppColors.deepBrown,
                      tabs: const [
                        Tab(text: "Places"),
                        Tab(text: "People"),
                        Tab(text: "Wars"),
                      ],
                    ),
                    const SizedBox(height: 10),
                    // Tab Views
                    Expanded(
                      child: TabBarView(
                        children: [
                          _SearchResultsTab(category: "places"),
                          _SearchResultsTab(category: "people"),
                          _SearchResultsTab(category: "wars"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Search Bar Widget
class _SearchBar extends StatelessWidget {
  _SearchBar();
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: TextField(
        controller: _controller,
        onChanged: (value) => context.read<SearchCubit>().search(value),
        style: CustomTextStyles.poppins400style20,
        decoration: InputDecoration(
          hintText: "Search historical places, people...",
          hintStyle: CustomTextStyles.poppins400style20
              .copyWith(color: AppColors.lightGrey),
          prefixIcon: Icon(Icons.search, color: AppColors.deepBrown, size: 28),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 18.0),
        ),
      ),
    );
  }
}

// Tab content widget
class _SearchResultsTab extends StatelessWidget {
  final String category;
  const _SearchResultsTab({required this.category});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchLoading) {
          return Center(
            child: CircularProgressIndicator(color: AppColors.primaryColor),
          );
        } else if (state is SearchLoaded) {
          final filteredData = state.filteredData
              .where((item) =>
                  item.category.toLowerCase() == category.toLowerCase())
              .toList();

          if (filteredData.isEmpty) {
            return Center(
              child: Text(
                "No results found",
                style: CustomTextStyles.poppins500style18
                    .copyWith(color: AppColors.deepGrey),
              ),
            );
          }

          return ListView.builder(
            itemCount: filteredData.length,
            itemBuilder: (_, index) {
              final item = filteredData[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Card(
                  elevation: 8,
                  shadowColor: AppColors.deepBrown.withOpacity(0.4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: CustomDataListViewItem(
                    model: item,
                    routePath: "/details",
                  ),
                ),
              );
            },
          );
        } else if (state is SearchFailure) {
          return Center(
            child: Text(
              state.errorMessage,
              style: CustomTextStyles.poppins500style18
                  .copyWith(color: AppColors.deepGrey),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
