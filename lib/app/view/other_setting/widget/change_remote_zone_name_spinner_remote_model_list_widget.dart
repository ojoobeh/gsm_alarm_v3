import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bestdroid/app/models/remote/remote.dart';
import 'package:bestdroid/app/view/other_setting/other_setting_controller.dart';

class ChangeRemoZoneNameSpinnerRemoteListWidget extends StatefulWidget {
  const ChangeRemoZoneNameSpinnerRemoteListWidget({super.key});

  @override
  State<ChangeRemoZoneNameSpinnerRemoteListWidget> createState() => _ChangeRemoZoneNameSpinnerRemoteListWidgetState();
}

class _ChangeRemoZoneNameSpinnerRemoteListWidgetState extends State<ChangeRemoZoneNameSpinnerRemoteListWidget> with OtherSettingController {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return remoteModelList.isNotEmpty
          ? Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                width: 100,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: DropdownButton<RemoteModel>(
                  dropdownColor: context.theme.scaffoldBackgroundColor,
                  value: selectRemoteMode.value,
                  icon: const Icon(Icons.arrow_downward),
                  iconSize: 0,
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  onChanged: (RemoteModel? value) {
                    selectRemoteMode(value);
                  },
                  items: remoteModelList.map((RemoteModel vahed) {
                    return DropdownMenuItem<RemoteModel>(
                      value: vahed,
                      child: Container(
                        child: Text(
                          vahed.title,
                          textAlign: TextAlign.start,
                          textDirection: TextDirection.rtl,
                          style: const TextStyle(color: Colors.black54),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            )
          : Container(
              child: const Text('Empty'),
            );
    });
  }
}
