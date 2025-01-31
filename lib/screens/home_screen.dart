import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/components/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(color: SolidColors.backGroundColor),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: _buildAppBar(),
        body: Column(
          children: [
            const SizedBox(height: 10),
            _buildStoryListView(size),
            const SizedBox(height: 50),
            _buildPostContainer(context, size),
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
      height: 494,
      child: Column(
        children: [
          _buildPostHeader(textTheme),
          const SizedBox(height: 23),
          Expanded(
            child: Stack(
              children: [
                Image.asset('assets/images/post_cover.png'),
                Positioned(
                  right: 15,
                  top: 15,
                  child: Image.asset('assets/images/icon_video.png'),
                ),
                _buildPostFooter(textTheme),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row _buildPostHeader(TextTheme textTheme) {
    return Row(
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
    );
  }

  Positioned _buildPostFooter(TextTheme textTheme) {
    return Positioned(
      right: 27,
      left: 27,
      bottom: 0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
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
                Image.asset('assets/images/icon_share.png'),
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
}
