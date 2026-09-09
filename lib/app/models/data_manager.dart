import 'package:bestdroid/app/models/location_setting/location_settings.dart';
import 'package:bestdroid/app/models/location_setting/tb_location_setting.dart';
import 'package:bestdroid/app/models/model_device/device.dart';
import 'package:bestdroid/app/models/model_device/tb_model_devise.dart';
import 'package:bestdroid/app/models/output/output.dart';
import 'package:bestdroid/app/models/output/tb_output.dart';
import 'package:bestdroid/app/view/utils/local_storage.dart';

class DataManager {
  /// ****************************** TBS ********************************************
  static const String _tbLocationSetting = 'locationSetting';
  static const String _tbDeviceModel = 'modelDevice';
  static const String _tbOutputModel = 'output';
  static const String adminPassword = 'adminPassword';
  static const String password = 'password';

  /// ****************************** HOME ********************************************
  static const String on = "on";
  static const String off = "off";
  static const String partSet = "partSet";
  static String onP1 = "onP1";
  static String offP1 = "OffP1";
  static String onP2 = "OnP2";
  static String offP2 = "OffP2";

  static const String simCardInquiry = "simCardInquiry";
  static const String stopDialing = "stopDialing";
  static const String chargeCode = 'chargeCode';
  static const String deviceReport = "deviceReport";
  static const String emergencySiren = 'emergencySiren';

  /// ****************************** OUTPUT ********************************************
  static const String output = 'output';

  /// ****************************** OTHER SETTING ?????? ********************************************
  static const String deleteRemoteNumber = 'deleteRemoteNumber';
  static const String insertToMemory = 'insertToMemory';
  static const String deleteFromMemory = 'deleteFromMemory';
  static const String showMemory = 'showMemory';
  static const String callPriority = 'callPriority'; //,//پیشفرض تماس یا پیام
  static const String setZoneSetting = 'setZoneSetting'; //کنترل زون ها
  // /// ****************************** OTHER SETTING PAGE 2 ********************************************
  static const String alarmSilentExternalSpeaker = 'alarmSilentExternalSpeaker'; //گزارش قطع بلندگو
  static const String alarmOnOffPower = 'alarmOnOffPower'; //گزارش قطع برق
  static const String alarmOnOffSmsReceivingReport = 'alarmOnOffSmsReceivingReport'; //ارسال گزارش تحویل اس ام اس
  static const String alarmOnOffConfidental = 'alarmOnOffConfidental'; //ارسال گزارش روشن و خاموش شدن دزدگیر
  static const String selectSimType = 'selectSimType'; //انتخاب اپراتور
  // /// ****************************** OTHER SETTING PAGE 3 ********************************************
  static const String setupStimulationType = 'setupStimulationType'; //نوع تحریک
  static const String setupLanguageSMS = 'setupLanguageSMS'; //زبان ارسال پیام
  static const String defaultDialingSystem = 'defaultDialingSystem'; //پیشفرض سیستم شماره گیری
  static const String remoteControl = 'remoteControl'; //کنترل از راه دور
  static const String setAlarmTime = 'setAlarmTime'; //مدت زمان آژیر
  static const String singleSirenSetting = 'singleSirenSetting'; //نوع تک آژیر
  static const String outputControl2WithMuteButton = 'outputControl2WithMuteButton';
  static const String setArrivalTime = 'setArrivalTime'; //زمان ورود و خروج
  static const String changeTheBurglarAlarmPassword = 'changeTheBurglarAlarmPassword'; //*تغییر پسورد
  // /// ****************************** OTHER SETTING PAGE 3 ********************************************
  static const String typeOfFixedLineDialing = 'typeOfFixedLineDialing'; //نوع شماره گیری خط ثابت
  static const String turnTheDialerOnAndOff = 'turnTheDialerOnAndOff'; //روشن و خاموش کردن تلفن کننده
  static const String singleSirenWhenSemiActivated = 'singleSirenWhenSemiActivated'; //تک آژیر هنگام نیمه فعال شدن
  static const String output1AsADoorOpener = 'output1AsADoorOpener'; //خروجی 1 به عنوان درب بازکن
  // static const String automaticPowerOn = 'automaticPowerOn';//روشن شدن خودکار
  static const String changeZoneName = 'changeZoneName'; //تغییر نام زون
  static const String deviceShutdownReport = 'deviceShutdownReport'; //گزارش خاموش ماندن دستگاه
  static const String twoStageShutdown = 'twoStageShutdown'; //خاموش کردن دو مرحله ای ( حفاظت مضاعف )

