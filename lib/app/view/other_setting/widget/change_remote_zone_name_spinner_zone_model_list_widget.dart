import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bestdroid/app/models/zone/zone.dart';
import 'package:bestdroid/app/view/other_setting/other_setting_controller.dart';

class ChangeRemoZoneNameSpinnerZoneListWidget extends StatefulWidget {
  const ChangeRemoZoneNameSpinnerZoneListWidget({super.key});

  @override
  State<ChangeRemoZoneNameSpinnerZoneListWidget> createState() => _ChangeRemoZoneNameSpinnerZoneListWidgetState();
}

class _ChangeRemoZoneNameSpinnerZoneListWidgetState extends State<ChangeRemoZoneNameSpinnerZoneListWidget> with OtherSettingController{
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return zoneModelList.isNotEmpty
          ? Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          width: 100,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: DropdownButton<ZoneModel>(
            dropdownColor: context.theme.scaffoldBackgroundColor,
            value: selectZoneMode.value,
            icon: const Icon(Icons.arrow_downward),
            iconSize: 0,
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            onChanged:(value) {

              setSelectZoneModel(value!);
            },
            items:
            zoneModelList.map((ZoneModel vahed) {
              return  DropdownMenuItem<ZoneModel>(
                value: vahed,
                child: Container(
                  child:  Text(
                    vahed.title??'',
                    textAlign: TextAlign.start,
                    textDirection: TextDirection.rtl,
                    style:  const TextStyle(color: Colors.black54),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      )
          : Container();
    });
  }
}

// class ChangeRemoZoneNameSpinnerZoneListWidget extends StatefulWidget {
//   const ChangeRemoZoneNameSpinnerZoneListWidget({super.key});
//
//   @override
//   State<ChangeRemoZoneNameSpinnerZoneListWidget> createState() => _ChangeRemoZoneNameSpinnerZoneListWidgetState();
// }
//
// class _ChangeRemoZoneNameSpinnerZoneListWidgetState extends State<ChangeRemoZoneNameSpinnerZoneListWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       return zoneModelList.isNotEmpty
//           ? Directionality(
//         textDirection: TextDirection.rtl,
//         child: Container(
//           width: 100,
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           child: DropdownButton<ZoneModel>(
//             dropdownColor: context.theme.scaffoldBackgroundColor,
//             value: controller.selectZoneMode.value,
//             icon: const Icon(Icons.arrow_downward),
//             iconSize: 0,
//             elevation: 16,
//             style: const TextStyle(color: Colors.deepPurple),
//             onChanged: (ZoneModel? value) {
//               setSelectZoneModel(value!);
//             },
//             items:
//             zoneModelList.map((ZoneModel vahed) {
//               return  DropdownMenuItem<ZoneModel>(
//                 value: vahed,
//                 child: Text(
//                   vahed.title.tr,
//                   textAlign: TextAlign.start,
//                   textDirection: TextDirection.rtl,
//                   style:  const TextStyle(color: Colors.black54),
//                 ),
//               );
//             }).toList(),
//           ),
//         ),
//       )
//           : Container();
//     });
//   }
// }
//
