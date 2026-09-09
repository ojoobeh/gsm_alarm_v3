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
  const HomeMainPage({
    required this.title,
    required this.on,
    required this.partSet,
    required this.off,
    super.key,
  });

  final String title;
  final String on;
  final String off;
  final String partSet;

  @override
  State<HomeMainPage> createState() => _HomeMainPageState();
}

class _HomeMainPageState extends State<HomeMainPage> with HomeController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    init(
      action: () {
        isLoading(false);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: _drawer(), //
      body: Stack(
        children: [
          SizedBox(width: screenWidth, height: screenHeight, child: image(Assets.backgroundImage, fit: BoxFit.cover)),
          Container(
            color: Colors.brown.withOpacity(0.6),
            width: screenWidth,
            height: screenHeight,
          ),
          Obx(() => !isLoading.value
              ? Column(
                  children: [
                    Obx(() {
                      return !isLoading.value && selectLocationSettingModel.value.name != null
                          ? Text(
                              selectLocationSettingModel.value.name ?? '',
                            ).displayLarge()
                          : Text(s.installationLocation).displayLarge();
                    }).onTap(() async {
                      bool isChange = await Get.to(
                        const LocationSettingPage(),
                      );
                      if (isChange) {
                        init(
                          action: () {
                            isLoading(false);
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
                                  color: getBool(AppConstants.isWifi) ? Colors.red.withOpacity(0.5) : Colors.transparent,
                                  border: Border.all(color: Colors.red.withOpacity(0.5)),
                                ),
                                width: 80,
                                height: 30,
                                child: const Center(
                                  child: Text('WIFI'),
                                ),
                              ).onTap(() {
                                setData(AppConstants.isWifi, true);
                                setState(() {});
                              }),
                              const SizedBox(width: 8),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: !getBool(AppConstants.isWifi) ? Colors.red.withOpacity(0.5) : Colors.transparent,
                                  border: Border.all(color: Colors.red.withOpacity(0.5)),
                                ),
                                width: 80,
                                height: 30,
                                child: const Center(
                                  child: Text('SMS'),
                                ),
                              ).onTap(() {
                                setData(AppConstants.isWifi, false);
                                setState(() {});
                              }),
                            ],
                          ),
                        if (widget.partSet == DataManager.partSet)
                          _itemH(
                            icon: Assets.emergency,
                            title: s.emergencySiren,
                            startColor: Color(0xff0068bd),
                            endColor: Color(0xff277ecb),
                            //
                            itemColor: Color(0xffffffff),
                            width: screenWidth - 30,
                            opacity: 0.9,
                          ).onTap(() {
                            sendCode(DataManager.emergencySiren);
                          }).marginOnly(bottom: 16),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _item(
                              icon: Assets.alarmOn,
                              height: 85,
                              title: s.arm,
                              opacity: 0.9,
                              startColor: Color(0xffff0000),
                              endColor: Color(0xfff82020),
                              itemColor: Color(0xffffffff), //
                            ).onTap(() {
                              sendCode(widget.on);
                            }).expanded(),
                            const SizedBox(width: 16),
                            _item(
                              icon: Assets.alarmOff,
                              height: 85,
                              title: s.disarm,
                              startColor: Color(0xff055b00),
                              endColor: Color(0xff217c1b),
                              itemColor: Color(0xffffffff),
                              opacity: 0.9,
                            ).onTap(() {
                              sendCode(widget.off);
                            }).expanded(),
                          ],
                        ).marginOnly(bottom: 20),
                        if (widget.partSet == DataManager.partSet)
                          _itemH(
                            icon: Assets.alarmPart,
                            title: s.partialArm,
                            width: screenWidth - 30,
                            startColor: Color(0xff0068bd),
                            endColor: Color(0xff277ecb),
                            //
                            itemColor: Color(0xffffffff),
                            opacity: 0.9,
                          ).onTap(() {
                            sendCode(widget.partSet);
                          }).marginOnly(bottom: 48),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _item(
                              height: 100,
                              icon: Assets.status,
                              title: s.status,
                              startColor: Color(0xff0068bd),
                              endColor: Color(0xff277ecb),
                              //
                              itemColor: Color(0xffffffff),
                              opacity: 0.7,
                            ).onTap(() {
                              sendCode(DataManager.deviceReport);
                            }).expanded(),
                            const SizedBox(width: 8),
                            _item(
                              height: 100,
                              icon: Assets.setting,
                              title: s.setting,
                              startColor: Color(0xff0068bd),
                              endColor: Color(0xff277ecb),
                              //
                              itemColor: Color(0xffffffff),
                              opacity: 0.7,
                            ).onTap(() {
                              scaffoldKey.currentState!.openDrawer();
                            }).expanded(),
                            const SizedBox(width: 8),
                            _item(
                              height: 100,
                              icon: Assets.callback,
                              title: s.stopDialing,
                              startColor: Color(0xff0068bd),
                              endColor: Color(0xff277ecb),
                              //
                              itemColor: Color(0xffffffff),
                              opacity: 0.7,
                            ).onTap(() {
                              sendCode(DataManager.stopDialing);
                            }).expanded(),
                          ],
                        ),
                      ],
                    ).marginSymmetric(horizontal: 32).expanded(),
                  ],
                )
              : const Center(
                  child: CircularProgressIndicator(),
                )),
        ],
      ),
    ).safeArea();
  }

  Widget _item({
    double? width,
    double? height,
    double? opacity,
    Color? startColor,
    Color? endColor,
    Color? itemColor,
    required String icon,
    required String title,
  }) =>
      Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(begin: Alignment.bottomRight, end: Alignment.topLeft, colors: [
            startColor ?? Color(0xff2a2a2a),
            endColor ?? Color(0xff5d5c5d),
          ]),
          // color: Colors.white.withOpacity(opacity ?? 0.8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image(
              icon,
              height: 36,
              color: itemColor ?? Colors.red,
            ).marginOnly(bottom: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              // ).bodyLarge(fontSize: 14, color: color),
            ).bodyLarge(fontSize: 14, color: itemColor ?? Colors.red),
          ],
        ),
      ).paddingSymmetric(vertical: 8).marginSymmetric(vertical: 8);

  Widget _itemH({
    double? width,
    double? height,
    double? opacity,
    Color? startColor,
    Color? endColor,
    Color? itemColor,
    required String icon,
    required String title,
  }) =>
      Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        margin: const EdgeInsets.symmetric(vertical: 8),
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(begin: Alignment.bottomRight, end: Alignment.topLeft, colors: [
            startColor ?? Color(0xff2a2a2a),
            endColor ?? Color(0xff5d5c5d),
          ]),
          // color: Colors.white.withOpacity(opacity ?? 0.8),
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

  Widget _drawer() => Drawer(
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
                          bool isChange = await Get.to(
                            const LocationSettingPage(),
                          );
                          if (isChange) {
                            init(
                              action: () {
                                isLoading(false);
                              },
                            );
                          }
                        },
                      ),
                      _drawerItems(
                        icon: Assets.locationSetting,
                        text: s.otherSetting,
                        onTap: () {
                          if (Core.selectLocationSettingModel.value.id != null) {
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
                          } else {
                            snackbarRed(title: s.error, subtitle: s.selectedInstallationLocation);
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
                          sendCode(DataManager.simCardInquiry);
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
                          offAll(const HomePage());
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
                          push(HelpView());
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
              )),
              Container(
                padding: const EdgeInsets.all(8),
                child: Center(
                  child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: Text(
                        "${s.version} ${Core.versionNumber}",
                        textDirection: TextDirection.ltr,
                      ).bodyMedium(color: Colors.red)),
                ),
              )
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
              image(
                icon,
                width: 22,
                color: context.theme.dividerColor.withOpacity(0.8),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                width: 1,
                height: 24,
                color: context.theme.focusColor.withOpacity(0.2),
              ),
              Expanded(
                child: Text(text).bodyMedium(fontSize: 14),
              ),
            ],
          ),
        ),
      );
}
