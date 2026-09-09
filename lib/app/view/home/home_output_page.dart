import 'package:bestdroid/app/models/output/output.dart';
import 'package:bestdroid/app/view/home/outputs_controller.dart';
import 'package:bestdroid/app/core/assets.dart';
import 'package:bestdroid/app/core/core.dart';
import 'package:bestdroid/app/extensions/extension.dart';
import 'package:bestdroid/app/view/utils/local_storage.dart';
import 'package:bestdroid/app/widgets/widgets.dart';

class HomeOutputPage extends StatefulWidget {
  const HomeOutputPage({required this.title, super.key});

  final String title;

  @override
  State<HomeOutputPage> createState() => _HomeOutputPageState();
}

class _HomeOutputPageState extends State<HomeOutputPage> with OutputsController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    init(
      action: () {
        get(
          action: () => isLoading(false),
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
              width: screenWidth,
              height: screenHeight,
              child: image(
                Assets.backgroundImage,
                fit: BoxFit.cover,
              )),
          Container(
            color: Colors.brown.withOpacity(0.6),
            width: screenWidth,
            height: screenHeight,
          ),
          Obx(() => !isLoading.value
              ? GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisExtent: 130, crossAxisSpacing: 8),
                  itemCount: int.parse(getString(AppConstants.countOfOutput) ?? '4'),
                  itemBuilder: (context, index) => _itemOutput(outputModel: outputList[index], index: index),
                ).marginSymmetric(horizontal: 8)
              : const Center(
                  child: CircularProgressIndicator(),
                )),
        ],
      ),
    );
  }

  // Widget _item({double? width, double? height, double? opacity, required Color color, required IconData icon, required String title}) => Container(
  //       padding: const EdgeInsets.symmetric(vertical: 8),
  //       margin: const EdgeInsets.symmetric(vertical: 8),
  //       width: width,
  //       height: height,
  //       decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: Colors.white.withOpacity(opacity ?? 0.8)),
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Icon(
  //             icon,
  //             size: 36,
  //             color: color,
  //           ),
  //           Text(title).bodyLarge(fontSize: 16, color: color),
  //         ],
  //       ),
  //     );

  // Widget _itemH({double? width, double? height, double? opacity, required Color color, required String icon, required String title}) => Container(
  //       padding: const EdgeInsets.symmetric(vertical: 12),
  //       margin: const EdgeInsets.symmetric(vertical: 8),
  //       width: width,
  //       height: height,
  //       decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: Colors.white.withOpacity(opacity ?? 0.8)),
  //       child: Row(
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           image(icon, height: 40, color: color),
  //           const SizedBox(width: 8),
  //           Text(title).bodyLarge(fontSize: 18, color: color),
  //         ],
  //       ),
  //     );
  // itemCount: widget.team.length,
  // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisExtent: 180),

  Widget _itemOutput({
    required final OutputModel outputModel,
    required final int index,
  }) {
    TextEditingController controller = TextEditingController();
    controller.text = outputModel.title != '' ? outputModel.title : '${s.output} ${index + 1}';
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30), //
        gradient: const LinearGradient(begin: Alignment.bottomRight, end: Alignment.topLeft, colors: [
          Color(0xff0068bd),
          Color(0xff277ecb),
        ]),
        // color: Colors.white.withOpacity(0.8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(outputModel.title).bodyMedium(color: Colors.white).marginOnly(bottom: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (outputModel.isMomentary != 1)
                SizedBox(
                  child: button(
                    backgroundColor: Colors.red,
                    titleWidget: Text(s.on).labelLarge(color: Colors.white),
                    onTap: () {
                      changeOutput(outputModel, 1);
                    },
                  ),
                ).expanded(),
              if (outputModel.isMomentary != 1) const SizedBox(width: 8),
              if (outputModel.isMomentary != 1)
                SizedBox(
                  child: button(
                    backgroundColor: Colors.green,
                    titleWidget: Text(s.off).labelLarge(color: Colors.white),
                    onTap: () {
                      changeOutput(outputModel, 0);
                    },
                  ),
                ).expanded(),
              if (outputModel.isMomentary == 1)
                button(
                  backgroundColor: Core.baseColor,
                  titleWidget: Text(s.momentary).labelLarge(color: Colors.black87),
                  onTap: () {
                    changeOutput(outputModel, 2);
                  },
                ).expanded(),
            ],
          ),
        ],
      ),
    );
  }
}
