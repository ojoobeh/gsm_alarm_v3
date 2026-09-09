import 'package:bestdroid/app/core/assets.dart';
import 'package:bestdroid/app/core/core.dart';
import 'package:bestdroid/app/extensions/extension.dart';
import 'package:bestdroid/app/view/home/home_controller.dart';
import 'package:bestdroid/app/view/location_setting/location_setting_page.dart';
import 'package:bestdroid/app/widgets/widgets.dart';

class HomeSettingPage extends StatefulWidget {
  const HomeSettingPage({required this.title, super.key});

  final String title;

  @override
  State<HomeSettingPage> createState() => _HomeSettingPageState();
}

class _HomeSettingPageState extends State<HomeSettingPage> with HomeController {
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
      appBar: AppBar(
        leading: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          alignment: Alignment.centerRight,
          child: Icon(Icons.menu_outlined, color: context.theme.primaryColorDark, size: 32).onTap(() {
            scaffoldKey.currentState!.openDrawer();
          }),
        ),
        actions: [Center(child: Text(widget.title).bodyLarge()).marginSymmetric(horizontal: 8)],
        title: Obx(() {
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
        centerTitle: true,
      ),
      // drawer: _drawer(),
      body: Stack(
        children: [
          SizedBox(width: screenWidth, child: image(Assets.backgroundImage, fit: BoxFit.cover)),
          Container(
            color: Colors.brown.withOpacity(0.6),
            width: screenWidth,
            height: screenHeight,
          ),
          Obx(() => !isLoading.value
              ? const Column(
                  children: [
                    // Container(
                    //   color: context.theme.scaffoldBackgroundColor,
                    //   width: screenWidth,
                    //   height: 50,
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       Container(
                    //         padding: const EdgeInsets.symmetric(horizontal: 8),
                    //         alignment: Alignment.centerRight,
                    //         child: Icon(Icons.menu_outlined, color: context.theme.primaryColorDark, size: 32).onTap(() {
                    //           scaffoldKey.currentState!.openDrawer();
                    //         }),
                    //       ),
                    //       Container(
                    //         alignment: Alignment.center,
                    //         child: Center(
                    //           child: Obx(() {
                    //             return !isLoading.value && selectLocationSettingModel.value.name != null
                    //                 ? Text(
                    //               selectLocationSettingModel.value.name ?? '',
                    //             ).displayLarge()
                    //                 : Text(s.installationLocation).displayLarge();
                    //           }),
                    //         ).onTap(() async {
                    //           bool isChange = await Get.to(
                    //             const LocationSettingPage(),
                    //           );
                    //           if (isChange) {
                    //             init(
                    //               action: () {
                    //                 isLoading(false);
                    //               },
                    //             );
                    //           }
                    //         }),
                    //       ).expanded(),
                    //       SizedBox(
                    //         child: Text(widget.title).bodyLarge().marginSymmetric(horizontal: 16),
                    //       ),
                    //     ],
                    //   ),
                    // ),//

                  ],
                )
              : const Center(
                  child: CircularProgressIndicator(),
                )),
        ],
      ),
    );
  }

  // Widget  _item({double? width, double? height, double? opacity, required Color color, required IconData icon, required String title}) => Container(
  //        padding: const EdgeInsets.symmetric(vertical: 8),
  //        margin: const EdgeInsets.symmetric(vertical: 8),
  //        width: width,
  //        height: height,
  //        decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: Colors.white.withOpacity(opacity ?? 0.8)),
  //        child: Column(
  //          mainAxisAlignment: MainAxisAlignment.center,
  //          children: [
  //            Icon(
  //              icon,
  //              size: 36,
  //              color: color,
  //            ),
  //            Text(title).bodyLarge(fontSize: 16, color: color),
  //          ],
  //        ),
  //      );


