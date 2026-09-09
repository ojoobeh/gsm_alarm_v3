import 'dart:convert';
import 'dart:io';

import 'package:bestdroid/app/extensions/extension.dart';
import 'package:bestdroid/app/models/model_device/device.dart';
import 'package:bestdroid/app/models/part/part.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:bestdroid/app/core/core.dart';
import 'package:bestdroid/app/models/code_list/code.dart';
import 'package:bestdroid/app/models/code_list/tb_code_list.dart';
import 'package:bestdroid/app/models/data_manager.dart';
import 'package:bestdroid/app/models/location_setting/location_settings.dart';
import 'package:bestdroid/app/view/utils/local_storage.dart';
import 'package:bestdroid/app/widgets/widgets.dart';
import 'package:bestdroid/generated/l10n.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
export 'package:flutter/material.dart';

export 'package:get/get_utils/src/extensions/context_extensions.dart';
export 'package:bestdroid/app/core/core.dart';
export 'package:bestdroid/app/core/get.dart';
export 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart' as per;
import 'package:url_launcher/url_launcher.dart';

part 'constants.dart';

part 'utils.dart';

part 'theme.dart';

part 'futures.dart';

class Core {
  static Rx<DeviceModel> selectDeviceModel = DeviceModel().obs;
  static Color baseColor = const Color(0xffdedede);
  static String defaultLocal = 'fa';
  static const String ip = "192.168.1.4";
  static const int port = 2468;
  final int sdkVersion = 34;
  static List<DeviceModel> deviceModelList = <DeviceModel>[
    DeviceModel(id: 1, model: Core.model1, selected: 1, hasMultiPart: 1, hasWifi: 0),
    DeviceModel(id: 2, model: Core.model2, selected: 0, hasMultiPart: 1, hasWifi: 0),
    DeviceModel(id: 3, model: Core.model3, selected: 0, hasMultiPart: 1, hasWifi: 0),
    // DeviceModel(id: 4, model: Core.model4, selected: 0, hasMultiPart: 1, hasWifi: 1),
  ];
  static List<PartModel> partModelList = <PartModel>[
    PartModel(id: 0, title: s.generalPart),
    PartModel(id: 1, title: s.part1),
    PartModel(id: 2, title: s.part2),
  ];

  static String versionNumber = '2.5.1';
  static String model1 = 'P3000';
  static String model2 = 'P3008';
  static String model3 = 'HITEC';

