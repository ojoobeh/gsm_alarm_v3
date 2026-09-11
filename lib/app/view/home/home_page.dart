import 'package:bestdroid/app/models/model/model.dart';
import 'package:bestdroid/app/view/home/home_emergency_page.dart';
import 'package:bestdroid/app/view/home/home_main_page.dart';
import 'package:bestdroid/app/view/home/home_output_page.dart';
import 'package:bestdroid/app/view/home/outputs_controller.dart';
import 'package:flutter/services.dart';
import 'package:bestdroid/app/core/core.dart';
import 'package:bestdroid/app/extensions/extension.dart';
import 'package:bestdroid/app/models/data_manager.dart';
import 'package:bestdroid/app/view/home/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({this.model,super.key, });

  final Model? model;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with HomeController ,OutputsController{
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentIndex = 0;

  List<Widget> listCurrentIndex = <Widget>[];
  List<NavigationModel> listCurrent = <NavigationModel>[];




  @override
  void initState() {


    init(
      action: () {

        init(
          action: () {
            get(
              action: () => isLoading(false),
            );
          },
        );

      },
    );

    listCurrent.add(NavigationModel(
      bottom: BottomNavigationBarItem(
        activeIcon:  Icon(Icons.home, color: Core.baseColor),
        icon: const Icon(Icons.home_outlined, color: Colors.black54),
        label: s.mainPage,

      ),
      page: HomeMainPage(title: s.mainPage,),
    ));
    listCurrent.add(NavigationModel(
      bottom: BottomNavigationBarItem(
        activeIcon:  Icon(Icons.output, color: Core.baseColor),
        icon: const Icon(Icons.output_outlined, color: Colors.black54),
        label: s.output,
      ),
      page: HomeOutputPage(title: s.output,model:widget.model!),
    ));
    listCurrent.add(NavigationModel(
      bottom: BottomNavigationBarItem(
        activeIcon:  Icon(Icons.radio_button_checked_sharp, color: Core.baseColor),
        icon: const Icon(Icons.radio_button_checked_sharp, color: Colors.black54),
        label: s.emergencyButtons,
      ),
      page: HomeEmergencyPage(title: s.output),
    ));

    // const OutputsPage();
    init(
      action: () {
        isLoading(false);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (_currentIndex != 0) {
          _currentIndex=0;
          setState(() {

          });
          return Future.value(false); // won't exit the app
        } else {
          if (scaffoldKey.currentState!.isDrawerOpen) {
            Navigator.pop(context); // closes the drawer if opened
            return Future.value(false); // won't exit the app
          } else {
            back();
            return Future.value(false); // won't exit the app
          }
        }
      },
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          child: SafeArea(
            child: Scaffold(
                    resizeToAvoidBottomInset: false,
                    key: scaffoldKey,
                    bottomNavigationBar: SafeArea(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 500),
                        child: Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Colors.black.withOpacity(0.35),
                                blurRadius: 10,
                                offset: const Offset(2, 1),
                              ),
                            ],
                            color: context.theme.cardColor,
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(8),
                              topLeft: Radius.circular(8),
                            ),
                          ),
                          child: BottomNavigationBar(
                            currentIndex: _currentIndex,
                            type: BottomNavigationBarType.fixed,
                            backgroundColor: context.theme.scaffoldBackgroundColor,
                            selectedFontSize: 12,
                            unselectedFontSize: 12,
                            selectedItemColor: Core.baseColor,

                            selectedLabelStyle: context.textTheme.labelLarge!.copyWith(color: Core.baseColor),
                            unselectedLabelStyle: context.textTheme.labelLarge!.copyWith(color: Core.baseColor),

                            onTap: (final int index) {
                              setState(() {
                                _currentIndex = (index);
                              });
                            },
                            items: listCurrent.map((e) => e.bottom).toList(),
                          ),
                        ),
                      ),
                    ),
                    backgroundColor: context.theme.scaffoldBackgroundColor,
                    // drawer: _drawer(),
                    body: listCurrent.map((e) => e.page).toList()[_currentIndex])
                .safeArea(),
          ),
        ),
      ),
    );
  }


  // Widget _items({
  //   required final VoidCallback onTap,
  //   required final double width,
  //   final double? height,
  //   final Color? color,
  //   final Widget? child,
  //   String? code,
  // }) =>
  //     (code ?? '') != '-'
  //         ? Container(
  //             height: height,
  //             width: width,
  //             margin: const EdgeInsets.only(top: 8),
  //             decoration: BoxDecoration(
  //               color: color ?? context.theme.cardColor,
  //               border: Border.all(color: context.theme.primaryColor, width: 2),
  //               borderRadius: BorderRadius.circular(8),
  //             ),
  //             padding: const EdgeInsets.all(8),
  //             child: child,
  //           ).onTap(() {
  //             if (code != null) {
  //               if (Core.selectLocationSettingModel.value.id != null) {
  //                 if (getBool('isWifi') ?? false) {
  //                   sendMessage(code + "W");
  //                 } else {
  //                   sendMessage(code);
  //                 }
  //               } else {
  //                 snackbarRed(title: s.error, subtitle: s.pleaseSelectDeviceModel);
  //               }
  //             } else {
  //               onTap();
  //             }
  //           })
  //         : const SizedBox();

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
  //                             push( const OtherSettingView());
  //                           } else {
  //                             getParamDialog(
  //                               title: s.password,
  //                               result: (param) {
  //                                 if (param == (getString(DataManager.adminPassword) ?? AppConstants.defaultAdminPassword)) {
  //                                   push( const OtherSettingView());
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

class NavigationModel {
  NavigationModel({required this.page, required this.bottom});

  Widget page;
  BottomNavigationBarItem bottom;
}
