import 'package:dalel_app/features/home/data/models/historical_periods_model.dart';
import 'package:dalel_app/features/home/presentation/widgets/home_sections/home_app_bar_section.dart';
import 'package:dalel_app/features/home/presentation/widgets/period_details_section.dart';
import 'package:dalel_app/features/home/presentation/widgets/period_wars_section.dart';
import 'package:dalel_app/features/home/presentation/widgets/recommendation_section.dart';
import 'package:dalel_app/features/home/presentation/widgets/trending_section.dart';
import 'package:flutter/material.dart';

class HistoricalPeriodsDetailsView extends StatelessWidget {
  const HistoricalPeriodsDetailsView({super.key, this.model});
  final HistoricalPeriodsModel? model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: HomeAppBarSection()),
          const SliverToBoxAdapter(child: SizedBox(height: 7)),
          if (model != null) ...[
            SliverToBoxAdapter(
              child: PeriodDetailsSection(
                periodName: model?.name ?? 'Unknown Period',
                description: model?.discription ?? 'No Description Available',
                imageUrl: model?.image ?? '',
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 22)),
            SliverToBoxAdapter(
              child: PeriodWarsSection(
                warsList: model?.wars ?? [],
              ),
            ),
            SliverToBoxAdapter(
              child: RecommendationsSection(
                name: model?.name ?? 'No Name',
              ),
            ),
          ] else ...[
            const SliverToBoxAdapter(
              child: Center(child: Text('No data available for this period.')),
            ),
          ],
          const SliverToBoxAdapter(child: TrendingSection()),
        ],
      ),
    ));
  }
}
