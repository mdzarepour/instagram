import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:instagram/components/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(color: SolidColors.backGroundColor),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: _buildAppBar(),
          body: Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: _buildStoryListView(size),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 30,
                  ),
                ),
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                  childCount: 9,
                  (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          top: index == 0 ? 10 : 20, bottom: 20),
                      child: _buildPostContainer(context, size),
                    );
                  },
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Image.asset('assets/images/mood.png', scale: 0.9),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: ImageIcon(
            AssetImage('assets/images/icon_direct.png'),
            color: SolidColors.whiteColor,
          ),
        ),
      ],
    );
  }

  Padding _buildStoryListView(Size size) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: SizedBox(
        height: 90,
        width: size.width,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return index == 0
                ? _buildAddStoryBox(context)
                : _buildStoryBox(context);
          },
        ),
      ),
    );
  }

  Widget _buildAddStoryBox(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17),
              border: Border.all(width: 2, color: SolidColors.greyLinkColor),
            ),
            child: Image.asset('assets/images/icon_plus.png'),
          ),
          const SizedBox(height: 10),
          Text(
            'add story',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }

  Widget _buildStoryBox(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17),
              border: Border.all(width: 2, color: SolidColors.pinkButtonColor),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.5),
              child: Image.asset('assets/images/profile.png'),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'userName',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }

  Widget _buildPostContainer(BuildContext context, Size size) {
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: 390,
      height: 494,
      child: Column(
        children: [
          _buildPostHeader(textTheme),
          const SizedBox(height: 23),
          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(17),
                  ),
                  child: Image.asset('assets/images/post_cover.png'),
                ),
                Positioned(
                  right: 15,
                  top: 15,
                  child: Image.asset('assets/images/icon_video.png'),
                ),
                _buildPostFooter(textTheme, context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildPostHeader(TextTheme textTheme) {
    return SizedBox(
      width: 390,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(width: 2, color: SolidColors.pinkButtonColor),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.5),
              child: Image.asset('assets/images/profile.png'),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'username',
                  style: textTheme.titleLarge,
                ),
                const SizedBox(height: 5),
                Text(
                  'امیراحمد برنامه‌نویس موبایل',
                  style: textTheme.displayMedium,
                ),
              ],
            ),
          ),
          Image.asset('assets/images/icon_menu.png'),
        ],
      ),
    );
  }

  Positioned _buildPostFooter(TextTheme textTheme, BuildContext context) {
    return Positioned(
      right: 27,
      left: 27,
      bottom: 0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 40, sigmaY: 15),
          child: Container(
            height: 46,
            width: 340,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: GradientColors.glassyPostContainer,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildIconTextRow(
                  'assets/images/icon_hart.png',
                  '2.6 K',
                  textTheme.bodyMedium!.copyWith(color: SolidColors.whiteColor),
                ),
                _buildIconTextRow(
                  'assets/images/icon_comments.png',
                  '2.6 K',
                  textTheme.bodyMedium!.copyWith(color: SolidColors.whiteColor),
                ),
                _shareBottomSheet(context),
                Image.asset('assets/images/icon_save.png'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row _buildIconTextRow(String iconPath, String text, TextStyle textStyle) {
    return Row(
      children: [
        Image.asset(iconPath),
        const SizedBox(width: 6),
        Text(text, style: textStyle),
      ],
    );
  }

  //share bottom sheet = >>
  _shareBottomSheet(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          backgroundColor: Colors.transparent,
          barrierColor: Colors.transparent,
          context: context,
          isScrollControlled: true,
          builder: (context) {
            return DraggableScrollableSheet(
              initialChildSize: 0.2,
              minChildSize: 0.1,
              maxChildSize: 0.6,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(36),
                    topLeft: Radius.circular(36),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(36),
                          topLeft: Radius.circular(36),
                        ),
                        gradient: GradientColors.glassyPostContainer,
                      ),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 32,
                              right: 40.0,
                              left: 40.0,
                            ),
                            child: CustomScrollView(
                              controller: scrollController,
                              slivers: [
                                SliverToBoxAdapter(
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Share',
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayLarge,
                                          ),
                                          Image.asset(
                                            'assets/images/icon_share_bottomsheet.png',
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SliverToBoxAdapter(child: SizedBox(height: 22)),
                                _buildUsersGridView(),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 10,
                            left: 180,
                            right: 180,
                            child: _buildWhiteDragIcon(),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        );
      },
      child: Image.asset('assets/images/icon_share.png'),
    );
  }

  _buildWhiteDragIcon() {
    return Container(
      width: 60,
      height: 5,
      color: SolidColors.whiteColor,
    );
  }

  _buildUsersGridView() {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            width: 100,
            height: 100,
            child: Column(
              children: [
                Image.asset('assets/images/profile.png'),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'username',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
          );
        },
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 0.75,
          crossAxisCount: 4),
    );
  }
}
