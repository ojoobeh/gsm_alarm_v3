import 'package:bestdroid/app/models/data_manager.dart';
import 'package:bestdroid/app/view/other_setting/other_setting_controller.dart';
import 'package:bestdroid/app/core/core.dart';
import 'package:bestdroid/app/view/other_setting/other_setting_view.dart';

class OtherSettingPage2View extends StatefulWidget {
  const OtherSettingPage2View({super.key});

  @override
  State<OtherSettingPage2View> createState() => _OtherSettingPage2ViewState();
}

class _OtherSettingPage2ViewState extends State<OtherSettingPage2View> with OtherSettingController {
  @override
  void initState() {
    super.initState();
    setZoneParam();

    setRemoteZoneName();
    setCallPriorityParam();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: ListView(
        children: [
          item(title: s.setExternalSpeakerMuteAlert, code: DataManager.alarmSilentExternalSpeaker,defaultParamIndex: 1),
          item(title: s.setPowerOffAndOnAlert, code: DataManager.alarmOnOffPower),
          item(title: s.confidentialOnAndOffReport, code: DataManager.alarmOnOffConfidental,defaultParamIndex: 1),
          item(title: s.setToSendSmsReceivingReports, code: DataManager.alarmOnOffSmsReceivingReport),
          item(title: s.selectTheDeviceOperator, params: <String>[s.mci,s.irancell], code: DataManager.selectSimType,defaultParamIndex: 1),
          item(title: s.changeOut1ByRemote, params: <String>[s.always,s.momentary], code: DataManager.selectSimType,defaultParamIndex: 1),
          item(title: s.connectingTheKeypad, code: DataManager.connectingTheKeypad,defaultParamIndex: 1),
          item(title: s.connectingTheKeypad, code: DataManager.connectingTheKeypad,defaultParamIndex: 1),
          item(title: s.rFReceiverActivation, code: DataManager.rFReceiverActivation,defaultParamIndex: 1),
          item(title: s.simCardModuleActivation, code: DataManager.simCardModuleActivation,defaultParamIndex: 1),
          item(title: s.sendRemainingCharge, code: DataManager.sendRemainingCharge,defaultParamIndex: 1),
          item(title: s.zone13Masha, code: DataManager.zone13Masha,defaultParamIndex: 1),
          item(title: s.doubleProtection, code: DataManager.doubleProtection,defaultParamIndex: 1),
          item(title: s.zone14ManualSwitch, code: DataManager.zone14ManualSwitch,defaultParamIndex: 1),
          item(title: s.rejectCallFromUnknownNumber, code: DataManager.rejectCallFromUnknownNumber,defaultParamIndex: 1),
          item(title: s.instantaneousOutputTimerBasedOn, params: <String>[s.seconds,s.minutes], code: DataManager.instantaneousOutputTimerBasedOn,defaultParamIndex: 1),
          item(title: s.powerOutageCall, code: DataManager.powerOutageCall,defaultParamIndex: 1),
          item(title: s.lowBatteryWarning, code: DataManager.lowBatteryWarning,defaultParamIndex: 1),
          item(title: s.internalBellMessage, params: <String>['Melody','Welcome'], code: DataManager.internalBellMessage,defaultParamIndex: 1),
          item(title: s.chirpPartSet, code: DataManager.chirpPartSet,defaultParamIndex: 1),
          item(title: s.disableSIMCardCalls, code: DataManager.disableSIMCardCalls,defaultParamIndex: 1),
          item(title: s.smsFromUnknownNumberCalledMr, code: DataManager.smsFromUnknownNumberCalledMr,defaultParamIndex: 1),
          // item(title: s.auxReport, code: DataManager.auxReport),
          // item(title: s.onOffDialler, code: DataManager.onOffDialler),
          // item(title: s.onRemember, code: DataManager.onRemember),
          // item(title: s.remoteControlCid, code: DataManager.remoteControlCid),
          // item(title: s.offSystem2step, code: DataManager.offSystem2step),
          // item(title: s.outputDorOpen, code: DataManager.outputDorOpen),
          // item(title: s.callAdminByPhone, code: DataManager.callAdminByPhone),
          // item(title: s.silentFunction, code: DataManager.silentFunction),
          // item(title: s.outputControlBySilent, code: DataManager.outputControlBySilent),
          // item(title: s.sendNumberInputDial, code: DataManager.sendNumberInputDial),
        ],
      ),
    );
  }
}
