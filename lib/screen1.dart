import 'dart:async';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:practical_interview/below_text_widget.dart';

final List<String> imgList = [
  'assets/images/1.jpg',
  'assets/images/2.jpg',
  'assets/images/3.jpg'
];

class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> with SingleTickerProviderStateMixin {
  int _current = 0;
  bool reverse = false;

  final PageController _imgPageController = PageController(
    initialPage: 0,
  );
  final PageController _iconPageController = PageController(
    initialPage: 0,
  );
  final PageController _textPageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(milliseconds: 1000), (Timer timer) {
      return setState(() {
        if (reverse == false) {
          if (_current == 2) {
            reverse = true;
          } else {
            _current++;
          }
        } else {
          if (_current == 0) {
            reverse = false;
          } else {
            _current--;
          }
        }

        _imgPageController.animateToPage(
          _current,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOutExpo,
        );
        _iconPageController.animateToPage(
          _current,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOut,
        );
        _textPageController.animateToPage(
          _current,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOut,
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        backPage(context),
        Center(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 80,
                      color: _current == 1
                          ? const Color(0xFFBDE1DE)
                          : const Color(0xFFE2B39F),
                      spreadRadius: 10)
                ]),
            child: CircleAvatar(
                radius: 35.0,
                backgroundColor: Colors.white,
                child: PageView(
                  controller: _iconPageController,
                  scrollDirection: Axis.vertical,
                  children: const [
                    Icon(
                      Icons.ac_unit_outlined,
                      size: 30.0,
                      color: Color(0xFFB7410E),
                    ),
                    Icon(
                      Icons.calendar_today_outlined,
                      size: 30.0,
                      color: Colors.teal,
                    ),
                    Icon(
                      Icons.favorite_border_outlined,
                      size: 30.0,
                      color: Colors.red,
                    ),
                  ],
                )),
          ),
        )
      ],
    ));
  }

  Widget backPage(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: MediaQuery.of(context).size.height / 2,
        width: MediaQuery.of(context).size.width,
        child: PageView(
          controller: _imgPageController,
          scrollDirection: Axis.horizontal,
          children: [
            Image.asset(
              'assets/images/1.jpg',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
            Image.asset(
              'assets/images/2.jpg',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
            Image.asset(
              'assets/images/3.jpg',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.only(bottom: 10.0),
        height: MediaQuery.of(context).size.height / 2,
        width: MediaQuery.of(context).size.width,
        child: Column(children: [
          Expanded(
            child: PageView(
              controller: _textPageController,
              scrollDirection: Axis.vertical,
              children: const [
                BelowTextWidget(
                    text1: 'The perfect \n product for your \n skin type.',
                    text2: 'Find products that work \n for your skin.'),
                BelowTextWidget(
                    text1: 'Daily routine \n and skincare \n guides.',
                    text2: 'Notifications and \n reminders just for you.'),
                BelowTextWidget(
                    text1: 'Connect with \n other skincare \n lovers.',
                    text2: 'Engage with others in \n the community.'),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList.asMap().entries.map((entry) {
              return Container(
                width: 12.0,
                height: 12.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              );
            }).toList(),
          ),
          const Text(
            'Skip',
            style: TextStyle(fontSize: 16.0),
          )
        ]),
      ),
    ]);
  }
}
