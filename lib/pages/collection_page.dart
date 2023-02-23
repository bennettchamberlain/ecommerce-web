import 'package:flutter/material.dart';
import 'package:responsive_product_web_page/colors.dart';
import 'package:responsive_product_web_page/pages/widgets/app_drawer.dart';
import 'package:responsive_product_web_page/pages/widgets/image_slider.dart';
import 'package:responsive_product_web_page/ui_helper.dart';

import 'widgets/desktop_appbar.dart';

import 'widgets/mobile_appbar.dart';
import 'widgets/product_options.dart';
import 'widgets/similar_products.dart';

class CollectionsPage extends StatefulWidget {
  const CollectionsPage({super.key});

  @override
  State<CollectionsPage> createState() => _CollectionsPageState();
}

class _CollectionsPageState extends State<CollectionsPage> {
  bool _isDrawerOpened = false;

  final verticalController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final screenType = context.screenType();
    return Scaffold(
      drawer: screenType == ScreenType.mobile ? const Drawer() : null,
      body: Scrollbar(
        controller: verticalController,
        thumbVisibility: true,
        child: SingleChildScrollView(
            controller: verticalController,
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Visibility(
                    visible: screenType == ScreenType.desktop,
                    replacement: MobileAppBar(
                        onPressed: _isDrawerOpened ? _closeDrawer : _openDrawer,
                        isDrawerOpened: _isDrawerOpened),
                    child: const DesktopAppBar()),
                Visibility(
                    visible: _isDrawerOpened && screenType == ScreenType.mobile,
                    child: const AppDrawer()),
                const SizedBox(
                  height: 50,
                ),
                Flex(
                  direction: screenType == ScreenType.desktop
                      ? Axis.horizontal
                      : Axis.vertical,
                  children: [
                    Visibility(
                      visible: screenType == ScreenType.desktop,
                      child: const Spacer(),
                    ),
                    Expanded(
                        flex: screenType == ScreenType.desktop ? 8 : 0,
                        child: Card(
                            elevation: 100,
                            child: Stack(
                              children: [
                                Image.network(
                                    'https://images.pexels.com/photos/90946/pexels-photo-90946.jpeg?cs=srgb&dl=pexels-math-90946.jpg&fm=jpg')
                              ],
                            ))),
                    Visibility(
                      visible: screenType == ScreenType.desktop,
                      child: const Spacer(),
                    ),
                    const ProductOptions(),
                    Visibility(
                      visible: screenType == ScreenType.desktop,
                      child: const Spacer(),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 73,
                ),
                Text(
                  "Complete Your Experience".toUpperCase(),
                  style: const TextStyle(
                      color: AppColors.black,
                      fontFamily: "Barlow",
                      fontSize: 24,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SimilarProducts(),
                const SizedBox(
                  height: 10,
                ),
              ],
            )),
      ),
    );
  }

  void _openDrawer() {
    setState(() {
      _isDrawerOpened = true;
    });
  }

  void _closeDrawer() {
    setState(() {
      _isDrawerOpened = false;
    });
  }
}
