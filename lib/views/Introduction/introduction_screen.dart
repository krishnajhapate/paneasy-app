//flutter

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

//packages
import 'package:get/get.dart';
import 'package:paneasy/constants/app_constants.dart';
import 'package:paneasy/controllers/introductionController.dart';
import 'package:paneasy/views/Login/login_screen.dart';
import 'package:paneasy/widget/baseRoute.dart';
import 'package:paneasy/widget/shadow_button.dart';

class IntroductionScreen1 extends BaseRoute {
  IntroductionScreen1({a, o}) : super(a: a, o: o, r: 'IntroductionScreen1');

  final IntroductionController introductionController =
      Get.put(IntroductionController());
  int? selectedPage;
  PageController? _pageController;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(true);
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          body: GetBuilder<IntroductionController>(builder: (controller) {
            return PageView.builder(
                itemCount: _imageUrl.length,
                controller: _pageController,
                onPageChanged: (index) {
                  introductionController.setCurrentIndex(index);
                },
                itemBuilder: (BuildContext context, int index) {
                  return Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 35, left: 15, right: 15),
                        width: Get.width,
                        height: MediaQuery.of(context).size.height * 0.51,
                        child: Image.asset(
                          _imageUrl[index],
                          fit: BoxFit.contain,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: BottomSheet(
                            enableDrag: false,
                            onClosing: () {},
                            builder: (BuildContext context) {
                              return Container(
                                decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        topRight: Radius.circular(30))),
                                height:
                                    MediaQuery.of(context).size.height * 0.4,
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 10, right: 20, left: 20),
                                      child: Text(
                                        _titles[index],
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, left: 20, right: 20),
                                      child: Text(
                                        _subtitles[index],
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                    ),
                                    _textButtonLetStart(),
                                    Padding(
                                      padding: EdgeInsets.only(bottom: 0),
                                      child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: DotsIndicator(
                                          dotsCount: _titles.length,
                                          position: introductionController
                                              .currentIndex,
                                          onTap: (i) {
                                            index = i.toInt();
                                            _pageController!.animateToPage(
                                                index,
                                                duration:
                                                    Duration(microseconds: 1),
                                                curve: Curves.easeInOut);
                                          },
                                          decorator: DotsDecorator(
                                            activeSize: const Size(30, 10),
                                            size: const Size(17, 10),
                                            activeColor: Colors.white,
                                            color:
                                                Colors.white.withOpacity(0.5),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
                    ],
                  );
                });
          })),
    );
  }

  List<String> _titles = [
    'Welcome To ${AppConstants().appName}',
    'Go Digital',
    'Earn on Leads'
  ];
  List<String> _subtitles = [
    'Join the team of Digital Financial Advisors',
    'Submit loan application of your customer digitally.Also track loan status on your app',
    'Earn commissions even for just lead submission'
  ];

  List<String> _imageUrl = [
    'assets/images/intro/intro1.jpg',
    'assets/images/intro/intro2.jpg',
    'assets/images/intro/intro3.jpg',
  ];

  Widget _textButtonLetStart() {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: ShadowButton(
        text: "Get Started",
        voidCallback: () {
          Get.to(() => LoginScreen(
                a: a,
                o: o,
              ));
        },
      ),
    );
  }
}
