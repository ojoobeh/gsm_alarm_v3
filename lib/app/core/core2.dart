// import 'dart:convert';
// import 'dart:io';
//
// import 'package:bestdroid/app/extensions/extension.dart';
// import 'package:bestdroid/app/models/model_device/device.dart';
// import 'package:bestdroid/app/models/part/part.dart';
// import 'package:device_info_plus/device_info_plus.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:bestdroid/app/core/core.dart';
// import 'package:bestdroid/app/models/code_list/code.dart';
// import 'package:bestdroid/app/models/code_list/tb_code_list.dart';
// import 'package:bestdroid/app/models/data_manager.dart';
// import 'package:bestdroid/app/models/location_setting/location_settings.dart';
// import 'package:bestdroid/app/view/utils/local_storage.dart';
// import 'package:bestdroid/app/widgets/widgets.dart';
// import 'package:bestdroid/generated/l10n.dart';
// import 'package:flutter/services.dart';
// import 'package:get_storage/get_storage.dart';
// export 'package:flutter/material.dart';
//
// export 'package:get/get_utils/src/extensions/context_extensions.dart';
// export 'package:bestdroid/app/core/core.dart';
// export 'package:bestdroid/app/core/get.dart';
// export 'package:get/get.dart';
// import 'package:permission_handler/permission_handler.dart' as per;
// import 'package:url_launcher/url_launcher.dart';
//
// // part 'constants.dart';
// //
// // part 'utils.dart';
// //
// // part 'theme.dart';
// //
// // part 'futures.dart';
//
// class Core {
//   static Rx<DeviceModel> selectDeviceModel = DeviceModel().obs;
//   static Color baseColor = const Color(0xffdedede);
//   static String defaultLocal = 'fa';
//   static const String ip = "192.168.1.4";
//   static const int port = 2468;
//   final int sdkVersion = 34;
//   static List<DeviceModel> deviceModelList = <DeviceModel>[
//     DeviceModel(id: 1, model: Core.model1, selected: 1, hasMultiPart: 1, hasWifi: 0),
//     DeviceModel(id: 2, model: Core.model2, selected: 0, hasMultiPart: 1, hasWifi: 0),
//     DeviceModel(id: 3, model: Core.model3, selected: 0, hasMultiPart: 1, hasWifi: 0),
//     // DeviceModel(id: 4, model: Core.model4, selected: 0, hasMultiPart: 1, hasWifi: 1),
//   ];
//   static List<PartModel> partModelList = <PartModel>[PartModel(id: 0, title: s.generalPart), PartModel(id: 1, title: s.part1), PartModel(id: 2, title: s.part2)];
//
//   static String versionNumber = '2.5.1';
//   static String model1 = 'P3000';
//   static String model2 = 'P3008';
//   static String model3 = 'HITEC';
//
//   ///*********************************************************/
//
//   static CodeModel off = CodeModel(id: 2, title: DataManager.off, model1: '*PASS*80#', model2: '*PASS*80#', model3: '*PASS*80#');
//   static CodeModel on = CodeModel(id: 1, title: DataManager.on, model1: '*PASS*81#', model2: '*PASS*81#', model3: '*PASS*81#');
//   static CodeModel partSet = CodeModel(id: 3, title: DataManager.partSet, model1: '*PASS*82#', model2: '*PASS*82#', model3: '*PASS*82#');
//   static CodeModel onP1 = CodeModel(id: 33, title: DataManager.onP1, model1: '*PASS*83#', model2: '*PASS*83#', model3: '*PASS*83#');
//   static CodeModel offP1 = CodeModel(id: 34, title: DataManager.offP1, model1: '*PASS*84#', model2: '*PASS*84#', model3: '*PASS*84#');
//   static CodeModel onP2 = CodeModel(id: 35, title: DataManager.onP2, model1: '*PASS*85#', model2: '*PASS*85#', model3: '*PASS*85#');
//   static CodeModel offP2 = CodeModel(id: 36, title: DataManager.offP2, model1: '*PASS*86#', model2: '*PASS*86#', model3: '*PASS*86#');
//   static CodeModel chargeCode = CodeModel(id: 7, title: DataManager.chargeCode, model1: '*PASS*25#SHARGE#', model2: '*PASS*25#SHARGE#', model3: '*PASS*25#SHARGE#');
//   static CodeModel simCardInquiry = CodeModel(id: 4, title: DataManager.simCardInquiry, model1: '*PASS*26#', model2: '*PASS*26#', model3: '*PASS*26#');
//   static CodeModel stopDialing = CodeModel(id: 5, title: DataManager.stopDialing, model1: '*PASS*88#', model2: '*PASS*88#', model3: '*PASS*88#');
//   static CodeModel deviceReport = CodeModel(id: 6, title: DataManager.deviceReport, model1: '*PASS*87#', model2: '*PASS*87#', model3: '*PASS*87#');
//   static CodeModel emergencySiren = CodeModel(id: 58, title: DataManager.emergencySiren, model1: '*PASS*99#', model2: '*PASS*99#', model3: '*PASS*99#');
//
//   ///********************** OTHERSETTING 1 *************************/
//   static CodeModel deleteRemoteNumber = CodeModel(id: 13, title: DataManager.deleteRemoteNumber, model1: '*PASS*47#VAL#', model2: '*PASS*47#VAL#', model3: '*PASS*47#VAL#');
//   static CodeModel insertToMemory = CodeModel(
//     id: 9,
//     title: DataManager.insertToMemory,
//     model1: '*PASS*MEMORY#PHONE#',
//     model2: '*PASS*MEMORY#PHONE#',
//     model3: '*PASS*MEMORY#PHONE#',
//   );
//   static CodeModel deleteFromMemory = CodeModel(id: 10, title: DataManager.deleteFromMemory, model1: '*PASS*MEMORY##', model2: '*PASS*MEMORY##');
//   static CodeModel showMemory = CodeModel(id: 11, title: DataManager.showMemory, model1: '*PASS*MEMORY#', model2: '*PASS*MEMORY#');
//   static CodeModel callPriority = CodeModel(id: 12, title: DataManager.callPriority, model1: '*PASS*30#VAL#', model2: '*PASS*30#VAL#');
//   static CodeModel setZoneSetting = CodeModel(id: 27, title: DataManager.setZoneSetting, model1: '*PASS*49#XY#', model2: '*PASS*49#XY#');
//
//   ///********************** OTHERSETTING 2 *************************/
//   static CodeModel alarmSilentExternalSpeaker = CodeModel(
//     id: 14,
//     title: DataManager.alarmSilentExternalSpeaker, //گزارش قطع بلندگو
//     model1: '*PASS*43#VAL#',
//     model2: '*PASS*43#VAL#',
//   );
//   static CodeModel alarmOnOffPower = CodeModel(
//     id: 15,
//     title: DataManager.alarmOnOffPower, //گزارش قطع برق
//     model1: '*PASS*42#VAL#',
//     model2: '*PASS*42#VAL#',
//   );
//   static CodeModel alarmOnOffSmsReceivingReport = CodeModel(
//     id: 18,
//     title: DataManager.alarmOnOffSmsReceivingReport, //ارسال گزارش تحویل اس ام اس
//     model1: '*PASS*33#VAL#',
//     model2: '*PASS*33#VAL#',
//   );
//   static CodeModel alarmOnOffConfidental = CodeModel(
//     id: 16,
//     title: DataManager.alarmOnOffConfidental, //ارسال گزارش روشن و خاموش شدن دزدگیر
//     model1: '*PASS*34#VAL#',
//     model2: '*PASS*34#VAL#',
//   );
//   static CodeModel selectSimType = CodeModel(
//     id: 31,
//     title: DataManager.selectSimType, //انتخاب اپراتور
//     model1: '*PASS*32#VAL#',
//     model2: '*PASS*32#VAL#',
//   );
//
//   ///********************** OTHERSETTING 3 *************************/
//   static CodeModel setupStimulationType = CodeModel(
//     id: 19,
//     title: DataManager.setupStimulationType, //نوع تحریک
//     model1: '*PASS*29#VAL#',
//     model2: '*PASS*29#VAL#',
//   );
//   static CodeModel setupLanguageSMS = CodeModel(
//     id: 20,
//     title: DataManager.setupLanguageSMS, //زبان ارسال پیام
//     model1: '*PASS*31#VAL#',
//     model2: '*PASS*31#VAL#',
//   );
//   static CodeModel defaultDialingSystem = CodeModel(
//     id: 21,
//     title: DataManager.defaultDialingSystem, //پیشفرض سیستم شماره گیری
//     model1: '*PASS*36#VAL#',
//     model2: '*PASS*36#VAL#',
//   );
//   static CodeModel remoteControl = CodeModel(
//     id: 22,
//     title: DataManager.remoteControl, //کنترل از راه دور
//     model1: '*PASS*37#VAL#',
//     model2: '*PASS*37#VAL#',
//   );
//   static CodeModel setAlarmTime = CodeModel(
//     id: 23,
//     title: DataManager.setAlarmTime, //مدت زمان آژیر
//     model1: '*PASS*40#VAL#',
//     model2: '*PASS*40#VAL#',
//   );
//   static CodeModel singleSirenSetting = CodeModel(
//     id: 24,
//     title: DataManager.singleSirenSetting, //نوع تک آژیر
//     model1: '*PASS*41#VAL#',
//     model2: '*PASS*41#VAL#',
//   );
//   static CodeModel setArrivalTime = CodeModel(
//     id: 26,
//     title: DataManager.setArrivalTime, //زمان ورود و خروج
//     model1: '*PASS*39#VAL#',
//     model2: '*PASS*39#VAL#',
//   );
//   static CodeModel changeTheBurglarAlarmPassword = CodeModel(
//     id: 26,
//     title: DataManager.changeTheBurglarAlarmPassword, //*تغییر پسورد
//     model1: '*PASS*27#NEWPASS#',
//     model2: '*PASS*27#NEWPASS#',
//   );
//   static CodeModel changeZoneName = CodeModel(id: 30, title: DataManager.changeZoneName, model1: '*PASS*NUMBER#PARAM#', model2: '*PASS*NUMBER#PARAM#');
//
//   ///********************** OTHERSETTING 4 *************************/
//   static CodeModel typeOfFixedLineDialing = CodeModel(
//     id: 26,
//     title: DataManager.typeOfFixedLineDialing, //نوع شماره گیری خط ثابت
//     model1: '*PASS*35#VAL#',
//     model2: '*PASS*35#VAL#',
//   );
//   static CodeModel turnTheDialerOnAndOff = CodeModel(
//     id: 26,
//     title: DataManager.turnTheDialerOnAndOff, //روشن و خاموش کردن تلفن کننده
//     model1: '*PASS*38#VAL#',
//     model2: '*PASS*38#VAL#',
//   );
//   static CodeModel singleSirenWhenSemiActivated = CodeModel(
//     id: 26,
//     title: DataManager.singleSirenWhenSemiActivated, //تک آژیر هنگام نیمه فعال شدن
//     model1: '*PASS*45#VAL#',
//     model2: '*PASS*45#VAL#',
//   );
//   static CodeModel output1AsADoorOpener = CodeModel(
//     id: 26,
//     title: DataManager.output1AsADoorOpener, //خروجی 1 به عنوان درب بازکن
//     model1: '*PASS*44#VAL#',
//     model2: '*PASS*44#VAL#',
//   );
//   static CodeModel deviceShutdownReport = CodeModel(
//     id: 26,
//     title: DataManager.deviceShutdownReport, //گزارش خاموش ماندن دستگاه
//     model1: '*PASS*46#VAL#',
//     model2: '*PASS*46#VAL#',
//   );
//   static CodeModel twoStageShutdown = CodeModel(
//     id: 26,
//     title: DataManager.twoStageShutdown, //خاموش کردن دو مرحله ای ( حفاظت مضاعف )
//     model1: '*PASS*50#VAL#',
//     model2: '*PASS*50#VAL#',
//   );
//
//   static CodeModel output = CodeModel(
//     id: 26,
//     title: DataManager.output, //روشن شدن خودکار
//     model1: '*PASS*48#IDSTATUS#',
//     model2: '*PASS*48#IDSTATUS#',
//   );
//
//   static TbCodeModel tbCodeModel = TbCodeModel(
//     title: '',
//     id: 1,
//     list: [
//       ///********************** HOME *************************/
//       CodeModel(id: 2, title: DataManager.off, model1: '*PASS*80#', model2: '*PASS*80#', model3: '*PASS*80#'),
//       CodeModel(id: 1, title: DataManager.on, model1: '*PASS*81#', model2: '*PASS*81#', model3: '*PASS*81#'),
//       CodeModel(id: 3, title: DataManager.partSet, model1: '*PASS*82#', model2: '*PASS*82#', model3: '*PASS*82#'),
//       CodeModel(id: 33, title: DataManager.onP1, model1: '*PASS*83#', model2: '*PASS*83#', model3: '*PASS*83#'),
//       CodeModel(id: 34, title: DataManager.offP1, model1: '*PASS*84#', model2: '*PASS*84#', model3: '*PASS*84#'),
//       CodeModel(id: 35, title: DataManager.onP2, model1: '*PASS*85#', model2: '*PASS*85#', model3: '*PASS*85#'),
//       CodeModel(id: 36, title: DataManager.offP2, model1: '*PASS*86#', model2: '*PASS*86#', model3: '*PASS*86#'),
//       CodeModel(id: 7, title: DataManager.chargeCode, model1: '*PASS*25#SHARGE#', model2: '*PASS*25#SHARGE#', model3: '*PASS*25#SHARGE#'),
//       CodeModel(id: 4, title: DataManager.simCardInquiry, model1: '*PASS*26#', model2: '*PASS*26#', model3: '*PASS*26#'),
//       CodeModel(id: 5, title: DataManager.stopDialing, model1: '*PASS*88#', model2: '*PASS*88#', model3: '*PASS*88#'),
//       CodeModel(id: 6, title: DataManager.deviceReport, model1: '*PASS*87#', model2: '*PASS*87#', model3: '*PASS*87#'),
//       CodeModel(id: 58, title: DataManager.emergencySiren, model1: '*PASS*99#', model2: '*PASS*99#', model3: '*PASS*99#'),
//
//       ///********************** OTHERSETTING 1 *************************/
//       CodeModel(id: 13, title: DataManager.deleteRemoteNumber, model1: '*PASS*47#VAL#', model2: '*PASS*47#VAL#', model3: '*PASS*47#VAL#'),
//       CodeModel(id: 9, title: DataManager.insertToMemory, model1: '*PASS*MEMORY#PHONE#', model2: '*PASS*MEMORY#PHONE#', model3: '*PASS*MEMORY#PHONE#'),
//       CodeModel(id: 10, title: DataManager.deleteFromMemory, model1: '*PASS*MEMORY##', model2: '*PASS*MEMORY##'),
//       CodeModel(id: 11, title: DataManager.showMemory, model1: '*PASS*MEMORY#', model2: '*PASS*MEMORY#'),
//       CodeModel(
//         id: 12,
//         title: DataManager.callPriority, //پیشفرض تماس یا پیام
//         model1: '*PASS*30#VAL#',
//         model2: '*PASS*30#VAL#',
//       ),
//       CodeModel(
//         id: 27,
//         title: DataManager.setZoneSetting, //کنترل زون ها
//         model1: '*PASS*49#XY#',
//         model2: '*PASS*49#XY#',
//       ),
//
//       ///********************** OTHERSETTING 2 *************************/
//       CodeModel(
//         id: 14,
//         title: DataManager.alarmSilentExternalSpeaker, //گزارش قطع بلندگو
//         model1: '*PASS*43#VAL#',
//         model2: '*PASS*43#VAL#',
//       ),
//       CodeModel(
//         id: 15,
//         title: DataManager.alarmOnOffPower, //گزارش قطع برق
//         model1: '*PASS*42#VAL#',
//         model2: '*PASS*42#VAL#',
//       ),
//       CodeModel(
//         id: 18,
//         title: DataManager.alarmOnOffSmsReceivingReport, //ارسال گزارش تحویل اس ام اس
//         model1: '*PASS*33#VAL#',
//         model2: '*PASS*33#VAL#',
//       ),
//       CodeModel(
//         id: 16,
//         title: DataManager.alarmOnOffConfidental, //ارسال گزارش روشن و خاموش شدن دزدگیر
//         model1: '*PASS*34#VAL#',
//         model2: '*PASS*34#VAL#',
//       ),
//       CodeModel(
//         id: 31,
//         title: DataManager.selectSimType, //انتخاب اپراتور
//         model1: '*PASS*32#VAL#',
//         model2: '*PASS*32#VAL#',
//       ),
//
//       ///********************** OTHERSETTING 3 *************************/
//       CodeModel(
//         id: 19,
//         title: DataManager.setupStimulationType, //نوع تحریک
//         model1: '*PASS*29#VAL#',
//         model2: '*PASS*29#VAL#',
//       ),
//       CodeModel(
//         id: 20,
//         title: DataManager.setupLanguageSMS, //زبان ارسال پیام
//         model1: '*PASS*31#VAL#',
//         model2: '*PASS*31#VAL#',
//       ),
//       CodeModel(
//         id: 21,
//         title: DataManager.defaultDialingSystem, //پیشفرض سیستم شماره گیری
//         model1: '*PASS*36#VAL#',
//         model2: '*PASS*36#VAL#',
//       ),
//       CodeModel(
//         id: 22,
//         title: DataManager.remoteControl, //کنترل از راه دور
//         model1: '*PASS*37#VAL#',
//         model2: '*PASS*37#VAL#',
//       ),
//       CodeModel(
//         id: 23,
//         title: DataManager.setAlarmTime, //مدت زمان آژیر
//         model1: '*PASS*40#VAL#',
//         model2: '*PASS*40#VAL#',
//       ),
//       CodeModel(
//         id: 24,
//         title: DataManager.singleSirenSetting, //نوع تک آژیر
//         model1: '*PASS*41#VAL#',
//         model2: '*PASS*41#VAL#',
//       ),
//       CodeModel(
//         id: 26,
//         title: DataManager.setArrivalTime, //زمان ورود و خروج
//         model1: '*PASS*39#VAL#',
//         model2: '*PASS*39#VAL#',
//       ),
//       CodeModel(
//         id: 26,
//         title: DataManager.changeTheBurglarAlarmPassword, //*تغییر پسورد
//         model1: '*PASS*27#NEWPASS#',
//         model2: '*PASS*27#NEWPASS#',
//       ),
//       CodeModel(id: 30, title: DataManager.changeZoneName, model1: '*PASS*NUMBER#PARAM#', model2: '*PASS*NUMBER#PARAM#'),
//
//       ///********************** OTHERSETTING 4 *************************/
//       CodeModel(
//         id: 26,
//         title: DataManager.typeOfFixedLineDialing, //نوع شماره گیری خط ثابت
//         model1: '*PASS*35#VAL#',
//         model2: '*PASS*35#VAL#',
//       ),
//       CodeModel(
//         id: 26,
//         title: DataManager.turnTheDialerOnAndOff, //روشن و خاموش کردن تلفن کننده
//         model1: '*PASS*38#VAL#',
//         model2: '*PASS*38#VAL#',
//       ),
//       CodeModel(
//         id: 26,
//         title: DataManager.singleSirenWhenSemiActivated, //تک آژیر هنگام نیمه فعال شدن
//         model1: '*PASS*45#VAL#',
//         model2: '*PASS*45#VAL#',
//       ),
//       CodeModel(
//         id: 26,
//         title: DataManager.output1AsADoorOpener, //خروجی 1 به عنوان درب بازکن
//         model1: '*PASS*44#VAL#',
//         model2: '*PASS*44#VAL#',
//       ),
//       CodeModel(
//         id: 26,
//         title: DataManager.deviceShutdownReport, //گزارش خاموش ماندن دستگاه
//         model1: '*PASS*46#VAL#',
//         model2: '*PASS*46#VAL#',
//       ),
//       CodeModel(
//         id: 26,
//         title: DataManager.twoStageShutdown, //خاموش کردن دو مرحله ای ( حفاظت مضاعف )
//         model1: '*PASS*50#VAL#',
//         model2: '*PASS*50#VAL#',
//       ),
//
//       ///********************** OUTPUT *************************/
//       CodeModel(
//         id: 26,
//         title: DataManager.output, //روشن شدن خودکار
//         model1: '*PASS*48#IDSTATUS#',
//         model2: '*PASS*48#IDSTATUS#',
//       ),
//
//       CodeModel(
//         id: 26,
//         title: DataManager.output, //روشن شدن خودکار
//         model1: '*PASS*48#IDSTATUS#',
//         model2: '*PASS*48#IDSTATUS#',
//       ),
//     ],
//   );
//
//   static Rx<LocationSettingModel> selectLocationSettingModel = LocationSettingModel().obs;
//
//   static String automaticSmsLocationName = 'automaticSmsLocationName';
//   static String automaticSmsLocationPhone = 'automaticSmsLocationPhone';
//   static String automaticSmsLocationPassword = 'automaticSmsLocationPassword';
//   static String automaticSmsLocationSelectedPartId = 'automaticSmsLocationSelectedPartId';
// }
//
// DeviceModel getModelSelected() {
//   DeviceModel res = DeviceModel();
//   List<DeviceModel> ff = Core.deviceModelList;
//   int modelType = Core.selectLocationSettingModel.value.modelType ?? 1;
//   res = ff[modelType - 1];
//   return res;
// }