  // Widget _drawer() => Drawer(
  //       child: Container(
  //         padding: const EdgeInsets.all(0),
  //         child: Column(
  //           children: [
  //             image(Assets.drawerPic02),
  //             Expanded(
  //                 child: Container(
  //               margin: const EdgeInsets.all(8),
  //               child: SingleChildScrollView(
  //                 child: Column(
  //                   children: [
  //                     _drawerItems(
  //                       icon: Assets.location,
  //                       text: s.locationSetting,
  //                       onTap: () async {
  //                         bool isChange = await Get.to(
  //                           const LocationSettingPage(),
  //                         );
  //                         if (isChange) {
  //                           init(
  //                             action: () {
  //                               isLoading(false);
  //                             },
  //                           );
  //                         }
  //                       },
  //                     ),
  //                     _drawerItems(
  //                       icon: Assets.locationSetting,
  //                       text: s.otherSetting,
  //                       onTap: () {
  //                         if (Core.selectLocationSettingModel.value.id != null) {
  //                           if (isDebugMode) {
  //                             push(OtherSettingView());
  //                           } else {
  //                             getParamDialog(
  //                               title: s.password,
  //                               inputType: TextInputType.number,
  //                               result: (param) {
  //                                 if (param == (getString(DataManager.adminPassword) ?? AppConstants.defaultAdminPassword)) {
  //                                   push(OtherSettingView());
  //                                 } else {
  //                                   snackbarRed(title: s.warning, subtitle: s.wrongPassword);
  //                                 }
  //                               },
  //                             );
  //                           }
  //                         } else {
  //                           snackbarRed(title: s.error, subtitle: s.selectedInstallationLocation);
  //                         }
  //
  //                         // Get.toNamed(Routes.LOCATIONSETTING);
  //                       },
  //                     ),
  //                     _drawerItems(
  //                       icon: Assets.language,
  //                       text: s.language,
  //                       onTap: () {
  //                         if (Get.locale == const Locale("fa")) {
  //                           Get.updateLocale(const Locale("en"));
  //                           setData("locale", "en");
  //                         } else {
  //                           Get.updateLocale(const Locale("fa"));
  //                           setData("locale", "fa");
  //                         }
  //
  //                         offAll(const HomePage());
  //                       },
  //                     ),
  //                     ////////////////////////////////////
  //
  //                     _drawerItems(
  //                       icon: Assets.language,
  //                       text: s.chargeIncrease,
  //                       onTap: () {
  //                         getParamDialog(
  //                           title: s.chargeCode,
  //                           inputType: TextInputType.number,
  //                           result: (param) {
  //                             back();
  //                             Future.delayed(const Duration(milliseconds: 1000), () {
  //                               simCardCharge(param);
  //                               setState(() {
  //                                 // Here you can write your code for open new view
  //                               });
  //                             });
  //                           },
  //                         );
  //                       },
  //                     ),
  //                     _drawerItems(
  //                       icon: Assets.language,
  //                       text: s.remainingCharge,
  //                       onTap: () {
  //                         sendCode(DataManager.simCardInquiry);
  //                       },
  //                     ),
  //
  //                     _drawerItems(
  //                       icon: Assets.reset,
  //                       text: s.reset,
  //                       onTap: () {
  //                         showYesOrNoDialog(
  //                           title: s.warning,
  //                           description: s.sureReset,
  //                           action: () {
  //                             clearData();
  //                             Get.offAll(const SplashPage());
  //                           },
  //                         );
  //                       },
  //                     ),
  //                     // _drawerItems(
  //                     //   icon: Assets.info,
  //                     //   text: s.lastVersion,
  //                     //   onTap: () {
  //                     //     showYesOrNoDialog(
  //                     //       title: s.lastVersion,
  //                     //       description: s.lastVersionIsAvailable,
  //                     //       action: () {
  //                     //
  //                     //       },
  //                     //     );
  //                     //   },
  //                     // ),
  //                   ],
  //                 ),
  //               ),
  //             )),
  //             Container(
  //               padding: const EdgeInsets.all(8),
  //               child: Center(
  //                 child: Directionality(
  //                     textDirection: TextDirection.ltr,
  //                     child: Text(
  //                       "${s.version} ${Core.versionNumber}",
  //                       textDirection: TextDirection.ltr,
  //                     ).bodyMedium(color: Colors.red)),
  //               ),
  //             )
  //           ],
  //         ),
  //       ),
  //     );

  // Widget _drawerItems({required final String icon, required final String text, required final VoidCallback onTap}) => InkWell(
  //       hoverColor: Colors.transparent,
  //       onTap: onTap,
  //       child: Padding(
  //         padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
  //         child: Row(
  //           children: [
  //             image(
  //               icon,
  //               width: 22,
  //               color: context.theme.dividerColor.withOpacity(0.8),
  //             ),
  //             Container(
  //               margin: const EdgeInsets.symmetric(horizontal: 12),
  //               width: 1,
  //               height: 24,
  //               color: context.theme.focusColor.withOpacity(0.2),
  //             ),
  //             Expanded(
  //               child: Text(text).bodyMedium(fontSize: 14),
  //             ),
  //           ],
  //         ),
  //       ),
  //     );
}
