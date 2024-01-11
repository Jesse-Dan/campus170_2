// ignore_for_file: unnecessary_null_comparison, must_be_immutable, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:campus170_2/src/utils/style/app_colors.dart';
import 'package:campus170_2/src/view/base/base_scaffold.dart';

import '../../utils/components/app_nav_bar_icoons.dart';

class BaseApp extends StatefulWidget {
  static const String routeName = 'app.app';
  final int? currentIndex;
  BaseApp({super.key, required this.currentIndex}) {
    _currentIndex = currentIndex ?? 0;
  }
  late int _currentIndex;

  @override
  State<BaseApp> createState() => _BaseAppState();
}

class _BaseAppState extends State<BaseApp> {
  List<Widget> screens = [
    Container(),
    Container(),
    Container(),
    Container(),
    Container(),
  ];

  bool addbadge = true;
  final BottomNavigationBarType _bottomNavType = BottomNavigationBarType.fixed;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<AppNavBarIcon> t = [
      const AppNavBarIcon(
        label: 'Home',
        img: 'linear_home-2.svg',
        selectedImg: 'bold_home-2.svg',
      ),
      const AppNavBarIcon(
        label: 'Search',
        img: 'linear_search-normal.svg',
        selectedImg: 'bold_search-normal.svg',
      ),
      const AppNavBarIcon(
        img: 'linear_message.svg',
        selectedImg: 'bold_message.svg',
        label: 'Chat',
      ),
      AppNavBarIcon(
        addbadge: addbadge,
        label: 'Notification',
        img: 'linear_notification.svg',
        selectedImg: 'bold_notification.svg',
      ),
      const AppNavBarIcon(
        label: 'Profile',
        img: 'linear_profile.svg',
        selectedImg: 'bold_frame.svg',
      ),
    ];

    List<BottomNavigationBarItem> navBarItems = t
        .map(
          (e) => BottomNavigationBarItem(
            icon: e.addbadge
                ? Stack(
                    children: [
                      SvgPicture.asset('assets/icons/${e.img}'),
                      Positioned(
                        top: 1.2,
                        right: 1.5,
                        child: Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.kprimaryColor700),
                        ),
                      )
                    ],
                  )
                : SvgPicture.asset('assets/icons/${e.img}'),
            activeIcon: e.addbadge
                ? Stack(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/${e.selectedImg}',
                      ),
                      Positioned(
                        top: 1.2,
                        right: 1.5,
                        child: Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.kprimaryColor700,
                              border: Border.all(color: AppColors.kbrandWhite)),
                        ),
                      )
                    ],
                  )
                : SvgPicture.asset(
                    'assets/icons/${e.selectedImg}',
                  ),
            label: e.label,
          ),
        )
        .toList();

    return BaseScaffold(
        physics: const NeverScrollableScrollPhysics(),
        bottomNavigationBar: BottomNavigationBar(
            enableFeedback: false,
            elevation: 2,
            selectedLabelStyle: Theme.of(context).textTheme.headline1!.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.kprimaryColor700),
            unselectedLabelStyle: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(fontSize: 12, fontWeight: FontWeight.w500),
            currentIndex: widget._currentIndex,
            selectedItemColor: AppColors.kprimaryColor700,
            unselectedItemColor: const Color(0xff757575),
            type: _bottomNavType,
            onTap: (value) {
              setState(() {
                widget._currentIndex = value;
              });
            },
            items: navBarItems),
        backgroundColor: AppColors.kbrandWhite,
        addbodyPadding: false,
        body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 40,
            child: screens[widget._currentIndex]));
  }
}
