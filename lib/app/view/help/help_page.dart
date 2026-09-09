import 'package:bestdroid/app/core/core.dart';
import 'package:bestdroid/app/core/ui.dart';
import 'package:bestdroid/app/view/help/help_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelpView extends StatefulWidget {
  const HelpView({super.key});

  @override
  State<HelpView> createState() => _HelpViewState();
}

class _HelpViewState extends State<HelpView> with HelpController {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Get.theme.scaffoldBackgroundColor,
        iconTheme: IconThemeData(
          color: Get.theme.dividerColor, //change your color here
        ),
        title: Text(
          'راهنمای استفاده',
          style: TextStyle(
            fontSize: 14,
            color: Get.theme.dividerColor.withOpacity(0.8),
          ),
        ),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios, color: Get.theme.dividerColor),
          onPressed: () => {Get.back()},
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Divider(
                    height: 1,
                    color: Get.theme.dividerColor,
                  ),
                  Container(
                    width: 26,
                    height: 26,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: Colors.redAccent),
                    child: const Center(
                      child: Text(
                        "1",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Container(
            //   padding: const EdgeInsets.symmetric(horizontal: 16),
            //   child: Ui.applyHtml(
            //     s.help1,
            //     textAlign: TextAlign.center,
            //     style: TextStyle(
            //       color: Get.theme.dividerColor,
            //       fontSize: 12,
            //     ),
            //   ),
            // ),
            // Container(
            //   margin: const EdgeInsets.only(top: 16),
            //   child: Stack(
            //     alignment: Alignment.center,
            //     children: [
            //       Divider(
            //         height: 1,
            //         color: Get.theme.dividerColor,
            //       ),
            //       Container(
            //         width: 26,
            //         height: 26,
            //         decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: Colors.redAccent),
            //         child: Center(
            //           child: Text(
            //             "2",
            //             style: TextStyle(color: Colors.white),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // Container(
            //   padding: const EdgeInsets.symmetric(horizontal: 16),
            //   child: Ui.applyHtml(
            //     s.help2,
            //     textAlign: TextAlign.center,
            //     style: TextStyle(
            //       color: Get.theme.dividerColor,
            //       fontSize: 12,
            //     ),
            //   ),
            // ),
            // Container(
            //   margin: const EdgeInsets.only(top: 16),
            //   child: Stack(
            //     alignment: Alignment.center,
            //     children: [
            //       Divider(
            //         height: 1,
            //         color: Get.theme.dividerColor,
            //       ),
            //       Container(
            //         width: 26,
            //         height: 26,
            //         decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: Colors.redAccent),
            //         child: Center(
            //           child: Text(
            //             "3",
            //             style: TextStyle(color: Colors.white),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // Container(
            //   padding: const EdgeInsets.symmetric(horizontal: 16),
            //   child: Ui.applyHtml(
            //     s.help3,
            //     textAlign: TextAlign.center,
            //     style: TextStyle(
            //       color: Get.theme.dividerColor,
            //       fontSize: 12,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
