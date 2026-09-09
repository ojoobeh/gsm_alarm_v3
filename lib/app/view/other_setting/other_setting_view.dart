import 'package:bestdroid/app/view/other_setting/other_setting_page4_view.dart';
import 'package:bestdroid/app/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bestdroid/app/core/core.dart';
import 'package:bestdroid/app/extensions/extension.dart';
import 'package:bestdroid/app/view/other_setting/other_setting_controller.dart';
import 'package:bestdroid/app/view/other_setting/other_setting_page1_view.dart';
import 'package:bestdroid/app/view/other_setting/other_setting_page2_view.dart';

import 'other_setting_page3_view.dart';

class OtherSettingView extends StatefulWidget {
  const OtherSettingView({super.key});

  @override
  State<OtherSettingView> createState() => _OtherSettingViewState();
}

class _OtherSettingViewState extends State<OtherSettingView> with OtherSettingController, SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    controller = TabController(length: 4, vsync: this);
    setZoneParam();

    setRemoteZoneName();
    setCallPriorityParam();

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: context.theme.scaffoldBackgroundColor,
              iconTheme: IconThemeData(
                color: context.theme.dividerColor, //change your color here
              ),
              title: Text(
                s.otherSetting,
                style: TextStyle(
                  fontSize: 14,
                  color: context.theme.dividerColor,
                ),
              ),
              centerTitle: true,
              automaticallyImplyLeading: false,
              elevation: 10,
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: context.theme.dividerColor),
                onPressed: () => {Get.back()},
              ),
              bottom: TabBar(
                controller: controller,
                tabs: [
                  Tab(child: Text(s.deviceSettings).labelLarge()),
                  Tab(child: Text(s.reports).labelLarge()),
                  Tab(child: Text(s.otherSetting).labelLarge()),
                  Tab(child: Text(s.generalSettings).labelLarge()),
                ],
              ),
            ),
            body: TabBarView(
              controller: controller,
              children: const [
                OtherSettingPage1View(),
                OtherSettingPage2View(),
                OtherSettingPage3View(),
                OtherSettingPage4View(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget item({
  required String title,
  required String code,
   int? defaultParamIndex,
  List<String>? params,
  // required Function(int status) change,
}) {
  RxInt isTrue =(defaultParamIndex?? 0).obs;
  return Container(
    padding: const EdgeInsets.all(8),
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: context.theme.scaffoldBackgroundColor,
      boxShadow: [
        BoxShadow(color: context.theme.dividerColor.withOpacity(0.5), blurRadius: 20, offset: const Offset(0, 8)),
      ],
    ),
    child: Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            color: context.theme.dividerColor,
          ),
        ).marginOnly(bottom: 4, top: 20),
        Obx(() {
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: context.theme.dividerColor.withOpacity(0.8), width: 1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: params != null
                ? Container(
                    width: double.infinity,
                    child: Wrap(
                        alignment: WrapAlignment.spaceEvenly,
                        children: params
                            .mapIndexed((index, String item) => Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Radio(
                                      value: index,
                                      groupValue: isTrue.value,
                                      onChanged: (value) => isTrue(index),
                                    ),
                                    Text(item),
                                  ],
                                ))
                            .toList()),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Radio(
                            value: 0,
                            groupValue: isTrue.value,
                            onChanged: (value) => isTrue(0),
                          ),
                          Text(s.active),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value: 1,
                            groupValue: isTrue.value,
                            onChanged: (value) => isTrue(1),
                          ),
                          Text(s.inactive),
                        ],
                      )
                    ],
                  ),
          );
        }),
        const SizedBox(height: 8),
        button(
          title: s.send,
          onTap: () {
            String _code = getCode(code);
            sendMessage(_code.replaceAll("VAL", (isTrue.value + 1).toString()));

            // change(isTrue.value);
          },
        ),
      ],
    ),
  );
}

// class ModelButtons{
//   String title,
// }
