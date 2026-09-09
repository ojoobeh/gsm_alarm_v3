import 'package:bestdroid/app/view/location_setting/location_setting_page.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:bestdroid/app/core/core.dart';
import 'package:bestdroid/app/models/data_manager.dart';
import 'package:bestdroid/app/models/model_device/device.dart';
import 'package:bestdroid/app/view/utils/local_storage.dart';
import 'package:local_auth/local_auth.dart';
import 'package:permission_handler/permission_handler.dart';

mixin SplashController {
  TextEditingController passwordController = TextEditingController();

  LocalAuthentication auth = LocalAuthentication();
  RxBool canCheckBiometric = false.obs;

  RxList<BiometricType> availableBiometric = <BiometricType>[].obs;
  RxString autherized = "Not autherized".obs;

  Future<void> insertDeviceModel({required VoidCallback action}) async {
    // List<DeviceModel> list = await DataManager.getDeviceModelList();
    // if (list.isEmpty) {
    //   // await DataManager.insertDeviceModel(DeviceModel(id: 1, model: Core.model1, selected: 1, countMultiPart: 0, hasWifi: 0));
    //   await DataManager.insertDeviceModel(DeviceModel(id: 2, model: Core.model2, selected: 0, countMultiPart: 2, hasWifi: 0));
    //   // await DataManager.insertDeviceModel(DeviceModel(id: 3, model: Core.model3, selected: 0, countMultiPart: 6, hasWifi: 0));
    //   await DataManager.insertDeviceModel(DeviceModel(id: 4, model: Core.model4, selected: 0, countMultiPart: 8, hasWifi: 0));
    // }
    // list = await DataManager.getDeviceModelL
    // Core.deviceModelList=list;
    action();
  }

  Future<void> getVersion({required final VoidCallback action}) async {
    final deviceInfo = DeviceInfoPlugin();

    if (GetPlatform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      // Core.sdkVersion=androidInfo.version.sdkInt;
    }

    action();
  }

  // Future<void> insertOutputModel({required VoidCallback action}) async {
  //   List list = await DataManager.getOutputModelList();
  //   if (list.isEmpty) {
  //     for (int i = 0; i < 24; i++) {
  //       await DataManager.insertOutputModel(OutputModel(
  //         id: i + 1,
  //         title: "${s.output} ${i + 1}",
  //         code: i + 1,
  //         status: 0,
  //         isMomentary: 0,
  //       ));
  //     }
  //   }
  //   action();
  // }

  Future<void> login() async {
    if (passwordController.text == (getString(DataManager.password) ?? AppConstants.defaultLoginPassword)) {
      offAll(const LocationSettingPage());
    } else {
      snackbarRed(title: s.error, subtitle: s.wrongPassword);
    }

    // if (isWeb || isIos || Core.sdkVersion>34) {
    //   if (passwordController.text == (getString(DataManager.password) ?? AppConstants.defaultLoginPassword)) {
    //     push(const LocationSettingPage());
    //   } else {
    //     snackbarRed(title: s.error, subtitle: s.wrongPassword);
    //   }
    //
    // }else{
    //   var status = await Permission.sms.status;
    //   if (status.isDenied) {
    //     Permission.sms.request();
    //   } else {
    //     if (passwordController.text == (getString(DataManager.password) ?? AppConstants.defaultLoginPassword)) {
    //       offAll(const LocationSettingPage());
    //     } else {
    //       snackbarRed(title: s.error, subtitle: s.wrongPassword);
    //     }
    //   }
    // }
  }

  // Future<void> checkParam() async {
  //   if (getBool(DataManager.biometricEnable)) {
  //     await checkBiometric();
  //     await getAvailableBiometrics();
  //     authenticate();
  //   }
  // }

  // Future<void> checkBiometric() async {
  //   bool _canCheckBiometric = false;
  //   try {
  //     _canCheckBiometric = await auth.canCheckBiometrics;
  //   } on PlatformException catch (e) {
  //     print(e);
  //   }
  //   canCheckBiometric(_canCheckBiometric);
  // }
  //
  // Future<void> getAvailableBiometrics() async {
  //   List<BiometricType> _availableBiometric = [];
  //   try {
  //     _availableBiometric = await auth.getAvailableBiometrics();
  //   } on PlatformException catch (e) {
  //     debugPrint(e.toString());
  //   }
  //
  //   availableBiometric(_availableBiometric);
  // }

  Future<void> authenticate() async {
    bool _authenticated = false;
    try {
      _authenticated = await auth.authenticate(localizedReason: s.scanYourFingerForAuthentication, options: const AuthenticationOptions(biometricOnly: true));
      debugPrint("DDDDDD");
      // _authenticated = await auth.authenticate(
      //     localizedReason: "برای احراز هویت انگشت خود را اسکن کنید",
      //     na: AndroidAuthMessages(
      //       cancelButton: 'انصراف',
      //       fingerprintHint: '',
      //       signInTitle: 'اسکن اثر انگشت',
      //       fingerprintSuccess: 'fingerprintSuccess',
      //       fingerprintNotRecognized: 'fingerprintNotRecoسیبیبیgnized',
      //       fingerprintRequiredTitle: 'fingerprintRequiredTitle',
      //       goToSettingsButton: 'goToSettingsButton',
      //       goToSettingsDescription: 'goToSettingsDescription',
      //     ),
      //     useErrorDialogs: true,
      //     stickyAuth: false);
    } on PlatformException catch (e) {
      print(e);
    }

    autherized.value = _authenticated ? "Autherized success" : "Failed to authenticate";
    // autherized.value == "Autherized success" ? push(HomePage()) : null;
  }
}