  // static String model2 = 'L55';
  // static String model3 = 'F55';
  // static String model4 = 'N55';
  static TbCodeModel tbCodeModel = TbCodeModel(
    title: '',
    id: 1,
    list: [
      ///********************** HOME *************************/
      CodeModel(
        id: 2,
        title: DataManager.off,
        model1: '*PASS*80#',
        model2: '*PASS*80#',
        model3: '*PASS*80#',
      ),
      CodeModel(
        id: 1,
        title: DataManager.on,
        model1: '*PASS*81#',
        model2: '*PASS*81#',
        model3: '*PASS*81#',
      ),

      CodeModel(
        id: 3,
        title: DataManager.partSet,
        model1: '*PASS*82#',
        model2: '*PASS*82#',
        model3: '*PASS*82#',
      ),
      CodeModel(
        id: 33,
        title: DataManager.onP1,
        model1: '*PASS*83#',
        model2: '*PASS*83#',
        model3: '*PASS*83#',
      ),
      CodeModel(
        id: 34,
        title: DataManager.offP1,
        model1: '*PASS*84#',
        model2: '*PASS*84#',
        model3: '*PASS*84#',
      ),
      CodeModel(
        id: 35,
        title: DataManager.onP2,
        model1: '*PASS*85#',
        model2: '*PASS*85#',
        model3: '*PASS*85#',
      ),
      CodeModel(
        id: 36,
        title: DataManager.offP2,
        model1: '*PASS*86#',
        model2: '*PASS*86#',
        model3: '*PASS*86#',
      ),
      CodeModel(
        id: 7,
        title: DataManager.chargeCode,
        model1: '*PASS*25#SHARGE#',
        model2: '*PASS*25#SHARGE#',
        model3: '*PASS*25#SHARGE#',
      ),
      CodeModel(
        id: 4,
        title: DataManager.simCardInquiry,
        model1: '*PASS*26#',
        model2: '*PASS*26#',
        model3: '*PASS*26#',
      ),
      CodeModel(
        id: 5,
        title: DataManager.stopDialing,
        model1: '*PASS*88#',
        model2: '*PASS*88#',
        model3: '*PASS*88#',
      ),

      CodeModel(
        id: 6,
        title: DataManager.deviceReport,
        model1: '*PASS*87#',
        model2: '*PASS*87#',
        model3: '*PASS*87#',
      ),
      CodeModel(
        id: 58,
        title: DataManager.emergencySiren,
        model1: '*PASS*99#',
        model2: '*PASS*99#',
        model3: '*PASS*99#',
      ),

      ///********************** OTHERSETTING 1 *************************/
      CodeModel(
        id: 13,
        title: DataManager.deleteRemoteNumber,
        model1: '*PASS*47#VAL#',
        model2: '*PASS*47#VAL#',
        model3: '*PASS*47#VAL#',
      ),
      CodeModel(
        id: 9,
        title: DataManager.insertToMemory,
        model1: '*PASS*MEMORY#PHONE#',
        model2: '*PASS*MEMORY#PHONE#',
        model3: '*PASS*MEMORY#PHONE#',
      ),
      CodeModel(
        id: 10,
        title: DataManager.deleteFromMemory,
        model1: '*PASS*MEMORY##',
        model2: '*PASS*MEMORY##',
      ),
      CodeModel(
        id: 11,
        title: DataManager.showMemory,
        model1: '*PASS*MEMORY#',
        model2: '*PASS*MEMORY#',
      ),
      CodeModel(
        id: 12,
        title: DataManager.callPriority, //پیشفرض تماس یا پیام
        model1: '*PASS*30#VAL#',
        model2: '*PASS*30#VAL#',
      ),
      CodeModel(
        id: 27,
        title: DataManager.setZoneSetting, //کنترل زون ها
        model1: '*PASS*49#XY#',
        model2: '*PASS*49#XY#',
      ),

      ///********************** OTHERSETTING 2 *************************/
      CodeModel(
        id: 14,
        title: DataManager.alarmSilentExternalSpeaker, //گزارش قطع بلندگو
        model1: '*PASS*43#VAL#',
        model2: '*PASS*43#VAL#',
      ),
      CodeModel(
        id: 15,
        title: DataManager.alarmOnOffPower, //گزارش قطع برق
        model1: '*PASS*42#VAL#',
        model2: '*PASS*42#VAL#',
      ),
      CodeModel(
        id: 18,
        title: DataManager.alarmOnOffSmsReceivingReport, //ارسال گزارش تحویل اس ام اس
        model1: '*PASS*33#VAL#',
        model2: '*PASS*33#VAL#',
      ),
      CodeModel(
        id: 16,
        title: DataManager.alarmOnOffConfidental, //ارسال گزارش روشن و خاموش شدن دزدگیر
        model1: '*PASS*34#VAL#',
        model2: '*PASS*34#VAL#',
      ),
      CodeModel(
        id: 31,
        title: DataManager.selectSimType, //انتخاب اپراتور
        model1: '*PASS*32#VAL#',
        model2: '*PASS*32#VAL#',
      ),

      ///********************** OTHERSETTING 3 *************************/
      CodeModel(
        id: 19,
        title: DataManager.setupStimulationType, //نوع تحریک
        model1: '*PASS*29#VAL#',
        model2: '*PASS*29#VAL#',
      ),
      CodeModel(
        id: 20,
        title: DataManager.setupLanguageSMS, //زبان ارسال پیام
        model1: '*PASS*31#VAL#',
        model2: '*PASS*31#VAL#',
      ),
      CodeModel(
        id: 21,
        title: DataManager.defaultDialingSystem, //پیشفرض سیستم شماره گیری
        model1: '*PASS*36#VAL#',
        model2: '*PASS*36#VAL#',
      ),
      CodeModel(
        id: 22,
        title: DataManager.remoteControl, //کنترل از راه دور
        model1: '*PASS*37#VAL#',
        model2: '*PASS*37#VAL#',
      ),
      CodeModel(
        id: 23,
        title: DataManager.setAlarmTime, //مدت زمان آژیر
        model1: '*PASS*40#VAL#',
        model2: '*PASS*40#VAL#',
      ),
      CodeModel(
        id: 24,
        title: DataManager.singleSirenSetting, //نوع تک آژیر
        model1: '*PASS*41#VAL#',
        model2: '*PASS*41#VAL#',
      ),
      CodeModel(
        id: 26,
        title: DataManager.setArrivalTime, //زمان ورود و خروج
        model1: '*PASS*39#VAL#',
        model2: '*PASS*39#VAL#',
      ),
      CodeModel(
        id: 26,
        title: DataManager.changeTheBurglarAlarmPassword, //*تغییر پسورد
        model1: '*PASS*27#NEWPASS#',
        model2: '*PASS*27#NEWPASS#',
      ),
      CodeModel(
        id: 30,
        title: DataManager.changeZoneName,
        model1: '*PASS*NUMBER#PARAM#',
        model2: '*PASS*NUMBER#PARAM#',
      ),

      ///********************** OTHERSETTING 4 *************************/
      CodeModel(
        id: 26,
        title: DataManager.typeOfFixedLineDialing, //نوع شماره گیری خط ثابت
        model1: '*PASS*35#VAL#',
        model2: '*PASS*35#VAL#',
      ),
      CodeModel(
        id: 26,
        title: DataManager.turnTheDialerOnAndOff, //روشن و خاموش کردن تلفن کننده
        model1: '*PASS*38#VAL#',
        model2: '*PASS*38#VAL#',
      ),
      CodeModel(
        id: 26,
        title: DataManager.singleSirenWhenSemiActivated, //تک آژیر هنگام نیمه فعال شدن
        model1: '*PASS*45#VAL#',
        model2: '*PASS*45#VAL#',
      ),
      CodeModel(
        id: 26,
        title: DataManager.output1AsADoorOpener, //خروجی 1 به عنوان درب بازکن
        model1: '*PASS*44#VAL#',
        model2: '*PASS*44#VAL#',
      ),
      CodeModel(
        id: 26,
        title: DataManager.deviceShutdownReport, //گزارش خاموش ماندن دستگاه
        model1: '*PASS*46#VAL#',
        model2: '*PASS*46#VAL#',
      ),
      CodeModel(
        id: 26,
        title: DataManager.twoStageShutdown, //خاموش کردن دو مرحله ای ( حفاظت مضاعف )
        model1: '*PASS*50#VAL#',
        model2: '*PASS*50#VAL#',
      ),

      ///********************** OUTPUT *************************/
      CodeModel(
        id: 26,
        title: DataManager.output, //روشن شدن خودکار
        model1: '*PASS*48#IDSTATUS#',
        model2: '*PASS*48#IDSTATUS#',
      ),

      CodeModel(
        id: 26,
        title: DataManager.output, //روشن شدن خودکار
        model1: '*PASS*48#IDSTATUS#',
        model2: '*PASS*48#IDSTATUS#',
      ),

      // CodeModel(
      //   id: 29,
      //   title: DataManager.setVolumeSingleAlarm,
      //   model1: '-',
      //   model2: '*PASS*46#2VAL#',
      //   model3: '*PASS*46#2VAL#',
      //   model4: '-',
      // ),

      //
      //
      //
      // CodeModel(
      //   id: 8,
      //   title: DataManager.output,
      //   model1: '*PASS*48#IDSTATUS#',
      //   model2: '*PASS*43#IDSTATUS#',
      // ),
      //
      //
      // CodeModel(
      //   id: 17,
      //   title: DataManager.changePasswordCentral,
      //   model1: '*PASS*27#NEWPASS#',
      //   model2: '*PASS*26#NEWPASS#',
      //   model3: '*PASS*26#NEWPASS#',
      //   model4: '*PASS*26#NEWPASS#',
      // ),
      //
      //
      //
      // CodeModel(
      //   id: 45,
      //   title: DataManager.outputDorOpen,
      //   model1: '*PASS*44#VAL#',
      //   model2: '*PASS*45#VAL#',
      //   model3: '*PASS*45#VAL#',
      //   model4: '-',
      // ),
      // CodeModel(
      //   id: 50,
      //   title: DataManager.alarmOnOffSimCardSharg2,
      //   model1: '-',
      //   model2: '*PASS*31#VAL#',
      //   model3: '*PASS*31#VAL#',
      //   model4: '-',
      // ),
      //
      //
      // CodeModel(
      //   id: 1,
      //   title: DataManager.on,
      //   model1: '*PASS*81#',
      //   model2: '*PASS*51#',
      //   model3: '*PASS*51#',
      //   model4: '*PASS*51#',
      // ),
      // CodeModel(
      //   id: 2,
      //   title: DataManager.off,
      //   model1: '*PASS*80#',
      //   model2: '*PASS*50#',
      //   model3: '*PASS*50#',
      //   model4: '*PASS*50#',
      // ),
      // CodeModel(
      //   id: 3,
      //   title: DataManager.partSet,
      //   model1: '*PASS*82#',
      //   model2: '*PASS*52#',
      //   model3: '*PASS*52#',
      //   model4: '-',
      // ),
      // CodeModel(
      //   id: 4,
      //   title: DataManager.simCardInquiry,
      //   model1: '*PASS*24#',
      //   model2: '*PASS*24#',
      //   model3: '*PASS*24#',
      //   model4: '*PASS*24#',
      // ),
      // CodeModel(
      //   id: 5,
      //   title: DataManager.stopDialing,
      //   model1: '*PASS*88#',
      //   model2: '*PASS*54#',
      //   model3: '*PASS*54#',
      //   model4: '-',
      // ),
      // CodeModel(
      //   id: 6,
      //   title: DataManager.deviceReport,
      //   model1: '*PASS*87#',
      //   model2: '*PASS*53#',
      //   model3: '*PASS*53#',
      //   model4: '*PASS*53#',
      // ),
      // CodeModel(
      //   id: 7,
      //   title: DataManager.chargeCode,
      //   model1: '*PASS*25#SHARGE#',
      //   model2: '*PASS*23#SHARGE#',
      //   model3: '*PASS*23#SHARGE#',
      //   model4: '*PASS*23#SHARGE#',
      // ),
      // CodeModel(
      //   id: 8,
      //   title: DataManager.output,
      //   model1: '*PASS*48#IDSTATUS#',
      //   model2: '*PASS*43#IDSTATUS#',
      //   model3: '*PASS*43#IDSTATUS#',
      //   model4: '*PASS*IDSTATUS#',
      // ),
      // CodeModel(
      //   id: 9,
      //   title: DataManager.insertToMemory,
      //   model1: '*PASS*MEMORY#PHONE#',
      //   model2: '*PASS*MEMORY#PHONE#',
      //   model3: '*PASS*MEMORY#PHONE#',
      //   model4: '*PASS*MEMORY#PHONE#',
      // ),
      // CodeModel(
      //   id: 10,
      //   title: DataManager.deleteFromMemory,
      //   model1: '*PASS*MEMORY##',
      //   model2: '*PASS*MEMORY##',
      //   model3: '*PASS*MEMORY##',
      //   model4: '*PASS*MEMORY##',
      // ),
      // CodeModel(
      //   id: 11,
      //   title: DataManager.showMemory,
      //   model1: '*PASS*MEMORY#',
      //   model2: '*PASS*MEMORY#',
      //   model3: '*PASS*MEMORY#',
      //   model4: '*PASS*MEMORY#',
      // ),
      // CodeModel(
      //   id: 12,
      //   title: DataManager.callPriority,
      //   model1: '*PASS*30#VAL#',
      //   model2: '*PASS*28#VAL#',
      //   model3: '*PASS*28#VAL#',
      //   model4: '-',
      // ),
      // CodeModel(
      //   id: 13,
      //   title: DataManager.deleteRemoteNumber,
      //   model1: '*PASS*47#VAL#',
      //   model2: '*PASS*42#VAL#',
      //   model3: '*PASS*42#VAL#',
      //   model4: '*PASS*42#VAL#',
      // ),
      // CodeModel(
      //   id: 14,
      //   title: DataManager.alarmSilentExternalSpeaker,
      //   model1: '*PASS*43#VAL#',
      //   model2: '*PASS*39#VAL#',
      //   model3: '*PASS*39#VAL#',
      //   model4: '-',
      // ),
      // CodeModel(
      //   id: 15,
      //   title: DataManager.alarmOnOffPower,
      //   model1: '*PASS*42#VAL#',
      //   model2: '*PASS*40#VAL#',
      //   model3: '*PASS*40#VAL#',
      //   model4: '-',
      // ),
      // CodeModel(
      //   id: 16,
      //   title: DataManager.alarmOnOffConfidental,
      //   model1: '*PASS*34#VAL#',
      //   model2: '*PASS*34#VAL#',
      //   model3: '*PASS*34#VAL#',
      //   model4: '-',
      // ),
      // CodeModel(
      //   id: 17,
      //   title: DataManager.changePasswordCentral,
      //   model1: '*PASS*27#NEWPASS#',
      //   model2: '*PASS*26#NEWPASS#',
      //   model3: '*PASS*26#NEWPASS#',
      //   model4: '*PASS*26#NEWPASS#',
      // ),
      // CodeModel(
      //     id: 18,
      //     title: DataManager.alarmOnOffSmsReceivingReport,
      //     model1: '*PASS*33#VAL#',
      //     model2: '*PASS*33#VAL#',
      //     model3: '*PASS*33#VAL#',
      //     model4: '-,
      // ),
      // CodeModel(
      //   id: 19,
      //   title: DataManager.setupStimulationType,
      //   model1: '*PASS*29#VAL#',
      //   model2: '*PASS*27#VAL#',
      //   model3: '*PASS*27#VAL#',
      //   model4: '-',
      // ),
      // CodeModel(
      //   id: 20,
      //   title: DataManager.setupLanguageSMS,
      //   model1: '*PASS*31#VAL#',
      //   model2: '*PASS*30#VAL#',
      //   model3: '*PASS*30#VAL#',
      //   model4: '-',
      // ),
      // CodeModel(
      //   id: 21,
      //   title: DataManager.defaultDialingSystem,
      //   model1: '*PASS*36#VAL#',
      //   model2: '*PASS*29#VAL#',
      //   model3: '*PASS*29#VAL#',
      //   model4: '-',
      // ),
      // CodeModel(
      //   id: 22,
      //   title: DataManager.remoteControl,
      //   model1: '*PASS*37#VAL#',
      //   model2: '*PASS*35#VAL#',
      //   model3: '*PASS*35#VAL#',
      //   model4: '-',
      // ),
      // CodeModel(
      //   id: 23,
      //   title: DataManager.setAlarmTime,
      //   model1: '*PASS*40#VAL#',
      //   model2: '*PASS*47#VAL#',
      //   model3: '*PASS*47#VAL#',
      //   model4: '-',
      // ),
      // CodeModel(
      //   id: 24,
      //   title: DataManager.singleSirenSetting,
      //   model1: '*PASS*41#VAL#',
      //   model2: '*PASS*37#VAL#',
      //   model3: '*PASS*37#VAL#',
      //   model4: '-',
      // ),
      // CodeModel(
      //   id: 25,
      //   title: DataManager.adjustTheTypeOfDingDong,
      //   model1: '-',
      //   model2: '*PASS*41#VAL#',
      //   model3: '*PASS*41#VAL#',
      //   model4: '-',
      // ),
      // CodeModel(
      //   id: 26,
      //   title: DataManager.setArrivalTime,
      //   model1: '*PASS*39#VAL#',
      //   model2: '*PASS*38#VAL#',
      //   model3: '*PASS*38#VAL#',
      //   model4: '-',
      // ),
      // CodeModel(
      //   id: 27,
      //   title: DataManager.setZoneSetting,
      //   model1: '*PASS*49#XY#',
      //   model2: '*PASS*44#XY#',
      //   model3: '*PASS*44#XY#',
      //   model4: '-',
      // ),
      // CodeModel(
      //   id: 29,
      //   title: DataManager.setVolumeSingleAlarm,
      //   model1: '-',
      //   model2: '*PASS*46#2VAL#',
      //   model3: '*PASS*46#2VAL#',
      //   model4: '-',
      // ),
      // CodeModel(
      //   id: 30,
      //   title: DataManager.changeZoneName,
      //   model1: '*PASS*6NUMBER#PARAM#',
      //   model2: '*PASS*6NUMBER#PARAM#',
      //   model3: '*PASS*6NUMBER#PARAM#',
      //   model4: '-',
      // ),
      // CodeModel(
      //   id: 31,
      //   title: DataManager.selectSimType,
      //   model1: '*PASS*32#VAL#',
      //   model2: '*PASS*32#VAL#',
      //   model3: '*PASS*32#VAL#',
      //   model4: '*PASS*32#VAL#',
      // ),
      // CodeModel(
      //   id: 33,
      //   title: DataManager.onP1,
      //   model1: '*PASS*83#',
      //   model2: '-',
      //   model3: '*PASS*81#',
      //   model4: '-',
      // ),
      // CodeModel(
      //   id: 34,
      //   title: DataManager.offP1,
      //   model1: '*PASS*84#',
      //   model2: '-',
      //   model3: '*PASS*82#',
      //   model4: '-',
      // ),
      // CodeModel(
      //   id: 35,
      //   title: DataManager.onP2,
      //   model1: '*PASS*85#',
      //   model2: '-',
      //   model3: '*PASS*84#',
      //   model4: '-',
      // ),
      // CodeModel(
      //   id: 36,
      //   title: DataManager.offP2,
      //   model1: '*PASS*86#',
      //   model2: '-',
      //   model3: '*PASS*85#',
      //   model4: '-',
      // ),
      // CodeModel(
      //   id: 45,
      //   title: DataManager.outputDorOpen,
      //   model1: '*PASS*44#VAL#',
      //   model2: '*PASS*45#VAL#',
      //   model3: '*PASS*45#VAL#',
      //   model4: '-',
      // ),
      // CodeModel(
      //   id: 50,
      //   title: DataManager.alarmOnOffSimCardSharg2,
      //   model1: '-',
      //   model2: '*PASS*31#VAL#',
      //   model3: '*PASS*31#VAL#',
      //   model4: '-',
      // ),
      // CodeModel(
      //   id: 54,
      //   title: DataManager.changeRemoteName,
      //   model1: '-',
      //   model2: '*PASS*7NUMBER#PARAM#',
      //   model3: '*PASS*7NUMBER#PARAM#',
      //   model4: '-',
      // ),
      // CodeModel(
      //   id: 55,
      //   //+
      //   title: DataManager.zone24H2Step,
      //   model1: '-',
      //   model2: '*PASS*36#VAL#',
      //   model3: '*PASS*36#VAL#',
      //   model4: '-',
      // ),
      // CodeModel(
      //   id: 56,
      //   //+
      //   title: DataManager.partSetP1,
      //   model1: '-',
      //   model2: '-',
      //   model3: '*PASS*83#',
      //   model4: '-',
      // ),
      // CodeModel(
      //   id: 57,
      //   //+
      //   title: DataManager.partSetP2,
      //   model1: '-',
      //   model2: '-',
      //   model3: '*PASS*86#',
      //   model4: '-',
      // ),
      // CodeModel(
      //   id: 58,
      //   title: DataManager.emergency,
      //   model1: '*PASS*99#',
      //   model2: '*PASS*80#',
      //   model3: '*PASS*80#',
      //   model4: '-',
      // ),

      // CodeModel(
      //   id: 20,
      //   title: DataManager.setupLanguageSMS,
      //   model1: '*PASS*29#VAL#',
      //   model2: '*PASS*29#VAL#',
      //   model3: '*PASS*29#VAL#',
      //   model4: '*PASS*29#VAL#',
      // ),
      // CodeModel(
      //   id: 21,
      //   title: DataManager.defaultDialingSystem,
      //   model1: '*PASS*34#VAL#',
      //   model2: '*PASS*34#VAL#',
      //   model3: '*PASS*34#VAL#',
      //   model4: '-',
      // ),
      // CodeModel(
      //   id: 22,
      //   title: DataManager.remoteControl,
      //   model1: '*PASS*35#VAL#',
      //   model2: '*PASS*35#VAL#',
      //   model3: '*PASS*35#VAL#',
      //   model4: '*PASS*35#VAL#',
      // ),
      // CodeModel(
      //   id: 23,
      //   title: DataManager.setAlarmTime,
      //   model1: '*PASS*38#VAL#',
      //   model2: '*PASS*38#VAL#',
      //   model3: '*PASS*38#VAL#',
      //   model4: '*PASS*38#VAL#',
      // ),
      // CodeModel(
      //   id: 24,
      //   title: DataManager.singleSirenSetting,
      //   model1: '*PASS*39#VAL#',
      //   model2: '*PASS*39#VAL#',
      //   model3: '*PASS*39#VAL#',
      //   model4: '*PASS*39#VAL#',
      // ),
      // CodeModel(
      //   id: 25,
      //   title: DataManager.adjustTheTypeOfDingDong,
      //   model1: '-',
      //   model2: '-',
      //   model3: '-',
      //   model4: '-',
      // ),
      // CodeModel(
      //   id: 26,
      //   title: DataManager.setArrivalTime,
      //   model1: '*PASS*37#VAL#',
      //   model2: '*PASS*37#VAL#',
      //   model3: '*PASS*37#VAL#',
      //   model4: '*PASS*37#VAL#',
      // ),
      // CodeModel(
      //   id: 27,
      //   title: DataManager.setZoneSetting,
      //   model1: '*PASS*44#XY#',
      //   model2: '*PASS*44#XY#',
      //   model3: '*PASS*44#XY#',
      //   model4: '*PASS*44#XY#',
      // ),
      // CodeModel(
      //   id: 29,
      //   title: DataManager.setVolumeSingleAlarm,
      //   model1: '-',
      //   model2: '-',
      //   model3: '-',
      //   model4: '-',
      // ),
      // CodeModel(
      //   id: 30,
      //   title: DataManager.changeZoneName,
      //   model1: '*PASS*9NUMBER#PARAM#',
      //   model2: '*PASS*9NUMBER#PARAM#',
      //   model3: '*PASS*9NUMBER#PARAM#',
      //   model4: '*PASS*9NUMBER#PARAM#',
      // ),
      // CodeModel(
      //   id: 31,
      //   title: DataManager.selectSimType,
      //   model1: '*PASS*30#VAL#',
      //   model2: '*PASS*30#VAL#',
      //   model3: '*PASS*30#VAL#',
      //   model4: '*PASS*30#VAL#',
      // ),
      // CodeModel(
      //   id: 33,
      //   title: DataManager.onP1,
      //   model1: '*PASS*63#',
      //   model2: '*PASS*63#',
      //   model3: '*PASS*63#',
      //   model4: '*PASS*63#',
      // ),
      // CodeModel(
      //   id: 34,
      //   title: DataManager.offP1,
      //   model1: '*PASS*64#',
      //   model2: '*PASS*64#',
      //   model3: '*PASS*64#',
      //   model4: '*PASS*64#',
      // ),
      // CodeModel(
      //   id: 35,
      //   title: DataManager.onP2,
      //   model1: '*PASS*65#',
      //   model2: '*PASS*65#',
      //   model3: '*PASS*65#',
      //   model4: '*PASS*65#',
      // ),
      // CodeModel(
      //   id: 36,
      //   title: DataManager.offP2,
      //   model1: '*PASS*66#',
      //   model2: '*PASS*66#',
      //   model3: '*PASS*66#',
      //   model4: '*PASS*66#',
      // ),
      // CodeModel(
      //   id: 59,
      //   title: DataManager.onP3,
      //   model1: '*PASS*67#',
      //   model2: '*PASS*67#',
      //   model3: '*PASS*67#',
      //   model4: '*PASS*67#',
      // ),
      // CodeModel(
      //   id: 60,
      //   title: DataManager.offP3,
      //   model1: '*PASS*68#',
      //   model2: '*PASS*68#',
      //   model3: '*PASS*68#',
      //   model4: '*PASS*68#',
      // ),
      // CodeModel(
      //   id: 61,
      //   title: DataManager.onP4,
      //   model1: '*PASS*69#',
      //   model2: '*PASS*69#',
      //   model3: '*PASS*69#',
      //   model4: '*PASS*69#',
      // ),
      // CodeModel(
      //   id: 62,
      //   title: DataManager.onP4,
      //   model1: '*PASS*70#',
      //   model2: '*PASS*70#',
      //   model3: '*PASS*70#',
      //   model4: '*PASS*70#',
      // ),
      // CodeModel(
      //   id: 62,
      //   title: DataManager.emergencySiren,
      //   model1: '*PASS*70#',
      //   model2: '*PASS*70#',
      //   model3: '*PASS*70#',
      //   model4: '*PASS*70#',
      // ),
      // CodeModel(
      //   id: 45,
      //   title: DataManager.outputDorOpen,
      //   model1: '*PASS*45#VAL#',
      //   model2: '*PASS*45#VAL#',
      //   model3: '*PASS*45#VAL#',
      //   model4: '*PASS*45#VAL#',
      // ),
      // CodeModel(
      //   id: 50,
      //   title: DataManager.alarmOnOffSimCardSharg2,
      //   model1: '*PASS*82#VAL#',
      //   model2: '*PASS*82#VAL#',
      //   model3: '*PASS*82#VAL#',
      //   model4: '*PASS*82#VAL#',
      // ),
    ],
  );

