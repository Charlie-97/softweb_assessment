import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import '../../../../common/app_assets.dart';
import '../../../../common/app_colors.dart';
import '../../../../common/app_textstyles.dart';
import '../../../../common/theming/gradients.dart';
import 'widgets/action_button.dart';
import 'widgets/balance_card.dart';
import 'widgets/quick_actions_container.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late PageController _pageController;
  @override
  void initState() {
    _pageController = PageController(viewportFraction: .9);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBlack,
      floatingActionButton: _buildFloatingActionButton(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(24, 53, 24, 14),
              decoration: const BoxDecoration(
                color: appWhite,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
              child: Column(
                children: [
                  _buildHeaderRow(),
                  const Gap(24),
                  const BalanceCard(),
                  const Gap(20),
                  _buildActionButtonRow(),
                  const Gap(27),
                  _buildDragHandle()
                ],
              ),
            ),
            _buildContentBody(),
          ],
        ),
      ),
    );
  }

  Column _buildContentBody() {
    return Column(
      children: [
        const Gap(32),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 23.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Quick Actions',
                style: AppTextstyles.bodyMedium,
              ),
              Gap(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: QuickActionsContainer(
                      icon: dataIcon,
                      action: 'Data',
                    ),
                  ),
                  Gap(6),
                  Expanded(
                    child: QuickActionsContainer(
                      icon: airtimeIcon,
                      action: 'Airtime',
                    ),
                  ),
                  Gap(6),
                  Expanded(
                    child: QuickActionsContainer(
                      icon: showmaxIcon,
                      action: 'Showmax',
                    ),
                  ),
                  Gap(6),
                  Expanded(
                    child: QuickActionsContainer(
                      icon: giftcardsIcon,
                      action: 'Giftcards',
                    ),
                  ),
                ],
              ),
              Gap(6),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: QuickActionsContainer(
                      icon: bettingIcon,
                      action: 'Betting',
                    ),
                  ),
                  Gap(6),
                  Expanded(
                    child: QuickActionsContainer(
                      icon: electricityIcon,
                      action: 'Electricity',
                    ),
                  ),
                  Gap(6),
                  Expanded(
                    child: QuickActionsContainer(
                      icon: tvCableIcon,
                      action: 'Tv/Cable',
                    ),
                  ),
                  Gap(6),
                  Expanded(
                    child: QuickActionsContainer(
                      icon: ePinIcon,
                      action: 'E-Pin',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Gap(42),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'News & Update',
                    style: AppTextstyles.bodyMedium,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'View all',
                      style: AppTextstyles.bodyRegular.copyWith(
                        color: appPrimaryOrange,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.002,
                        height: 24 / 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Gap(16),
            Container(
              margin: const EdgeInsets.only(left: 23),
              height: 120,
              child: PageView(
                padEnds: false,
                controller: _pageController,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: const DecorationImage(
                        image: AssetImage(placeholder1),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: const DecorationImage(
                        image: AssetImage(placeholder2),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const Gap(20),
      ],
    );
  }

  Container _buildDragHandle() {
    return Container(
      width: 48,
      height: 5,
      decoration: BoxDecoration(
        color: appWhiteShade,
        borderRadius: BorderRadius.circular(104),
      ),
    );
  }

  Row _buildActionButtonRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const ActionButton(
          icon: topUpIcon,
          action: 'Top up',
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          color: appLightGrey,
          width: 1,
          height: 17,
        ),
        const ActionButton(
          icon: transferIcon,
          action: 'Transfer',
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          color: appLightGrey,
          width: 1,
          height: 17,
        ),
        const ActionButton(
          icon: historyIcon,
          action: 'History',
        ),
      ],
    );
  }

  Row _buildHeaderRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: 0.92,
              color: appGreyText,
            ),
          ),
          child: SvgPicture.asset(
            userIcon,
            fit: BoxFit.scaleDown,
            width: 22,
            height: 22,
          ),
        ),
        Text(
          'Welcome, Sam 👋🏾',
          style: AppTextstyles.bodyLight.copyWith(
            color: appBlack,
          ),
        ),
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: 0.92,
              color: appGreyText,
            ),
          ),
          child: SvgPicture.asset(
            notificationIcon,
            fit: BoxFit.scaleDown,
            width: 22,
            height: 22,
          ),
        ),
      ],
    );
  }

  Container _buildFloatingActionButton() {
    return Container(
      height: 52,
      width: 52,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: buttonGradient,
      ),
      child: FloatingActionButton(
        onPressed: () {},
        backgroundColor: appTransparent,
        elevation: 0,
        child: SvgPicture.asset(chatIcon),
      ),
    );
  }
}
