import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/components/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(color: SolidColors.backGroundColor),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: _appBar(),
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 11, left: 17),
              child: Center(
                child: SizedBox(
                  height: 90,
                  width: size.width,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return index == 0
                          ? _addStoryBox(context)
                          : _storyBox(context);
                    },
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            _postContainer(context, size)
          ],
        ),
      ),
    );
  }
}

_postContainer(BuildContext context, Size size) {
  final TextTheme textTheme = Theme.of(context).textTheme;
  return SizedBox(
    height: 494,
    child: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
                border: Border.all(
                  width: 2,
                  color: SolidColors.pinkButtonColor,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(2.5),
                child: Image.asset('assets/images/profile.png'),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    style: textTheme.titleLarge,
                    'username',
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                      style: textTheme.displayMedium,
                      'امیراحمد برنامه‌نویس موبایل'),
                ],
              ),
            ),
            Image.asset('assets/images/icon_menu.png')
          ],
        ),
        SizedBox(
          height: 23,
        ),
        Expanded(
          child: Stack(
            children: [
              Image.asset('assets/images/post_cover.png'),
              Positioned(
                right: 15,
                top: 15,
                child: Image.asset('assets/images/icon_video.png'),
              ),
              Positioned(
                right: 27,
                left: 27,
                bottom: 0,
                child: ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      height: 46,
                      width: 340,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                        gradient: GradientColors.glassyPostContainer,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Row(
                            spacing: 6,
                            children: [
                              Image.asset('assets/images/icon_hart.png'),
                              Text(
                                '2.6 K',
                                style: textTheme.bodyMedium!
                                    .copyWith(color: SolidColors.whiteColor),
                              )
                            ],
                          ),
                          Row(
                            spacing: 5,
                            children: [
                              Image.asset('assets/images/icon_comments.png'),
                              Text(
                                '2.6 K',
                                style: textTheme.bodyMedium!
                                    .copyWith(color: SolidColors.whiteColor),
                              )
                            ],
                          ),
                          Image.asset('assets/images/icon_share.png'),
                          Image.asset('assets/images/icon_save.png'),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );
}

AppBar _appBar() {
  return AppBar(
    title: Image.asset(scale: 0.9, 'assets/images/mood.png'),
    actions: [
      Padding(
        padding: const EdgeInsets.only(right: 20),
        child: ImageIcon(
          color: SolidColors.whiteColor,
          AssetImage('assets/images/icon_direct.png'),
        ),
      )
    ],
  );
}

_addStoryBox(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(right: 5),
    child: Column(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(17),
            ),
            border: Border.all(
              width: 2,
              color: SolidColors.greyLinkColor,
            ),
          ),
          child: Image.asset('assets/images/icon_plus.png'),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'add story',
          style: Theme.of(context).textTheme.titleLarge,
        )
      ],
    ),
  );
}

_storyBox(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Column(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(17),
            ),
            border: Border.all(
              width: 2,
              color: SolidColors.pinkButtonColor,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.5),
            child: Image.asset('assets/images/profile.png'),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'userName',
          style: Theme.of(context).textTheme.titleLarge,
        )
      ],
    ),
  );
}
