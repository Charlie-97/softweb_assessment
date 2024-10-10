import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:softweb_assessment/ui/common/app_assets.dart';

import '../../common/app_colors.dart';
import '../../common/app_textstyles.dart';
import 'bottom_nav_views/home_view/home_view.dart';

class LandingPageView extends StatefulWidget {
  const LandingPageView({super.key});

  @override
  State<LandingPageView> createState() => _LandingPageViewState();
}

class _LandingPageViewState extends State<LandingPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBlack,
      body: _bodyContainer(),
      bottomNavigationBar: bottomNavBar(),
    );
  }

  final List<BottomNavigationBarItem> _bottomNavBarItem = [
    BottomNavigationBarItem(
      icon: SvgPicture.asset(
        homeIcon,
        colorFilter: const ColorFilter.mode(
          appGreyText2,
          BlendMode.srcIn,
        ),
        width: 24,
        height: 24,
        fit: BoxFit.contain,
      ),
      label: 'Home',
      activeIcon: SvgPicture.asset(
        homeIcon,
        colorFilter: const ColorFilter.mode(
          appWhite,
          BlendMode.srcIn,
        ),
        width: 24,
        height: 24,
        fit: BoxFit.contain,
      ),
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(
        servicesIcon,
        colorFilter: const ColorFilter.mode(
          appGreyText2,
          BlendMode.srcIn,
        ),
        width: 24,
        height: 24,
        fit: BoxFit.contain,
      ),
      label: 'Services',
      activeIcon: SvgPicture.asset(
        servicesIcon,
        colorFilter: const ColorFilter.mode(
          appWhite,
          BlendMode.srcIn,
        ),
        width: 24,
        height: 24,
        fit: BoxFit.contain,
      ),
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(
        statisticsIcon,
        colorFilter: const ColorFilter.mode(
          appGreyText2,
          BlendMode.srcIn,
        ),
        width: 24,
        height: 24,
        fit: BoxFit.contain,
      ),
      label: 'Statistics',
      activeIcon: SvgPicture.asset(
        statisticsIcon,
        colorFilter: const ColorFilter.mode(
          appWhite,
          BlendMode.srcIn,
        ),
        width: 24,
        height: 24,
        fit: BoxFit.contain,
      ),
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(
        referralsIcon,
        colorFilter: const ColorFilter.mode(
          appGreyText2,
          BlendMode.srcIn,
        ),
        width: 24,
        height: 24,
        fit: BoxFit.contain,
      ),
      label: 'Referrals',
      activeIcon: SvgPicture.asset(
        referralsIcon,
        colorFilter: const ColorFilter.mode(
          appWhite,
          BlendMode.srcIn,
        ),
        width: 24,
        height: 24,
        fit: BoxFit.contain,
      ),
    ),
    BottomNavigationBarItem(
      icon: SvgPicture.asset(
        settingsIcon,
        colorFilter: const ColorFilter.mode(
          appGreyText2,
          BlendMode.srcIn,
        ),
        width: 24,
        height: 24,
        fit: BoxFit.contain,
      ),
      label: 'Settings',
      activeIcon: SvgPicture.asset(
        settingsIcon,
        colorFilter: const ColorFilter.mode(
          appWhite,
          BlendMode.srcIn,
        ),
        width: 24,
        height: 24,
        fit: BoxFit.contain,
      ),
    ),
  ];

  int _selectedNavBarIndex = 0;

  void _selectNavBarPage(int index) {
    setState(() {
      _selectedNavBarIndex = index;
    });
  }

  BottomNavigationBar bottomNavBar() => BottomNavigationBar(
        items: _bottomNavBarItem,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedNavBarIndex,
        backgroundColor: appBlack,
        onTap: (index) {
          _selectNavBarPage(index);
        },
        selectedLabelStyle: AppTextstyles.navBarLabelSelected,
        unselectedLabelStyle: AppTextstyles.navBarLabel,
        selectedItemColor: appWhite,
        unselectedItemColor: appGreyText2,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        elevation: 0,
      );

  Widget _bodyContainer() {
    Widget? page;
    // linking pages to bottom navigation
    switch (_selectedNavBarIndex) {
      case 0:
        page = _listPage[_selectedNavBarIndex];
        break;
      case 1:
        page = _listPage[_selectedNavBarIndex];
        break;
      case 2:
        page = _listPage[_selectedNavBarIndex];
        break;
      case 3:
        page = _listPage[_selectedNavBarIndex];
        break;
      case 4:
        page = _listPage[_selectedNavBarIndex];

      default:
        page = const SizedBox.shrink();
        break;
    }

    return Center(
      child: page,
    );
  }

  static const List<Widget> _listPage = <Widget>[
    HomeView(),
    Placeholder(),
    Placeholder(),
    Placeholder(),
    Placeholder(),
  ];
}
