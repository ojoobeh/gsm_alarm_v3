import 'package:bestdroid/app/models/data_manager.dart';
import 'package:bestdroid/app/view/other_setting/other_setting_controller.dart';
import 'package:bestdroid/app/core/core.dart';
import 'package:bestdroid/app/view/other_setting/other_setting_view.dart';

class OtherSettingPage4View extends StatefulWidget {
  const OtherSettingPage4View({super.key});

  @override
  State<OtherSettingPage4View> createState() => _OtherSettingPage4ViewState();
}

class _OtherSettingPage4ViewState extends State<OtherSettingPage4View> with OtherSettingController {
  @override
  void initState() {
    setZoneParam();

    setRemoteZoneName();
    setCallPriorityParam();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: ListView(
        children: [
          item(title: s.typeOfFixedLineDialing, params: <String>[ s.ton,s.pulse], code: DataManager.typeOfFixedLineDialing),
          item(title: s.turnTheDialerOnAndOff, params: <String>[ s.on,s.off], code: DataManager.turnTheDialerOnAndOff),
          item(title: s.singleSirenWhenSemiActivated, params: <String>[ s.on,s.off], code: DataManager.singleSirenWhenSemiActivated,defaultParamIndex: 1),
          item(title: s.output1AsADoorOpener, params: <String>[ s.on,s.off], code: DataManager.output1AsADoorOpener,defaultParamIndex: 1),
          item(title: s.deviceShutdownReport, params: <String>[ s.off,s.on], code: DataManager.deviceShutdownReport),
          item(title: s.twoStageShutdown, params: <String>[ s.on,s.off], code: DataManager.twoStageShutdown,defaultParamIndex: 1),
          // item(title: s.contactTheManagerThroughAFixedLine, code: DataManager.contactTheManagerThroughAFixedLine),
          // item(title: s.fixedLineDialingType,params:<String>[ s.ton,s.pulse], code: DataManager.fixedLineDialingType),
          // item(title: s.deviceShutdownReport, code: DataManager.deviceShutdownReport),
          // item(title: s.turnTheDialerOnAndOff, code: DataManager.turnTheDialerOnAndOff),
          // item(title: s.twoStageShutdownOfTheDevice, code: DataManager.twoStageShutdownOfTheDevice),
          // item(title: s.remoteControlByContact, code: DataManager.remoteControlByContact),
          // item(title: s.reportAPowerOutageByCalling, code: DataManager.reportAPowerOutageByCalling),
          // item(title: s.sendIncomingCallNumber, code: DataManager.sendIncomingCallNumber),

        ],
      ),
    );
  }

// Widget _remoteRename() {
//   return Obx(() => DropDownWidget(
//         title: "${selectRemoteMode.value.title}  ",
//         items: remoteModelList.map((element) => element.title).toList(),
//         itemSelected: (items) {
//           selectRemoteMode(remoteModelList.where((p0) => p0.title == items.first).toList().first);
//         },
//       ));
// }
}
