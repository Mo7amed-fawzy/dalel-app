import 'package:dalel_app/core/utils/app_assets.dart';
import 'package:flutter/material.dart';

class StatfulOnBoardingbody extends StatefulWidget {
  const StatfulOnBoardingbody({super.key, required this.numberpageIndexes});
// دي ال general state
// ودي كدا private property
  final int numberpageIndexes;

  @override
  StatfulOnBoardingbodyState createState() => StatfulOnBoardingbodyState();
}

class StatfulOnBoardingbodyState extends State<StatfulOnBoardingbody> {
  final PageController _pageController = PageController(); //اضيف انيميشن
  int _currentPage = 0;

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          // دي البتخليني اسكرول يمين وشمال حسب الداتا العندي
          Expanded(
            child: PageView.builder(
              // لما بستدعي حاجة من ال general state بكتب widget.
              itemCount: widget.numberpageIndexes,
              onPageChanged: _onPageChanged, // دا بحدد بيه الصفحه الحاليه
              controller: _pageController, // بتمكني اضيف انيميشن بعدين فالريترن
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Image.asset(Assets.imagesOnBoarding1),
                  ],
                );
              },
            ),
          ),
          _buildPageIndicator(numberOfIndexes: widget.numberpageIndexes),
        ],
      ),
    );
  }

  Widget _buildPageIndicator({required int numberOfIndexes}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(numberOfIndexes, (currentIndex) {
        return Container(
          margin: const EdgeInsets.all(4),
          // width and height both is required
          width: _currentPage == currentIndex ? 12 : 8,
          height: 8.0,
          decoration: BoxDecoration(
            color: _currentPage == currentIndex ? Colors.black : Colors.grey,
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }
}
