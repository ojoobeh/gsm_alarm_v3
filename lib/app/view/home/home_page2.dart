// import 'package:bestdroid/app/models/code_list/code.dart';
// import 'package:bestdroid/app/models/location_setting/location_settings.dart';
// import 'package:bestdroid/app/view/splash/splash_page.dart';
// import 'package:bestdroid/new/core/buttonSheet.dart';
// import 'package:flutter/services.dart';
// import 'package:bestdroid/app/core/assets.dart';
// import 'package:bestdroid/app/core/core.dart';
// import 'package:bestdroid/app/extensions/extension.dart';
// import 'package:bestdroid/app/models/data_manager.dart';
// import 'package:bestdroid/app/view/home/home_controller.dart';
// import 'package:bestdroid/app/view/location_setting/location_setting_page.dart';
// import 'package:bestdroid/app/view/other_setting/other_setting_view.dart';
// import 'package:bestdroid/app/view/outputs/outputs_page.dart';
// import 'package:bestdroid/app/view/utils/local_storage.dart';
// import 'package:bestdroid/app/widgets/widgets.dart';
//
// class HomePage2 extends StatefulWidget {
//   const HomePage2({super.key});
//
//   @override
//   State<HomePage2> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage2> with HomeController {
//   @override
//   void initState() {
//     init(
//       action: () {
//         isLoading(false);
//       },
//     );
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return PopScope(
//       canPop: false,
//       onPopInvokedWithResult: (didPop, result) {
//         if (scaffoldKey.currentState!.isDrawerOpen) {
//           Navigator.pop(context); // closes the drawer if opened
//         } else {
//           exitDialog();
//         }
//       },
//       child: Scaffold(
//         extendBodyBehindAppBar: false,
//         backgroundColor: Colors.white,
//         body: SafeArea(
//           child: Center(
//             child: Container(
//               constraints: const BoxConstraints(maxWidth: 500),
//               child: Scaffold(
//                 resizeToAvoidBottomInset: false,
//                 key: scaffoldKey,
//                 backgroundColor: context.theme.scaffoldBackgroundColor,
//                 drawer: _drawer(),
//                 body: Stack(
//                   children: [
//                     image(Assets.homeBackground, width: Get.width, fit: BoxFit.cover),
//                     _body(),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _items({
//     required final VoidCallback onTap,
//     required final String param,
//     required final String iconData,
//     double? width,
//     String? code,
//     Color? color,
//     Color? textColor,
//   }) => (code ?? '') != '-'
//       ? SizedBox(
//           height: 110,
//           width: width ?? (screenWidth / 2) - 20, //
//           child: Card(
//             color: color ?? context.theme.primaryColor,
//             child:
//                 Container(
//                   margin: const EdgeInsets.only(top: 8),
//                   color: color ?? context.theme.primaryColor,
//                   // style: NeumorphicStyle(
//                   //   color:color!=0?Color(color): context.theme.primaryColor,
//                   //   shape: NeumorphicShape.convex,
//                   //   boxShape:
//                   //   NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
//                   // ),
//                   padding: const EdgeInsets.all(12.0),
//                   child: Stack(
//                     children: [
//                       Center(child: image(iconData, width: 48, color: (textColor ?? context.theme.scaffoldBackgroundColor).withOpacity(0.2))),
//                       Center(
//                         child: Text(
//                           param,
//                           style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: textColor ?? context.theme.scaffoldBackgroundColor),
//                         ).marginOnly(bottom: 8),
//                       ),
//                     ],
//                   ),
//                 ).onTap(() {
//                   if (code != null) {
//                     if (Core.selectLocationSettingModel.value.id != null) {
//                       sendMessage(code);
//                     } else {
//                       snackbarRed(title: s.error, subtitle: s.pleaseSelectDeviceModel);
//                     }
//                   } else {
//                     onTap();
//                   }
//                 }),
//           ),
//         )
//       : const SizedBox();
//
//   Widget _items2({
//     final VoidCallback? onTap,
//     required final String param,
//     required final String iconData,
//     double? width,
//     CodeModel? codeModel,
//     Color? color,
//     Color? textColor,
//   }) => (codeModel != null)
//       ? Column(
//           children: [
//             Container(
//               width: 64,
//               height: 64,
//               decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color:color?? Colors.blue.withValues(alpha: 0.7)),
//               child: image(iconData,color: Colors.white).marginAll(16),
//             ),
//             Center(
//               child: Text(
//                 param,
//                 style: TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.bold,
//                   color: textColor ?? context.theme.primaryColorDark,
//                 ),
//               ).marginOnly(bottom: 8),
//             ),
//             if (10 > 50)
//               SizedBox(
//                 height: 110,
//                 width: width ?? (screenWidth / 2) - 20, //
//                 child: Card(
//                   color: color ?? context.theme.primaryColor,
//                   child: Container(
//                     margin: const EdgeInsets.only(top: 8),
//                     color: color ?? context.theme.primaryColor,
//                     // style: NeumorphicStyle(
//                     //   color:color!=0?Color(color): context.theme.primaryColor,
//                     //   shape: NeumorphicShape.convex,
//                     //   boxShape:
//                     //   NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
//                     // ),
//                     padding: const EdgeInsets.all(12.0),
//                     child: Stack(
//                       children: [
//                         Center(child: image(iconData, width: 48, color: (textColor ?? context.theme.scaffoldBackgroundColor).withOpacity(0.2))),
//                         Center(
//                           child: Text(
//                             param,
//                             style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: textColor ?? context.theme.scaffoldBackgroundColor),
//                           ).marginOnly(bottom: 8),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//           ],
//         ).onTap(() {
//           if (onTap == null) {
//             if (Core.selectLocationSettingModel.value.id != null) {
//               sendCode2(codeModel);
//             } else {
//               snackbarRed(title: s.error, subtitle: s.pleaseSelectDeviceModel);
//             }
//           } else {
//             onTap();
//           }
//         })
//       : const SizedBox();
//
//   Widget _drawer() => Drawer(
//     child: Container(
//       padding: const EdgeInsets.all(0),
//       child: Column(
//         children: [
//           image(Assets.drawerPic02),
//           Expanded(
//             child: Container(
//               margin: const EdgeInsets.all(8),
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     _drawerItems(
//                       icon: Assets.location,
//                       text: s.locationSetting,
//                       onTap: () async {
//                         bool isChange = await Get.to(const LocationSettingPage());
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
//                             push(const OtherSettingView());
//                           } else {
//                             getParamDialog(
//                               title: s.password,
//                               result: (param) {
//                                 if (param == (getString(DataManager.adminPassword) ?? '1111')) {
//                                   push(const OtherSettingView());
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
//                       },
//                     ),
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
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.all(8),
//             child: Center(
//               child: Directionality(
//                 textDirection: TextDirection.ltr,
//                 child: Text("${s.version} ${Core.versionNumber}", textDirection: TextDirection.ltr).bodyMedium(color: Colors.red),
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
//
//   Widget _drawerItems({required final String icon, required final String text, required final VoidCallback onTap}) => InkWell(
//     hoverColor: Colors.transparent,
//     onTap: onTap,
//     child: Padding(
//       padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
//       child: Row(
//         children: [
//           image(icon, width: 22, color: context.theme.dividerColor.withOpacity(0.8)),
//           Container(margin: const EdgeInsets.symmetric(horizontal: 12), width: 1, height: 24, color: context.theme.focusColor.withOpacity(0.2)),
//           Expanded(child: Text(text).bodyMedium(fontSize: 14)),
//         ],
//       ),
//     ),
//   );
//
//   void sendCode2(CodeModel message, {String? extra}) {
//     String code = getCode2(message);
//     if (extra != null) {
//       code = '$code$extra';
//     }
//     if (Core.selectLocationSettingModel.value.id != null) {
//       sendMessage(code);
//     } else {
//       snackbarRed(title: s.error, subtitle: s.pleaseSelectDeviceModel);
//     }
//   }
//
//   Widget _appBar() => SizedBox(
//     height: 100,
//     child: Center(
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             children: [
//               image(Assets.menu, color: context.theme.primaryColorDark, width: 32).marginOnly(right: 16, left: 16).onTap(() {
//                 // html.window.parent?.postMessage("close_clicked", "*");
//                 scaffoldKey.currentState!.openDrawer();
//               }),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(s.appName),
//                   const SizedBox(height: 8),
//                   Obx(
//                     () => Core.selectLocationSettingModel.value.id != null ? Text(Core.selectLocationSettingModel.value.modelName ?? '') : const SizedBox(),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           Container(
//             margin: const EdgeInsets.only(left: 16),
//             child: CircleAvatar(
//               backgroundColor: Core.baseColor,
//               radius: 34,
//               child: Image.asset(Assets.logo, fit: BoxFit.fill).marginAll(8),
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
//
//   Widget _row1() => Row(
//     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//     children: [
//       _items2(
//         codeModel: Core.on,
//         param: s.onSecurity,
//         iconData: Assets.alarmOn,
//         color: const Color(0xff590271),
//         // onTap: () async {
//         //   sendCode2(Core.on);
//         // },
//       ),
//       _items2(
//         codeModel: Core.off,
//         param: s.offSecurity,
//         iconData: Assets.alarmOff,
//         color: const Color(0xff590271),
//         // onTap: () async {
//         //   sendCode2(Core.off);
//         // },
//       ),
//
//       _items2(
//         codeModel: Core.partSet,
//         param: s.partSet,
//         iconData: Assets.touch,
//         color: const Color(0xff590271),
//         onTap: () async {
//           sendCode2(Core.off);
//         },
//       ),
//     ],
//   );
//
//   Widget _row2() => Row(
//     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//     children: [
//       _items2(
//         codeModel: Core.turnOnMute,
//         param: s.turnOnMute,
//         iconData: Assets.alarmOn,
//         color: const Color(0xff590271),
//       ),
//       _items2(
//         codeModel: Core.turnOffMute,
//         param: s.turnOffMute,
//         iconData: Assets.alarmOff,
//         color: const Color(0xff0019b9),
//       ), //
//     ],
//   );
//
//   Widget _row3() => Row(
//     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//     children: [
//       _items2(
//         codeModel: Core.onPart,
//         param: s.onPart,
//         iconData: Assets.alarmOn,
//         color: const Color(0xff590271),
//         onTap: () {
//           baseButtonSheet(
//             context: context,
//             child: _itemParts(),
//           );
//         },
//       ),
//       _items2(
//         codeModel: Core.offPart,
//         param: s.offPart,
//         iconData: Assets.alarmOff,
//         color: const Color(0xff0019b9),
//         onTap: () {},
//       ), //
//     ],
//   );
//
//   Widget _row4() => Row(
//     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//     children: [
//       _items2(
//         codeModel: Core.chargeCode,
//         param: s.chargeCode,
//         iconData: Assets.simcard2,
//         color: const Color(0xff122747),
//         onTap: () async {
//           getParamDialog(
//             title: s.chargeCode,
//             result: (param) {
//               if (Core.selectLocationSettingModel.value.id != null) {
//                 getParamDialog(
//                   title: s.chargeCode,
//                   inputType: TextInputType.number,
//                   result: (param) {
//                     back();
//                     Future.delayed(const Duration(milliseconds: 1000), () {
//                       simCardCharge(param);
//                       setState(() {
//                         // Here you can write your code for open new view
//                       });
//                     });
//                   },
//                 );
//               } else {
//                 snackbarRed(title: s.error, subtitle: s.pleaseSelectDeviceModel);
//               }
//             },
//           );
//         },
//       ),
//
//       // _items2(
//       //   codeModel: Core.turnOffMute,
//       //   param: s.turnOffMute,
//       //   iconData: Assets.alarmOff,
//       //   color: const Color(0xff0019b9),
//       // ), //
//       _items2(
//         codeModel: Core.deviceReport,
//         param: s.deviceReport,
//         color: const Color(0xff503f3e),
//         iconData: Assets.info,
//       ),
//
//       _items2(
//         codeModel: (Core.simCardInquiry),
//         param: s.simCardInquiry,
//         iconData: Assets.simCard,
//         color: const Color(0xffff6601),
//       ),
//     ],
//   );
//
//   Widget _row5() => Row(
//     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//     children: [
//       _items2(
//         codeModel: Core.output,
//         param: s.output,
//         iconData: Assets.output,
//         color: const Color(0xff1b3401),
//         onTap: () {
//           if (Core.selectLocationSettingModel.value.id != null) {
//             push(const OutputsPage());
//           } else {
//             snackbarRed(title: s.error, subtitle: s.selectedInstallationLocation);
//           }
//         },
//       ),
//
//       Obx(
//         () =>
//             (Core.selectLocationSettingModel.value.id != null && Core.selectLocationSettingModel.value.modelType != 1 && Core.selectLocationSettingModel.value.modelType != 2)
//             ? _items2(
//                 codeModel: (Core.semiMute),
//                 param: s.semiMute,
//                 iconData: Assets.touch,
//                 width: screenWidth - 35,
//                 color: const Color(0xFF944600),
//               )
//             : Container(),
//       ),
//       _items2(
//         param: s.stopDialing,
//         width: screenWidth - 35,
//         iconData: Assets.stop,
//         color: const Color(0xff5e601B),//
//         codeModel: (Core.stopDialing),
//       ),
//     ],
//   );
//
//   Widget _body() => Obx(
//     () => !isLoading.value
//         ? ListView(
//             children: [
//               // _appBar(),
//               _setting(),
//               Container(
//                 margin: const EdgeInsets.symmetric(horizontal: 16),
//                 child: Column(
//                   children: [
//                     _row1(),
//                     _row2(),
//                     _row3(),
//                     _row4(),
//                     _row5(),
//                   ],
//                 ),
//               ),
//             ],
//           )
//         : const Center(child: CircularProgressIndicator()),
//   );
//
//   Widget _setting() => SizedBox(
//     height: 100,
//     child: PopupMenuButton<int>(
//       icon: Container(
//         margin: const EdgeInsets.only(top: 8, right: 6, left: 6),
//         height: 50,
//         decoration: BoxDecoration(
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.5),
//               spreadRadius: 1,
//               blurRadius: 1,
//               offset: const Offset(0, 1), // changes position of shadow
//             ),
//           ],
//           color: const Color(0xFF74aeac),
//           borderRadius: const BorderRadius.only(topRight: Radius.circular(16), topLeft: Radius.circular(16)),
//         ),
//         width: (MediaQuery.of(context).size.width) - 10,
//         child: Center(
//           child: Obx(() {
//             return !isLoading.value && selectLocationSettingModel.value.name != null
//                 ? Text(selectLocationSettingModel.value.name ?? '').bodyMedium()
//                 : Text(s.selectedInstallationLocation).bodyMedium(color: Colors.white);
//           }),
//         ),
//         //     .onTap(() async {
//         //   bool isChange = await Get.to(const LocationSettingPage());
//         //   if (isChange) {
//         //     init(
//         //       action: () {
//         //         isLoading(false);
//         //       },
//         //     );
//         //   }
//         // }
//         // ),
//       ),
//       offset: const Offset(0, 40), // 👈 باز شدن زیر آیکن
//       onSelected: (int value) async {
//         selectLocationSettingModel(locationSettingList[value]);
//         await DataManager.resetLocationSettingSelected(selectLocationSettingModel.value.id ?? 0);
//         init(action: () => setState(() {}));
//       },
//       itemBuilder: (context) =>
//           locationSettingList.mapIndexed((index, LocationSettingModel item) => PopupMenuItem<int>(value: index, child: Text(item.name ?? '').bodyLarge())).toList(),
//     ),
//   );
//
//   Widget _itemParts() => Column(
//     spacing: 8,
//     children: [
//       Text('پارت خود را انتخاب کنید').titleLarge(color: AppColors.primary),
//       Divider(
//         endIndent: 16,
//         indent: 16,
//       ),
//
//       Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           _itemPart(part: 1).onTap(() => sendCode2(Core.onPart, extra: '1#')),
//           _itemPart(part: 2).onTap(() => sendCode2(Core.onPart, extra: '2#')),
//           _itemPart(part: 3).onTap(() => sendCode2(Core.onPart, extra: '3#')),
//           _itemPart(part: 4).onTap(() => sendCode2(Core.onPart, extra: '4#')),
//         ],
//       ),
//       Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           _itemPart(part: 5).onTap(() => sendCode2(Core.onPart, extra: '5#')),
//           _itemPart(part: 6).onTap(() => sendCode2(Core.onPart, extra: '6#')),
//           _itemPart(part: 7).onTap(() => sendCode2(Core.onPart, extra: '7#')),
//           _itemPart(part: 8).onTap(() => sendCode2(Core.onPart, extra: '8#')),
//         ],
//       ),
//     ],
//   );
//
//   Widget _itemPart({required int part}) => Container(
//     decoration: BoxDecoration(
//       border: Border.all(color: Colors.black.withValues(alpha: 0.5)),
//       borderRadius: BorderRadius.circular(8),
//     ),
//     padding: EdgeInsets.all(8),
//     child: Text('پارت $part').bodyLarge(),
//   );
// }
