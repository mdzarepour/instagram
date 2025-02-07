import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:instagram/components/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: _buildAppBar(),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: _buildStoryListView(size)),
            SliverToBoxAdapter(child: SizedBox(height: 30)),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => _buildPostContainer(context, size, index),
                childCount: 9,
              ),
            ),
          ],
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
          child: ImageIcon(AssetImage('assets/images/icon_direct.png'),
              color: SolidColors.whiteColor),
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
          itemBuilder: (context, index) =>
              index == 0 ? _buildAddStoryBox() : _buildStoryBox(),
        ),
      ),
    );
  }

  Widget _buildAddStoryBox() {
    return _buildStoryBoxContent(
        'add story', 'assets/images/icon_plus.png', SolidColors.greyLinkColor);
  }

  Widget _buildStoryBox() {
    return _buildStoryBoxContent(
        'userName', 'assets/images/profile.png', SolidColors.pinkButtonColor);
  }

  Widget _buildStoryBoxContent(
      String label, String imagePath, Color borderColor) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17),
              border: Border.all(width: 2, color: borderColor),
            ),
            child: Image.asset(imagePath),
          ),
          const SizedBox(height: 10),
          Text(label, style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  Widget _buildPostContainer(BuildContext context, Size size, int index) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.only(top: index == 0 ? 10 : 20, bottom: 20),
      child: SizedBox(
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
                    borderRadius: BorderRadius.circular(17),
                    child: Image.asset('assets/images/post_cover.png',
                        fit: BoxFit.cover),
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
      ),
    );
  }

  Widget _buildPostHeader(TextTheme textTheme) {
    return SizedBox(
      width: 390,
      child: Row(
        children: [
          _buildProfileImage(
              'assets/images/profile.png', SolidColors.pinkButtonColor),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('username', style: textTheme.titleLarge),
                const SizedBox(height: 5),
                Text('امیراحمد برنامه‌نویس موبایل',
                    style: textTheme.displayMedium),
              ],
            ),
          ),
          Image.asset('assets/images/icon_menu.png'),
        ],
      ),
    );
  }

  Widget _buildPostFooter(TextTheme textTheme, BuildContext context) {
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
                _buildIconTextRow('assets/images/icon_hart.png', '2.6 K',
                    textTheme.bodyMedium!),
                _buildIconTextRow('assets/images/icon_comments.png', '2.6 K',
                    textTheme.bodyMedium!),
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
        Text(text, style: textStyle.copyWith(color: SolidColors.whiteColor)),
      ],
    );
  }

  Widget _buildProfileImage(String imagePath, Color borderColor) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 2, color: borderColor),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.5),
        child: Image.asset(imagePath),
      ),
    );
  }

  Widget _shareBottomSheet(BuildContext context) {
    return InkWell(
      onTap: () => _showShareBottomSheet(context),
      child: Image.asset('assets/images/icon_share.png'),
    );
  }

  void _showShareBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      barrierColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.2,
        minChildSize: 0.1,
        maxChildSize: 0.6,
        builder: (context, scrollController) => ClipRRect(
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
                    padding:
                        const EdgeInsets.only(top: 32, right: 40.0, left: 40.0),
                    child: CustomScrollView(
                      controller: scrollController,
                      slivers: [
                        SliverToBoxAdapter(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Share',
                                  style:
                                      Theme.of(context).textTheme.displayLarge),
                              Image.asset(
                                  'assets/images/icon_share_bottomsheet.png'),
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
                      child: _buildWhiteDragIcon()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWhiteDragIcon() {
    return Container(width: 60, height: 5, color: SolidColors.whiteColor);
  }

  Widget _buildUsersGridView() {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) => Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          width: 100,
          height: 100,
          child: Column(
            children: [
              Image.asset('assets/images/profile.png'),
              SizedBox(height: 10),
              Text('username', style: Theme.of(context).textTheme.titleLarge),
            ],
          ),
        ),
        childCount: 9,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: 0.75,
        crossAxisCount: 4,
      ),
    );
  }
}