  static const String connectingTheKeypad = 'connectingTheKeypad';//اتصال کی پد
  static const String rFReceiverActivation = 'rFReceiverActivation';//فعال بودن گیرنده آر اف
  static const String simCardModuleActivation = 'simCardModuleActivation';//فعال بودن ماژول سیم کارت
  static const String sendRemainingCharge = 'sendRemainingCharge';//ارسال باقیمانده شارژ
  static const String zone13Masha = 'zone13Masha';//زون۱۳ مشاع
  static const String doubleProtection = 'doubleProtection';//حفاظت مضاعف
  static const String zone14ManualSwitch = 'zone14ManualSwitch';//سوییچ دستی زون۱۴
  static const String changingTheVolumeOfTheMainSiren = 'changingTheVolumeOfTheMainSiren';//تغییر ولوم آژیر اصلی
  static const String changingTheVolumeOfSSingleSiren = 'changingTheVolumeOfSSingleSiren';//تغییر ولوم تک آژیر
  static const String changeKeypadPassword = 'changeKeypadPassword';//تغییر پسورد کی پد
  static const String changeOut1ByRemote = 'changeOut1ByRemote';//تغییر out1 توسط ریموت
  static const String rejectCallFromUnknownNumber = 'rejectCallFromUnknownNumber';//رد تماس شماره ناشناس
  static const String instantaneousOutputTimerBasedOn = 'instantaneousOutputTimerBasedOn';//تایمر خروجی لحظه ای بر اساس
  static const String seconds = 'seconds';//ثانیه
  static const String minutes = 'minutes';//دقیقه
  static const String silencingASingleZone = 'silencingASingleZone';//سایلنت کردن تک زون
  static const String smsFromUnknownNumberCalledMr = 'smsFromUnknownNumberCalledMr';//پیامک شماره ناشناس تماس گرفته شده به مستر
  static const String disableSIMCardCalls = 'disableSIMCardCalls';//غیرفعال کردن تماس با سیم کارت
  static const String chirpPartSet = 'chirpPartSet';//چریپ پارت ست
  static const String internalBellMessage = 'internalBellMessage';//پیام زنگ داخلی
  static const String lowBatteryWarning = 'lowBatteryWarning';//هشدار باطری ضعیف
  static const String powerOutageCall = 'powerOutageCall';//تماس قطع برق

  // static const String outputDorOpen = 'outputDorOpen';
  // static const String alarmOnOffSimCardSharg2 = 'alarmOnOffSimCardSharg2';
  // static const String changePasswordCentral = 'changePasswordCentral';
  //
  // /// ****************************** OTHER SETTING CONTROLLER ********************************************
  //

  //
  // static const String setVolumeSingleAlarm = 'setVolumeSingleAlarm';
  // static const String setVolumeMainAlarm = 'setVolumeMainAlarm';

  // static const String changeTheMenuPassword = 'changeTheMenuPassword';

  //
  //

  //

