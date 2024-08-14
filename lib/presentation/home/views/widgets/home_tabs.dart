import 'package:flutter/material.dart';
import '../../../../core/configs/theme/app_colors.dart';
import '../../../../core/utils/is_dark_mode.dart';

class HomeTabs extends StatefulWidget {
  const HomeTabs({super.key});

  @override
  State<HomeTabs> createState() => _HomeTabsState();
}

class _HomeTabsState extends State<HomeTabs>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TabBar(
        onTap: (value) {},
        controller: _tabController,
        labelColor: context.isDarkMode ? Colors.white : Colors.black,
        labelStyle: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        unselectedLabelStyle: const TextStyle(color: AppColors.kGreyColor),
        isScrollable: true,
        indicatorColor: AppColors.kPrimaryColor,
        dividerHeight: 0,
        physics: const BouncingScrollPhysics(),
        indicatorPadding: const EdgeInsets.symmetric(horizontal: 6),
        tabAlignment: TabAlignment.start,
        tabs: const [
          Text('News'),
          Text('Videos'),
          Text('Artists'),
          Text('Podcats'),
        ],
      ),
    );
  }
}