  static Rx<LocationSettingModel> selectLocationSettingModel = LocationSettingModel().obs;

  static String automaticSmsLocationName = 'automaticSmsLocationName';
  static String automaticSmsLocationPhone = 'automaticSmsLocationPhone';
  static String automaticSmsLocationPassword = 'automaticSmsLocationPassword';
  static String automaticSmsLocationSelectedPartId = 'automaticSmsLocationSelectedPartId';
}

// void sendMessage(String key) {
//   if (Core.selectLocationSettingModel.value.id != null) {
//     String code = '';
//     if (Core.selectLocationSettingModel.value.modelType == DataManager.getDeviceModelList().first.id) {
//       code = Core.tbCodeModel.list!.where((element) => element.title == key).toList().first.model1 ?? '';
//     } else {
//       code = Core.tbCodeModel.list!.where((element) => element.title == key).toList().first.model2 ?? '';
//     }
//     sendMessage2(code);
//   } else {
//     snackbarRed(title: s.error, subtitle: s.pleaseSelectDeviceModel);
//   }
// }
DeviceModel getModelSelected() {
  DeviceModel res = DeviceModel();
  List<DeviceModel> ff = Core.deviceModelList;
  int modelType = Core.selectLocationSettingModel.value.modelType ?? 1;
  res = ff[modelType - 1];
  return res;
}
