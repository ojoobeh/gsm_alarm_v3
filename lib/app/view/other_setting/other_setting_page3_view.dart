import 'package:bestdroid/app/extensions/extension.dart';
import 'package:bestdroid/app/models/data_manager.dart';
import 'package:bestdroid/app/view/other_setting/other_setting_controller.dart';
import 'package:bestdroid/app/core/core.dart';
import 'package:bestdroid/app/view/other_setting/other_setting_view.dart';
import 'package:bestdroid/app/widgets/custom_dropdown.dart';
import 'package:bestdroid/app/widgets/widgets.dart';

class OtherSettingPage3View extends StatefulWidget {
  const OtherSettingPage3View({super.key});

  @override
  State<OtherSettingPage3View> createState() => _OtherSettingPage3ViewState();
}

class _OtherSettingPage3ViewState extends State<OtherSettingPage3View> with OtherSettingController {
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
          item(title: s.setupStimulationType, params: <String>[ s.momentary,s.surface], code: DataManager.setupStimulationType),
          item(title: s.setupLanguageSMS, params: <String>[s.english, s.persian], code: DataManager.setupLanguageSMS,defaultParamIndex: 1),
          item(title: s.defaultDialingSystem, params: <String>[s.simCard, s.fixedLine], code: DataManager.defaultDialingSystem),
          item(title: s.remoteControl, params: <String>[ s.on,s.off], code: DataManager.remoteControl,defaultParamIndex: 1),
          item(title: s.setAlarmTime, params: <String>[s.oneMinute, s.twoMinute], code: DataManager.setAlarmTime),
          item(title: s.singleSirenSetting, params: <String>[s.all, s.internalSpeaker], code: DataManager.singleSirenSetting),
          // item(title: s.adjustTheTypeOfDingDong, params: <String>[s.welcome,s.melody], code: DataManager.adjustTheTypeOfDingDong),
          // item(title: s.outputControl2WithMuteButton, params: <String>[s.welcome,s.melody], code: DataManager.outputControl2WithMuteButton),
          item(title: s.setCheckInAndCheckOutTime, params: <String>[s.seconds30, s.seconds60], code: DataManager.setArrivalTime),

          Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: context.theme.scaffoldBackgroundColor,
              boxShadow: [
                BoxShadow(color: context.theme.dividerColor.withOpacity(0.5), blurRadius: 20, offset: const Offset(0, 8)),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [

                   Text(s.changeZoneName).bodyMedium().marginOnly(bottom: 4, top: 20),
                   SizedBox(
                     width: double.infinity,
                     child: Row(
                       children: [
                         SizedBox(
                           width: 100,
                           child: Obx(() => DropDownWidget(
                             title: selectZoneMode.value.title ?? s.zoneNumber,
                             items: zoneList.map((element) => element.title ?? '').toList(),
                             itemSelected: (List<String> items) {
                               selectZoneMode(zoneList.where((element) => element.title == items.first).toList().first);
                             },
                           )),
                         ),
                         const SizedBox(width: 8),
                         Expanded(child: appTextFormField(
                           controller: zone,
                           maxLength: 10,
                           hint: s.zoneName,
                         )),

                       ],
                     ),
                   ),
                 ],
               ),
                const SizedBox(height: 8),
                button(
                  title: s.send,
                  onTap: () {
                    changeZoneName();
                  },
                )
              ],
            ),
          ),

          // Container(
          //   padding: const EdgeInsets.all(8),
          //   margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          //   width: double.infinity,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(8),
          //     color: context.theme.scaffoldBackgroundColor,
          //     boxShadow: [
          //       BoxShadow(color: context.theme.dividerColor.withOpacity(0.5), blurRadius: 20, offset: const Offset(0, 8)),
          //     ],
          //   ),
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.center,
          //     children: [
          //       Text(s.changeTheMenuPassword).bodyMedium().marginOnly(bottom: 4, top: 20),
          //       appTextFormField(
          //         inputType: TextInputType.number,
          //         controller: etMenuPassword,
          //         // textAlign: TextAlignVertical.center,
          //         hint: s.enterPassword,
          //       ),
          //       const SizedBox(height: 8),
          //       button(
          //         title: s.save,
          //         onTap: () {
          //           changeMenuPassword(context);
          //         },
          //       ),
          //     ],
          //   ),
          // )      ,
      Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: context.theme.scaffoldBackgroundColor,
              boxShadow: [
                BoxShadow(color: context.theme.dividerColor.withOpacity(0.5), blurRadius: 20, offset: const Offset(0, 8)),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(s.changeTheBurglarAlarmPassword).bodyMedium().marginOnly(bottom: 4, top: 20),
                appTextFormField(
                  inputType: TextInputType.number,
                  controller: etBurglarAlarmPassword,
                  // textAlign: TextAlignVertical.center,
                  hint: s.enterPassword,
                ),
                const SizedBox(height: 8),
                button(
                  title: s.save,
                  onTap: () {
                    changeTheBurglarAlarmPassword(context);
                  },
                ),
              ],
            ),
          ),

          Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: context.theme.scaffoldBackgroundColor,
              boxShadow: [
                BoxShadow(color: context.theme.dividerColor.withOpacity(0.5), blurRadius: 20, offset: const Offset(0, 8)),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(s.adminPassword).bodyMedium().marginOnly(bottom: 4, top: 20),
                appTextFormField(
                  inputType: TextInputType.number,
                  controller: etAdminPassword,
                  // textAlign: TextAlignVertical.center,
                  hint: s.enterPassword,
                ),
                const SizedBox(height: 8),
                button(
                  title: s.save,
                  onTap: () {
                    changeAdminPassword(context);
                  },
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(s.applicationLoginPassword).bodyMedium().marginOnly(bottom: 4, top: 20),
                appTextFormField(
                  inputType: TextInputType.number,
                  controller: etAppPassword,
                  hint: s.enterPassword,
                ),
                const SizedBox(height: 8),
                button(
                  title: s.save,
                  onTap: () {
                    changeAppPassword(context);
                  },
                ),
              ],
            ),
          ),
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