  //
  // /// ****************************** OTHER SETTING PAGE 4 ********************************************
  // static const String remoteSilentButtonFunction = 'remoteSilentButtonFunction';
  // static const String contactTheManagerThroughAFixedLine = 'contactTheManagerThroughAFixedLine';
  // static const String fixedLineDialingType = 'fixedLineDialingType';
  // static const String deviceShutdownReport = 'deviceShutdownReport';
  // static const String turnTheDialerOnAndOff = 'turnTheDialerOnAndOff';
  // static const String twoStageShutdownOfTheDevice = 'twoStageShutdownOfTheDevice';
  // static const String remoteControlByContact = 'remoteControlByContact';
  // static const String reportAPowerOutageByCalling = 'reportAPowerOutageByCalling';
  // static const String sendIncomingCallNumber = 'sendIncomingCallNumber';
  //
  // /// ****************************** OUTPUT CONTROLLER ********************************************

  //
  // /// ****************************** SPLASH ********************************************
  // static const String biometricEnable = 'biometricEnable';
  //
  // /// ****************************** DATAMANAGER ********************************************

  //
  // /// ************************************ GET TB ***********************************************

  static Future<TbLocationSettingModel> getTbLocationSettingModel() async {
    var tt = await getData(_tbLocationSetting);
    TbLocationSettingModel tb = TbLocationSettingModel();
    if (tt != null) {
      tb = TbLocationSettingModel.fromMap(tt);
    }
    return tb;
  }

  static Future<TbOutputModel> getTbOutputModel() async {
    var tt = await getData(_tbOutputModel);
    TbOutputModel tb = TbOutputModel();
    if (tt != null) {
      tb = TbOutputModel.fromMap(tt);
    }
    return tb;
  }

  static Future<TbDeviceModel> getTbDeviceModel() async {
    var tt = await getData(_tbDeviceModel);
    TbDeviceModel tb = TbDeviceModel();
    if (tt != null) {
      tb = TbDeviceModel.fromMap(tt);
    }
    return tb;
  }

  /// ************************************ INSERT ***********************************************
  static Future<void> insertLocationSetting(LocationSettingModel model) async {
    TbLocationSettingModel tb = await getTbLocationSettingModel();

    List<LocationSettingModel> list = tb.list ?? <LocationSettingModel>[];
    int lastId = list.length;
    model.id = lastId + 1;
    list.add(model);
    tb.list = list;
    setData(_tbLocationSetting, tb.toMap());
  }

  static Future<void> insertDeviceModel(DeviceModel model) async {
    TbDeviceModel tb = await getTbDeviceModel();

    List<DeviceModel> list = tb.list ?? <DeviceModel>[];
    int lastId = list.length;
    model.id = lastId + 1;
    list.add(model);
    tb.list = list;
    setData(_tbDeviceModel, tb.toMap());
    // debugPrint("DDDD");

    // var ttt =await getData(_tbDeviceModel);
    // TbDeviceModel tbb = TbDeviceModel();
    // if (ttt != null) {
    //   tbb = TbDeviceModel.fromMap(ttt);
    // }
    // debugPrint("DDD");
  }

  static Future<void> insertOutputModel(OutputModel model) async {
    TbOutputModel tb = await getTbOutputModel();
    List<OutputModel> list = tb.list ?? <OutputModel>[];
    int lastId = list.length;
    model.id = lastId + 1;
    list.add(model);
    tb.list = list;
    setData(_tbOutputModel, tb.toMap());
  }

  /// ************************************* LIST ***********************************************
  static Future<List<LocationSettingModel>> getLocationSettingModelList() async {
    TbLocationSettingModel tb = await getTbLocationSettingModel();

    List<LocationSettingModel> list = tb.list ?? <LocationSettingModel>[];
    return list;
  }

  static Future<List<DeviceModel>> getDeviceModelList() async {
    var tt = await getData(_tbDeviceModel);
    TbDeviceModel tb = TbDeviceModel();
    if (tt != null) {
      tb = TbDeviceModel.fromMap(tt);
    }
    List<DeviceModel> list = tb.list ?? <DeviceModel>[];
    return list;
  }

  static Future<List<OutputModel>> getOutputModelList() async {
    TbOutputModel tb = await getTbOutputModel();

    List<OutputModel> list = tb.list ?? <OutputModel>[];
    return list;
  }

