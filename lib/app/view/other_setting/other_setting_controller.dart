import 'package:flutter/material.dart';
import 'package:bestdroid/app/core/core.dart';
import 'package:bestdroid/app/models/data_manager.dart';
import 'package:bestdroid/app/models/other/call_priority_model.dart';
import 'package:bestdroid/app/models/remote/remote.dart';
import 'package:bestdroid/app/models/zone/zone.dart';
import 'package:bestdroid/app/view/utils/local_storage.dart';
import 'package:url_launcher/url_launcher.dart';

mixin OtherSettingController {
  GlobalKey<FormState> profileForm = GlobalKey<FormState>();
  // LocationSettingModel selectLocationSettingModel=LocationSettingModel();

  final callPriorityList = <CallPriorityModel>[].obs;
  final List<ZoneModel> zoneList = <ZoneModel>[].obs;
  final selectCallPriority = CallPriorityModel().obs;
  final selectZone = ZoneModel().obs;
  final selectZoneName = ZoneModel().obs;
  final volumeMainAlarm = 0.0.obs;
  final volumeSingleAlarm = 0.0.obs;

  final TextEditingController etMemory = TextEditingController();
  final TextEditingController etPhone = TextEditingController();
  final TextEditingController etRemoteNumber = TextEditingController();
  final TextEditingController etZoneNumber = TextEditingController();
  final TextEditingController etAdminPassword = TextEditingController();
  final TextEditingController etBurglarAlarmPassword = TextEditingController();
  final TextEditingController etDevicePassword = TextEditingController();
  final TextEditingController etMenuPassword = TextEditingController();
  final TextEditingController etAppPassword = TextEditingController();
  final TextEditingController etZoneName = TextEditingController();

  final TextEditingController newPassword = TextEditingController();
  final TextEditingController remote = TextEditingController();
  final TextEditingController zone = TextEditingController();

  final zoneModelList = <ZoneModel>[].obs;
  final remoteModelList = <RemoteModel>[].obs;

  final selectZoneMode = ZoneModel().obs;
  final selectRemoteMode = RemoteModel().obs;

  final alarmSilentExternalSpeaker = 0.obs;
  final alarmOnOffPower = 0.obs;
  final alarmOnOffConfidental = 0.obs;
  final alarmOnOffSimCardSharg = 0.obs;
  final alarmOnOffSimCardSharg2 = 0.obs;
  final ZONE24h = 0.obs;
  final alarmOnOffSmsReceivingReport = 0.obs;
  final operator = 0.obs;

  final setupStimulationType = 0.obs;
  final setupLanguageSMS = 0.obs;
  RxInt defaultDialingSystem = 0.obs;
  final remoteControl = 0.obs;
  final setAlarmTime = 0.obs;
  final setZoneStatus = 0.obs;
  final setSirenOnStatus = 0.obs;
  // final singleSirenSetting = 0.obs;
  final outputAdjustment1 = 0.obs;
  final adjustTheTypeOfDingDong = 0.obs;
  final setArrivalTime = 0.obs;
  final setDepartureTime = 0.obs;

  setCallPriorityParam() {
    callPriorityList.add(CallPriorityModel(title: "SMS", id: 2));
    callPriorityList.add(CallPriorityModel(title: "Call", id: 1));
    selectCallPriority(callPriorityList[0]);
  }

  setZoneParam() {
    zoneList.add(ZoneModel(title: s.remoteZone, id: 0));
    zoneList.add(ZoneModel(title: "${s.zoon} 1", status: "1", id: 61));
    zoneList.add(ZoneModel(title: "${s.zoon} 2", status: "2", id: 62));
    zoneList.add(ZoneModel(title: "${s.zoon} 3", status: "3", id: 63));
    zoneList.add(ZoneModel(title: "${s.zoon} 4", status: "4", id: 64));
    zoneList.add(ZoneModel(title: "${s.zoon} 5", status: "5", id: 65));
    zoneList.add(ZoneModel(title: "${s.zoon} 6", status: "6", id: 66));
    zoneList.add(ZoneModel(title: "${s.zoon} 7", status: "7", id: 67));
    zoneList.add(ZoneModel(title: "${s.zoon} 8", status: "8", id: 68));
    zoneList.add(ZoneModel(title: "${s.zoon} 9", status: "9", id: 69));
    zoneList.add(ZoneModel(title: "${s.zoon} 10",status: "10", id: 70));
    zoneList.add(ZoneModel(title: "${s.zoon} 11",status: "11", id: 71));
    zoneList.add(ZoneModel(title: "${s.zoon} 12",status: "12", id: 72));
    zoneList.add(ZoneModel(title: "${s.zoon} 13",status: "13", id: 73));
    zoneList.add(ZoneModel(title: "${s.zoon} 14",status: "14", id: 74));
    selectZone(zoneList[0]);
  }

  void setCallPriority(CallPriorityModel _callPriorityModel) {
    selectCallPriority(_callPriorityModel);
  }

  void setVolumeMainAlarm(double _volumeMainAlarm) {
    volumeMainAlarm(_volumeMainAlarm);
  }

  void setVolumeSingleAlarm(double _volumeSingleAlarm) {
    volumeSingleAlarm(_volumeSingleAlarm);
  }

  void setZone(ZoneModel _zoneModel) {
    selectZone(_zoneModel);
  }

  void setAlarmSilentExternalSpeaker(int _alarmSilentExternalSpeaker) {
    this.alarmSilentExternalSpeaker(_alarmSilentExternalSpeaker);
  }

  void setAlarmOnOffPower(int alarmOnOffPower) {
    this.alarmOnOffPower(alarmOnOffPower);
  }

  void setAlarmOnOffConfidental(int _alarmOnOffConfidental) {
    this.alarmOnOffConfidental(_alarmOnOffConfidental);
  }

  void setAlarmOnOffSimCardSharg(int _alarmOnOffSimCardSharg) {
    this.alarmOnOffSimCardSharg(_alarmOnOffSimCardSharg);
  }

  void setAlarmOnOffSimCardSharg2(int _alarmOnOffSimCardSharg) {
    this.alarmOnOffSimCardSharg2(_alarmOnOffSimCardSharg);
  }

  void setZONE24h(int _ZONE24h) {
    this.ZONE24h.value = _ZONE24h;
  }

  void setAlarmOnOffSmsReceivingReport(int _alarmOnOffSmsReceivingReport) {
    this.alarmOnOffSmsReceivingReport(_alarmOnOffSmsReceivingReport);
  }

  void setOperator(int _operator) {
    this.operator.value = _operator;
  }

///////////////////////////////////
  void setSetupStimulationType(int _setupStimulationType) {
    this.setupStimulationType(_setupStimulationType);
  }

  void setSetupLanguageSMS(int _setupLanguageSMS) {
    this.setupLanguageSMS(_setupLanguageSMS);
  }

  void setDefaultDialingSystem(int _defaultDialingSystem) {
    this.defaultDialingSystem(_defaultDialingSystem);
  }

  void setRemoteControl(int _remoteControl) {
    this.remoteControl(_remoteControl);
  }

  void setSetAlarmTime(int _setAlarmTime) {
    this.setAlarmTime(_setAlarmTime);
  }

  void setSetZoneStatus(int _setZoneStatus) {
    this.setZoneStatus(_setZoneStatus);
  }
  void setSetSirenOnStatus(int _setSirenOnStatus) {
    this.setSirenOnStatus(_setSirenOnStatus);
  }

  // void setSingleSirenSetting(int _singleSirenSetting) {
  //   this.singleSirenSetting(_singleSirenSetting);
  // }

  void setOutputAdjustment1(int _outputAdjustment1) {
    this.outputAdjustment1(_outputAdjustment1);
  }

  void setAdjustTheTypeOfDingDong(int _adjustTheTypeOfDingDong) {
    this.adjustTheTypeOfDingDong(_adjustTheTypeOfDingDong);
  }

  void setSetArrivalTime(int _setArrivalTime) {
    this.setArrivalTime(_setArrivalTime);
  }

  void setSetDepartureTime(int _setDepartureTime) {
    this.setDepartureTime(_setDepartureTime);
  }

  Future<void> sendSetZone() async {
    if ((selectZone.value.id) > 0) {
      String code =  getCode(Core.setZoneSetting);
      sendMessage(code.replaceAll("X", (selectZone.value.status).toString()).replaceAll("Y", (setZoneStatus.value + 1).toString()));
    } else {
      snackbarRed(title: s.error, subtitle: s.selectYourZoneNumber);
    }
  }


  Future<void> insertToMemory() async {
    if (etMemory.text.length > 0) {
      if (etPhone.text.length == 11) {
        String code = await getCode(Core.insertToMemory);
        sendMessage(code.replaceAll("MEMORY", etMemory.text).replaceAll("PHONE", etPhone.text));
      } else {
        snackbarRed(title: s.error, subtitle: "Phone is wrong");
      }
    } else {
      snackbarRed(title: s.error, subtitle: s.enterTheMemory);
    }
  }

  Future<void> deleteFromMemory() async {
    if (etMemory.text.length > 0) {
      String code =  getCode(Core.deleteFromMemory);
      sendMessage(await code.replaceAll("MEMORY", etMemory.text));
    } else {
      snackbarRed(title: s.error, subtitle: s.enterTheMemory);
    }
  }

  Future<void> showMemory() async {
    if (etMemory.text.length > 0) {
      String code =  getCode(Core.showMemory);
      sendMessage(code.replaceAll("MEMORY", etMemory.text));
    } else {
      snackbarRed(title: s.error, subtitle: s.enterTheMemory);
    }
  }

  Future<void> sedCallPriority() async {
    String code =  getCode(Core.callPriority);
    sendMessage(code.replaceAll("VAL", selectCallPriority.value.id.toString()));
  }

  // Future<void> sendVolumeMainAlarm() async{
  //   String code =await getCode(  DataManager.setVolumeMainAlarm) ;
  //   sendMessage(code.replaceAll("VAL", (volumeMainAlarm.value.toInt()).toString()));
  // }

  // Future<void> sendVolumeSingleAlarm() async {
  //   String code = await getCode(DataManager.setVolumeSingleAlarm);
  //   sendMessage(code.replaceAll("VAL", (volumeSingleAlarm.value.toInt()).toString()));
  // }
  //
  // Future<void> sendVolumeMainAlarm() async {
  //   String code = await getCode(DataManager.setVolumeMainAlarm);
  //   sendMessage(code.replaceAll("VAL", (volumeMainAlarm.value.toInt()).toString()));
  // }

  Future<void> deleteRemote() async {
    String dd=etRemoteNumber.text;
    if (dd.length > 0) {
      String code =  getCode(Core.deleteRemoteNumber);
      sendMessage(code.replaceAll("VAL", (dd).toString()));
    } else {
      snackbarRed(title: s.error, subtitle: "Enter the remote number");
    }
  }
  Future<void> silencingASingleZone() async {
    String dd=etZoneNumber.text;
    if (dd.length > 0) {
      String code =  getCode(Core.silencingASingleZone);
      sendMessage(code.replaceAll("VAL", (setSirenOnStatus.value).toString()).replaceAll("ZONE", (dd).toString()));
    } else {
      snackbarRed(title: s.error, subtitle: "Enter the remote number");
    }
  }//'*PASS*70#ZONEVAL#',

  void changeAdminPassword(BuildContext context) {
    if (etAdminPassword.text.length > 3) {
      setData(DataManager.adminPassword, etAdminPassword.text);
      snackbarGreen(title: s.success, subtitle: s.passwordChangedSuccessfully);

      back();
    } else {
      snackbarRed(title: s.error, subtitle: s.thePasswordMustBe4Characters);
    }
  }

  // void changeMenuPassword(BuildContext context) {
  //   if (etMenuPassword.text.length > 3) {
  //     String _code = getCode(DataManager.changeTheMenuPassword);
  //     sendMessage(_code.replaceAll("NEWPASS", (etMenuPassword.text.toString())));
  //
  //   } else {
  //     snackbarRed(title: s.error, subtitle: s.thePasswordMustBe4Characters);
  //   }
  // }

  void changeTheBurglarAlarmPassword(BuildContext context) {
    if (etBurglarAlarmPassword.text.length > 3) {
      String _code = getCode(Core.changeKeypadPassword);
      sendMessage(_code.replaceAll("NEWPASS", (etBurglarAlarmPassword.text.toString())));

    } else {
      snackbarRed(title: s.error, subtitle: s.thePasswordMustBe4Characters);
    }
  }

  void changeDevicePassword(BuildContext context) {
    if (etDevicePassword.text.length > 3) {
      String _code = getCode(Core.changeDevicePassword);
      sendMessage(_code.replaceAll("NEWPASS", (etDevicePassword.text.toString())));

    } else {
      snackbarRed(title: s.error, subtitle: s.thePasswordMustBe4Characters);
    }
  }

  void changeAppPassword(BuildContext context) {
    if (etAppPassword.text.length > 3) {
      setData(DataManager.password, etAppPassword.text);
      snackbarGreen(title: s.success, subtitle: s.passwordChangedSuccessfully);

      back();
    } else {
      snackbarRed(title: s.error, subtitle: s.thePasswordMustBe4Characters);
    }
  }

  void setSelectZoneModel(ZoneModel _zoneModel) {
    selectZoneMode(_zoneModel);
  }

  // void setSelectRemoteModel(RemoteModel _remoteModel) {
  //   selectRemoteMode(_remoteModel);
  // }

  void setRemoteZoneName() {
    remoteModelList.add(RemoteModel(id: 1, title: '${s.remote} 1'));
    remoteModelList.add(RemoteModel(id: 2, title: '${s.remote} 2'));
    remoteModelList.add(RemoteModel(id: 3, title: '${s.remote} 3'));
    remoteModelList.add(RemoteModel(id: 4, title: '${s.remote} 4'));
    remoteModelList.add(RemoteModel(id: 5, title: '${s.remote} 5'));
    remoteModelList.add(RemoteModel(id: 6, title: '${s.remote} 6'));
    remoteModelList.add(RemoteModel(id: 7, title: '${s.remote} 7'));
    remoteModelList.add(RemoteModel(id: 8, title: '${s.remote} 8'));
    remoteModelList.add(RemoteModel(id: 9, title: '${s.remote} 9'));


    zoneModelList.add(ZoneModel(title: "${s.zoon} 1", status: "1", id: 61));
    zoneModelList.add(ZoneModel(title: "${s.zoon} 2", status: "2", id: 62));
    zoneModelList.add(ZoneModel(title: "${s.zoon} 3", status: "3", id: 63));
    zoneModelList.add(ZoneModel(title: "${s.zoon} 4", status: "4", id: 64));
    zoneModelList.add(ZoneModel(title: "${s.zoon} 5", status: "5", id: 65));
    zoneModelList.add(ZoneModel(title: "${s.zoon} 6", status: "6", id: 66));
    zoneModelList.add(ZoneModel(title: "${s.zoon} 7", status: "7", id: 67));
    zoneModelList.add(ZoneModel(title: "${s.zoon} 8", status: "8", id: 68));
    zoneModelList.add(ZoneModel(title: "${s.zoon} 9", status: "9", id: 69));
    zoneModelList.add(ZoneModel(title: "${s.zoon} 10", status: "10", id: 70));
    zoneModelList.add(ZoneModel(title: "${s.zoon} 11", status: "11", id: 70));
    zoneModelList.add(ZoneModel(title: "${s.zoon} 12", status: "12", id: 72));
    zoneModelList.add(ZoneModel(title: "${s.zoon} 13", status: "13", id: 73));
    zoneModelList.add(ZoneModel(title: "${s.zoon} 14", status: "14", id: 74));

    selectZoneMode(zoneModelList[0]);
    selectRemoteMode(remoteModelList[0]);
  }

  // changeRemoteName() async {
  //   if (Core.selectLocationSettingModel.value.id != null) {
  //     if (remote.text.length < 2) {
  //       snackbarRed(title: s.error, subtitle: s.enterRemoteName);
  //     } else {
  //       String code =await getCode( DataManager.changeRemoteName )  ;
  //       sendMessage(code.replaceAll("NUMBER", selectRemoteMode.value.id.toString()).replaceAll("PARAM", remote.text));
  //     }
  //   } else {
  //     snackbarRed(title: s.error, subtitle: s.selectedInstallationLocation);
  //   }
  // }

  // Future<void> changePassword() async {
  //   if (Core.selectLocationSettingModel.value.id != null) {
  //     if (newPassword.text.length < 2) {
  //       snackbarRed(title: s.error, subtitle: s.enterPassword);
  //     } else {
  //       String code = await getCode( DataManager.changePassword ) ;
  //       sendMessage(code.replaceAll("NEWPASS", newPassword.text));
  //     }
  //   } else {
  //     snackbarRed(title: s.error, subtitle: s.selectedInstallationLocation);
  //   }
  // }

  Future<void> changeZoneName() async {
    if (Core.selectLocationSettingModel.value.id != null) {
      if (zone.text.length < 2) {
        snackbarRed(title: s.error, subtitle: s.enterZoneName);
      } else {
        String code =  getCode(Core.changeZoneName);
        sendMessage(code.replaceAll("NUMBER", selectZoneMode.value.id.toString()).replaceAll("PARAM", zone.text));
      }
    } else {
      snackbarRed(title: s.error, subtitle: s.selectedInstallationLocation);
    }
  }

  void launchURL(String url) async => await launchUrl(Uri.parse(url));
}
