import 'package:bestdroid/app/models/model/model.dart';
import 'package:bestdroid/app/models/part/part.dart';
import 'package:bestdroid/app/view/help/help_page.dart';
import 'package:bestdroid/app/view/home/home_page.dart';
import 'package:bestdroid/app/view/location_setting/location_setting_page.dart';
import 'package:bestdroid/app/view/other_setting/other_setting_view.dart';
import 'package:bestdroid/app/view/outputs/home_update_output_page.dart';
import 'package:bestdroid/app/view/splash/splash_page.dart';
import 'package:bestdroid/app/view/utils/local_storage.dart';
import 'package:bestdroid/app/core/assets.dart';
import 'package:bestdroid/app/core/core.dart';
import 'package:bestdroid/app/extensions/extension.dart';
import 'package:bestdroid/app/models/data_manager.dart';
import 'package:bestdroid/app/view/home/home_controller.dart';
import 'package:bestdroid/app/widgets/widgets.dart';
import 'package:flutter/rendering.dart';

class HomeMainPage extends StatefulWidget {
  const HomeMainPage({required this.title, required this.model, super.key});

  final String title;
  final Model model;

  @override
  State<HomeMainPage> createState() => _HomeMainPageState();
}

class _HomeMainPageState extends State<HomeMainPage> with HomeController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    init(
      action: () {
        // isLoading(false);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: _drawer(model: widget.model), //
      body: Stack(
        children: [
          SizedBox(
            width: screenWidth,
            height: screenHeight,
            child: image(Assets.backgroundImage, fit: BoxFit.cover),
          ),
          Container(color: Colors.brown.withValues(alpha: 0.6), width: screenWidth, height: screenHeight),
          Column(
            children: [
              Text(Core.selectedModel.title ?? '').displayLarge().onTap(() async {
                bool isChange = await Get.to(const LocationSettingPage());
                if (isChange) {
                  init(
                    action: () {
                      // isLoading(false);
                    },
                  );
                }
              }),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (Core.selectDeviceModel.value.hasWifi == 1)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: (getBool(AppConstants.isWifi) ?? false) ? Colors.red.withValues(alpha: 0.5) : Colors.transparent,
                            border: Border.all(color: Colors.red.withValues(alpha: 0.5)),
                          ),
                          width: 80,
                          height: 30,
                          child: const Center(child: Text('WIFI')),
                        ).onTap(() {
                          setData(AppConstants.isWifi, true);
                          setState(() {});
                        }),
                        const SizedBox(width: 8),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: (getBool(AppConstants.isWifi) ?? false) ? Colors.red.withValues(alpha: 0.5) : Colors.transparent,
                            border: Border.all(color: Colors.red.withValues(alpha: 0.5)),
                          ),
                          width: 80,
                          height: 30,
                          child: const Center(child: Text('SMS')),
                        ).onTap(() {
                          setData(AppConstants.isWifi, false);
                          setState(() {});
                        }),
                      ],
                    ),
                  _itemH(
                        icon: Assets.emergency,
                        title: s.emergencySiren,
                        startColor: const Color(0xff0068bd),
                        endColor: const Color(0xff277ecb),
                        //
                        itemColor: const Color(0xffffffff),
                        width: screenWidth - 30,
                        opacity: 0.9,
                      )
                      .onTap(() {
                        sendCode2(Core.emergencySiren);
                      })
                      .marginOnly(bottom: 16),

                  _setAllPart(model: widget.model),

                  ///***************************************/
                  _setParts(model: widget.model),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _item(
                        height: 100,
                        icon: Assets.status,
                        title: s.status,
                        startColor: const Color(0xff0068bd),
                        endColor: const Color(0xff277ecb),
                        //
                        itemColor: const Color(0xffffffff),
                        opacity: 0.7,
                      ).onTap(() {
                        sendCode2(Core.deviceReport);
                      }).expanded(),
                      const SizedBox(width: 8),
                      _item(
                        height: 100,
                        icon: Assets.setting,
                        title: s.setting,
                        startColor: const Color(0xff0068bd),
                        endColor: const Color(0xff277ecb),
                        //
                        itemColor: const Color(0xffffffff),
                        opacity: 0.7,
                      ).onTap(() {
                        scaffoldKey.currentState!.openDrawer();
                      }).expanded(),
                      const SizedBox(width: 8),
                      _item(
                        height: 100,
                        icon: Assets.callback,
                        title: s.stopDialing,
                        startColor: const Color(0xff0068bd),
                        endColor: const Color(0xff277ecb),
                        //
                        itemColor: const Color(0xffffffff),
                        opacity: 0.7,
                      ).onTap(() {
                        sendCode2(Core.stopDialing);
                      }).expanded(),
                    ],
                  ),
                ],
              ).marginSymmetric(horizontal: 32).expanded(),
            ],
          ),
        ],
      ),
    ).safeArea();
  }

  Widget _item({double? width, double? height, double? opacity, Color? startColor, Color? endColor, Color? itemColor, required String icon, required String title}) =>
      Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(begin: Alignment.bottomRight, end: Alignment.topLeft, colors: [startColor ?? const Color(0xff2a2a2a), endColor ?? const Color(0xff5d5c5d)]),
          // color: Colors.white.withValues(alpha: opacity ?? 0.8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image(icon, height: 36, color: itemColor ?? Colors.red).marginOnly(bottom: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              // ).bodyLarge(fontSize: 14, color: color),
            ).bodyLarge(fontSize: 14, color: itemColor ?? Colors.red),
          ],
        ),
      ).paddingSymmetric(vertical: 8).marginSymmetric(vertical: 8);

  Widget _itemH({double? width, double? height, double? opacity, Color? startColor, Color? endColor, Color? itemColor, required String icon, required String title}) =>
      Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        margin: const EdgeInsets.symmetric(vertical: 8),
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(begin: Alignment.bottomRight, end: Alignment.topLeft, colors: [startColor ?? const Color(0xff2a2a2a), endColor ?? const Color(0xff5d5c5d)]),
          // color: Colors.white.withValues(alpha: opacity ?? 0.8),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image(icon, height: 40, color: itemColor ?? Colors.red),
            const SizedBox(width: 8),
            Text(title).bodyLarge(fontSize: 18, color: itemColor ?? Colors.red),
          ],
        ),
      );

  Widget _drawer({required Model model}) => Drawer(
    child: Container(
      padding: const EdgeInsets.all(0),
      child: Column(
        children: [
          image(Assets.drawerPic02),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _drawerItems(
                      icon: Assets.location,
                      text: s.locationSetting,
                      onTap: () async {
                        bool isChange = await Get.to(const LocationSettingPage());
                        if (isChange) {
                          init(
                            action: () {
                              // isLoading(false);
                            },
                          );
                        }
                      },
                    ),
                    _drawerItems(
                      icon: Assets.locationSetting,
                      text: s.otherSetting,
                      onTap: () {
                        if (isDebugMode) {
                          push(const OtherSettingView());
                        } else {
                          getParamDialog(
                            title: s.password,
                            inputType: TextInputType.number,
                            result: (param) {
                              if (param == (getString(DataManager.adminPassword) ?? AppConstants.defaultAdminPassword)) {
                                back();
                                push(const OtherSettingView());
                              } else {
                                snackbarRed(title: s.warning, subtitle: s.wrongPassword);
                              }
                            },
                          );
                        }

                        // Get.toNamed(Routes.LOCATIONSETTING);
                      },
                    ),
                    _drawerItems(
                      icon: Assets.simcard2,
                      text: s.chargeIncrease,
                      onTap: () {
                        getParamDialog(
                          title: s.chargeCode,
                          inputType: TextInputType.number,
                          result: (param) {
                            back();
                            Future.delayed(const Duration(milliseconds: 1000), () {
                              simCardCharge(param);
                              setState(() {
                                // Here you can write your code for open new view
                              });
                            });
                          },
                        );
                      },
                    ),
                    _drawerItems(
                      icon: Assets.simCard,
                      text: s.remainingCharge,
                      onTap: () {
                        sendCode2(Core.simCardInquiry);
                      },
                    ),
                    _drawerItems(
                      icon: Assets.output,
                      text: s.outputsSetting,
                      onTap: () {
                        push(const HomeUpdateOutputPage());
                      },
                    ),

                    // _drawerItems(
                    //   icon: Assets.info,
                    //   text: s.aboutUs,
                    //   onTap: () {
                    //     launchUrl(Uri.parse('https://www.gsm.ir'));
                    //   },
                    // ),
                    _drawerItems(
                      icon: Assets.language,
                      text: s.language,
                      onTap: () {
                        if (Get.locale == const Locale("fa")) {
                          Get.updateLocale(const Locale("en"));
                          setData("locale", "en");
                        } else {
                          Get.updateLocale(const Locale("fa"));
                          setData("locale", "fa");
                        }
                        offAll(
                          HomePage(
                            model: model,
                          ),
                        );
                      },
                    ),

                    // if (isAndroid)
                    //   _drawerItems(
                    //     icon: Assets.simcard2,
                    //     text: s.autoSms,
                    //     onTap: () {
                    //       push(AutoSmsSettingPage(locationSettingModel: Core.selectLocationSettingModel.value));
                    //     },
                    //   ),
                    _drawerItems(
                      icon: Assets.help,
                      text: s.help,
                      onTap: () {
                        push(const HelpView());
                      },
                    ),
                    _drawerItems(
                      icon: Assets.reset,
                      text: s.reset,
                      onTap: () {
                        showYesOrNoDialog(
                          title: s.warning,
                          description: s.sureReset,
                          action: () {
                            clearData();
                            Get.offAll(const SplashPage());
                          },
                        );
                      },
                    ),
                    // _drawerItems(
                    //   icon: Assets.info,
                    //   text: s.lastVersion,
                    //   onTap: () {
                    //     showYesOrNoDialog(
                    //       title: s.lastVersion,
                    //       description: s.lastVersionIsAvailable,
                    //       action: () {
                    //
                    //       },
                    //     );
                    //   },
                    // ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: Center(
              child: Directionality(
                textDirection: TextDirection.ltr,
                child: Text("${s.version} ${Core.versionNumber}", textDirection: TextDirection.ltr).bodyMedium(color: Colors.red),
              ),
            ),
          ),
        ],
      ),
    ),
  );

  Widget _drawerItems({required final String icon, required final String text, required final VoidCallback onTap}) => InkWell(
    hoverColor: Colors.transparent,
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Row(
        children: [
          image(icon, width: 22, color: context.theme.dividerColor.withValues(alpha: 0.8)),
          Container(margin: const EdgeInsets.symmetric(horizontal: 12), width: 1, height: 24, color: context.theme.focusColor.withValues(alpha: 0.2)),
          Expanded(child: Text(text).bodyMedium(fontSize: 14)),
        ],
      ),
    ),
  );

  void showPopup(int status) => Get.dialog(
    Dialog(
      child: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 8,
          children: [
            const Text('انتخاب پارت'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 8,
              children: [
                _itemPopupDialog('Part 1').onTap(() {
                  sendCode3(
                    status == 0
                        ? Core.partOn
                        : status == 1
                        ? Core.partOff
                        : Core.partPartialArm,
                    1,
                  );
                }).expanded(),
                _itemPopupDialog('Part 2').onTap(() {
                  sendCode3(
                    status == 0
                        ? Core.partOn
                        : status == 1
                        ? Core.partOff
                        : Core.partPartialArm,
                    2,
                  );
                }).expanded(),
                _itemPopupDialog('Part 3').onTap(() {
                  sendCode3(
                    status == 0
                        ? Core.partOn
                        : status == 1
                        ? Core.partOff
                        : Core.partPartialArm,
                    3,
                  );
                }).expanded(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 8,
              children: [
                _itemPopupDialog('Part 4').onTap(() {
                  sendCode3(
                    status == 0
                        ? Core.partOn
                        : status == 1
                        ? Core.partOff
                        : Core.partPartialArm,
                    4,
                  );
                }).expanded(),
                _itemPopupDialog('Part 5').onTap(() {
                  sendCode3(
                    status == 0
                        ? Core.partOn
                        : status == 1
                        ? Core.partOff
                        : Core.partPartialArm,
                    5,
                  );
                }).expanded(),
                if (Core.selectedModel.modelId != 1)
                  _itemPopupDialog('Part 6').onTap(() {
                    sendCode3(
                      status == 0
                          ? Core.partOn
                          : status == 1
                          ? Core.partOff
                          : Core.partPartialArm,
                      5,
                    );
                  }).expanded(),
              ],
            ),
            if (Core.selectedModel.modelId == 3)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                spacing: 8,
                children: [
                  _itemPopupDialog('Part 7').onTap(() {
                    sendCode3(
                      status == 0
                          ? Core.partOn
                          : status == 1
                          ? Core.partOff
                          : Core.partPartialArm,
                      7,
                    );
                  }).expanded(),
                  _itemPopupDialog('Part 8').onTap(() {
                    sendCode3(
                      status == 0
                          ? Core.partOn
                          : status == 1
                          ? Core.partOff
                          : Core.partPartialArm,
                      8,
                    );
                  }).expanded(),
                ],
              ),
          ],
        ),
      ),
    ),
  );

  Widget _itemPopupDialog(String title) => Container(
    //
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: Colors.blue),
    child: Center(child: Text(title).bodyLarge(color: Colors.white)),
  );

  Widget _setParts({required Model model}) {
    List<PartModel> activeParts = model.partModels!.where((element) => element.isActive == 1).toList();
    return Column(
      children: [
        if (activeParts.isNotEmpty)
          Container(
            decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.3), borderRadius: BorderRadius.circular(8)),
            padding: const EdgeInsets.all(4),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _item(
                      icon: Assets.alarmOn,
                      height: 85,
                      title: '${s.partArm} ${activeParts.first.partNumber}',
                      opacity: 0.9,
                      startColor: const Color(0xffff0000),
                      endColor: const Color(0xfff82020),
                      itemColor: const Color(0xffffffff), //
                    ).onTap(() {
                      sendCode3(Core.partOn, activeParts.first.partNumber!);
                      // sendCode3(activeParts.first.partNumber==1?Core.on:Core.partOn, activeParts.first.partNumber!);
                    }).expanded(),
                    const SizedBox(width: 16),
                    _item(
                      icon: Assets.alarmOff,
                      height: 85,
                      title: '${s.partDisarm} ${activeParts.first.partNumber}',
                      startColor: const Color(0xff055b00),
                      endColor: const Color(0xff217c1b),
                      itemColor: const Color(0xffffffff),
                      opacity: 0.9,
                    ).onTap(() {
                      sendCode3(Core.partOff, activeParts.first.partNumber!);
                      // sendCode3(activeParts.first.partNumber==1?Core.off:Core.partOff, activeParts.first.partNumber!);
                    }).expanded(),
                  ],
                ),
                _itemH(
                  icon: Assets.alarmPart,
                  title: '${s.partPartialArm} ${activeParts.first.partNumber}',
                  width: screenWidth - 30,
                  startColor: const Color(0xff0068bd),
                  endColor: const Color(0xff277ecb),
                  //
                  itemColor: const Color(0xffffffff),
                  opacity: 0.9,
                ).onTap(() {
                  sendCode3(Core.partPartialArm, activeParts.first.partNumber!);
                  // sendCode3(activeParts.first.partNumber==1?Core.partSet:Core.partPartialArm, activeParts.first.partNumber!);
                }),
              ],
            ),
          ),
        if (activeParts.length > 1)
          Container(
            decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.3), borderRadius: BorderRadius.circular(8)),
            padding: const EdgeInsets.all(4),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _item(
                      icon: Assets.alarmOn,
                      height: 85,
                      title: '${s.partArm} ${activeParts.last.partNumber}',
                      opacity: 0.9,
                      startColor: const Color(0xffff0000),
                      endColor: const Color(0xfff82020),
                      itemColor: const Color(0xffffffff),
                    ).onTap(() {
                      // sendCode3(activeParts.last.partNumber==1?Core.on:Core.partOn, activeParts.last.partNumber!);
                      sendCode3(Core.partOn, activeParts.last.partNumber!);
                    }).expanded(),
                    const SizedBox(width: 16),
                    _item(
                      icon: Assets.alarmOff,
                      height: 85,
                      title: '${s.partDisarm} ${activeParts.last.partNumber}',
                      startColor: const Color(0xff055b00),
                      endColor: const Color(0xff217c1b),
                      itemColor: const Color(0xffffffff),
                      opacity: 0.9,
                    ).onTap(() {
                      // sendCode3(activeParts.last.partNumber==1?Core.off:Core.partOff, activeParts.last.partNumber!);
                      sendCode3(Core.partOff, activeParts.last.partNumber!);
                    }).expanded(),
                  ],
                ),
                _itemH(
                  icon: Assets.alarmPart,
                  title: '${s.partPartialArm} ${activeParts.last.partNumber}',
                  width: screenWidth - 30,
                  startColor: const Color(0xff0068bd),
                  endColor: const Color(0xff277ecb),
                  //
                  itemColor: const Color(0xffffffff),
                  opacity: 0.9,
                ).onTap(() {
                  // sendCode3(activeParts.last.partNumber==1?Core.partSet:Core.partPartialArm, activeParts.last.partNumber!);
                  sendCode3(Core.partPartialArm, activeParts.last.partNumber!);
                }),
              ],
            ),
          ),
      ],
    );
  }

  Widget _setAllPart({required Model model}) {
    List<PartModel> activeParts = model.partModels!.where((element) => element.isActive == 1).toList();
    return activeParts.isEmpty
        ? Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _item(
                    icon: Assets.alarmOn,
                    height: 85,
                    title: s.arm,
                    opacity: 0.9,
                    startColor: const Color(0xffff0000),
                    endColor: const Color(0xfff82020),
                    itemColor: const Color(0xffffffff), //
                  ).onTap(() {
                    sendCode2(Core.on);
                  }).expanded(),
                  const SizedBox(width: 16),
                  _item(
                    icon: Assets.alarmOff,
                    height: 85,
                    title: s.disarm,
                    startColor: const Color(0xff055b00),
                    endColor: const Color(0xff217c1b),
                    itemColor: const Color(0xffffffff),
                    opacity: 0.9,
                  ).onTap(() {
                    sendCode2(Core.off);
                  }).expanded(),
                ],
              ),
              _itemH(
                icon: Assets.alarmPart,
                title: s.partialArm,
                width: screenWidth - 30,
                startColor: const Color(0xff0068bd),
                endColor: const Color(0xff277ecb),
                //
                itemColor: const Color(0xffffffff),
                opacity: 0.9,
              ).onTap(() {
                sendCode2(Core.partSet);
              }),
            ],
          )
        : Container(
            width: 100,
            height: 10,
            color: Colors.red,
          );
  }
}