  static Future<List<OutputModel>> getOutputModelListByDeviceId(int id) async {
    TbOutputModel tb = await getTbOutputModel();

    List<OutputModel> list = tb.list?.where((element) => element.deviceId == id).toList() ?? <OutputModel>[];
    return list;
  }

  /// ************************************ OBJECT ***********************************************
  static Future<LocationSettingModel?> getLocationSettingModelById({required int id}) async {
    TbLocationSettingModel tb = await getTbLocationSettingModel();

    List<LocationSettingModel> list = (tb.list ?? <LocationSettingModel>[]).where((element) => element.id == id).toList();

    return list.isNotEmpty ? list.first : null;
  }

  static Future<DeviceModel?> getDeviceModelById({required int id}) async {
    TbDeviceModel tb = await getTbDeviceModel();
    List<DeviceModel> list = (tb.list ?? <DeviceModel>[]).where((element) => element.id == id).toList();

    return list.isNotEmpty ? list.first : null;
  }

  /// ************************************ UPDATE ***********************************************
  static Future<void> updateLocationSetting(LocationSettingModel model) async {
    TbLocationSettingModel tb = await getTbLocationSettingModel();

    List<LocationSettingModel> list = tb.list ?? <LocationSettingModel>[];

    for (int i = 0; i < list.length; i++) {
      if (list[i].id == model.id) {
        list.removeAt(i);
        list.insert(i, model);
      }
    }
    tb.list = list;
    setData(_tbLocationSetting, tb.toMap());
  }

  static Future<void> updateOutputs(OutputModel model) async {
    TbOutputModel tb = await getTbOutputModel();

    List<OutputModel> list = tb.list ?? <OutputModel>[];

    for (int i = 0; i < list.length; i++) {
      if (list[i].id == model.id) {
        list.removeAt(i);
        list.insert(i, model);
      }
    }
    tb.list = list;
    setData(_tbOutputModel, tb.toMap());
  }

  static Future<void> updateSetting(LocationSettingModel model) async {
    TbLocationSettingModel tb = await getTbLocationSettingModel();

    List<LocationSettingModel> list = tb.list ?? <LocationSettingModel>[];

    for (int i = 0; i < list.length; i++) {
      if (list[i].id == model.id) {
        list.removeAt(i);
        list.insert(i, model);
      }
    }
    tb.list = list;
    setData(_tbLocationSetting, tb.toMap());
  }

  static Future<void> resetLocationSettingSelected(int selectModelDevice) async {
    TbLocationSettingModel tb = await getTbLocationSettingModel();

    List<LocationSettingModel> list = tb.list ?? <LocationSettingModel>[];

    for (int i = 0; i < list.length; i++) {
      LocationSettingModel model = list[i];
      if (model.id == selectModelDevice) {
        model.selected = 1;
      } else {
        model.selected = 0;
      }
      list.removeAt(i);
      list.insert(i, model);
    }
    tb.list = list;
    setData(_tbLocationSetting, tb.toMap());
  }

  static Future<void> updateDeviceModel(DeviceModel model) async {
    TbDeviceModel tb = await getTbDeviceModel();

    List<DeviceModel> list = tb.list ?? <DeviceModel>[];

    for (int i = 0; i < list.length; i++) {
      if (list[i].id == model.id) {
        list.removeAt(i);
        list.insert(i, model);
      }
    }
    tb.list = list;
    setData(_tbDeviceModel, tb.toMap());
  }

  /// ************************************ DELETE ***********************************************
  static Future<void> deleteLocationSetting(int id) async {
    TbLocationSettingModel tb = await getTbLocationSettingModel();

    List<LocationSettingModel> list = tb.list ?? <LocationSettingModel>[];
    for (int i = 0; i < list.length; i++) {
      if (list[i].id == id) {
        list.removeAt(i);
      }
    }
    tb.list = list;
    setData(_tbLocationSetting, tb.toMap());
  }

  /// ************************************ PARAM ***********************************************
}
