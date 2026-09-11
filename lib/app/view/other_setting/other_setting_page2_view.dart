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
          item(title: s.setExternalSpeakerMuteAlert, code: Core.alarmSilentExternalSpeaker,defaultParamIndex: 1),
          item(title: s.setPowerOffAndOnAlert, code: Core.alarmOnOffPower),
          item(title: s.confidentialOnAndOffReport, code: Core.alarmOnOffConfidental,defaultParamIndex: 1),
          item(title: s.setToSendSmsReceivingReports, code: Core.alarmOnOffSmsReceivingReport),
          item(title: s.selectTheDeviceOperator, params: <String>[s.mci,s.irancell], code: Core.selectSimType,defaultParamIndex: 1),
          item(title: s.changeOut1ByRemote, params: <String>[s.always,s.momentary], code: Core.selectSimType,defaultParamIndex: 1),
          item(title: s.connectingTheKeypad, code: Core.connectingTheKeypad,defaultParamIndex: 1),
          item(title: s.connectingTheKeypad, code: Core.connectingTheKeypad,defaultParamIndex: 1),
          item(title: s.rFReceiverActivation, code: Core.rFReceiverActivation,defaultParamIndex: 1),
          item(title: s.simCardModuleActivation, code: Core.simCardModuleActivation,defaultParamIndex: 1),
          item(title: s.sendRemainingCharge, code: Core.sendRemainingCharge,defaultParamIndex: 1),
          item(title: s.zone13Masha, code: Core.zone13Masha,defaultParamIndex: 1),
          item(title: s.doubleProtection, code: Core.doubleProtection,defaultParamIndex: 1),
          item(title: s.zone14ManualSwitch, code: Core.zone14ManualSwitch,defaultParamIndex: 1),
          item(title: s.rejectCallFromUnknownNumber, code: Core.rejectCallFromUnknownNumber,defaultParamIndex: 1),
          item(title: s.instantaneousOutputTimerBasedOn, params: <String>[s.seconds,s.minutes], code: Core.instantaneousOutputTimerBasedOn,defaultParamIndex: 1),
          item(title: s.powerOutageCall, code: Core.powerOutageCall,defaultParamIndex: 1),
          item(title: s.lowBatteryWarning, code: Core.lowBatteryWarning,defaultParamIndex: 1),
          item(title: s.internalBellMessage, params: <String>['Melody','Welcome'], code: Core.internalBellMessage,defaultParamIndex: 1),
          item(title: s.chirpPartSet, code: Core.chirpPartSet,defaultParamIndex: 1),
          item(title: s.disableSIMCardCalls, code: Core.disableSIMCardCalls,defaultParamIndex: 1),
          item(title: s.smsFromUnknownNumberCalledMr, code: Core.smsFromUnknownNumberCalledMr,defaultParamIndex: 1),
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
