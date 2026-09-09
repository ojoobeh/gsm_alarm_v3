import 'package:bestdroid/app/core/assets.dart';
import 'package:bestdroid/app/core/core.dart';
import 'package:bestdroid/app/extensions/extension.dart';
import 'package:bestdroid/app/widgets/widgets.dart';
import 'package:bestdroid/battery_helper.dart';
import 'package:flutter/material.dart';

class HelpImagePage extends StatefulWidget {
  const HelpImagePage({required this.onBack, super.key});

  final VoidCallback onBack;

  @override
  State<HelpImagePage> createState() => _HelpImagePageState();
}

class _HelpImagePageState extends State<HelpImagePage> {
  // bool _isIgnoringBatteryOptimizations = false;
  //
  //
  // Future<void> checkBatteryOptimizationStatus() async {
  //   final isIgnoring = await BatteryOptimizationHelper.isIgnoringBatteryOptimizations();
  //   setState(() {
  //     _isIgnoringBatteryOptimizations = isIgnoring;
  //   });
  // }

  @override
  void initState() {
    super.initState();
    // checkBatteryOptimizationStatus();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        debugPrint('dddddd');
        widget.onBack();
      },
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          image(Assets.helpImage),
          SizedBox(
            width: Get.width,
            child: ElevatedButton(
              onPressed: () async {
                await BatteryOptimizationHelper.openBatteryOptimizationSettings();
              },
              child: Text(s.setting).titleLarge(color: Colors.white),
            ),
          ).marginSymmetric(vertical: 16,horizontal: 16),
        ],
      ),
    );
  }
}
