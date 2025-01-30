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
            Center(
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
  //final TextTheme textTheme = Theme.of(context).textTheme;
  return Container(
    height: 400,
    width: size.width,
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.amber,
      ),
    ),
    child: Column(
      children: [
        Row(
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
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'username',
                ),
                Text('برنامهع نویسی اندر.وید'),
              ],
            )
          ],
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
    padding: const EdgeInsets.symmetric(horizontal: 17),
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
