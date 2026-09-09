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
