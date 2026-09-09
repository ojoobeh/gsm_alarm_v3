import 'package:bestdroid/app/core/assets.dart';
import 'package:bestdroid/app/core/core.dart';
import 'package:bestdroid/app/extensions/extension.dart';
import 'package:bestdroid/app/view/utils/local_storage.dart';
import 'package:bestdroid/app/widgets/widgets.dart';

class HomeEmergencyPage extends StatefulWidget {
  const HomeEmergencyPage({required this.title, super.key});

  final String title;

  @override
  State<HomeEmergencyPage> createState() => _HomeEmergencyPageState();
}

class _HomeEmergencyPageState extends State<HomeEmergencyPage>  {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(width: screenWidth, height: screenHeight, child: image(Assets.backgroundImage, fit: BoxFit.cover)),
          Container(
            color: Colors.brown.withOpacity(0.6),
            width: screenWidth,
            height: screenHeight,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _itemEmergencyButton(id: 1, name: 'Name 1', code: '*121*11#'),
                  _itemEmergencyButton(id: 2, name: 'Name 1', code: '*121*11#'),
                ],
              ),
              const SizedBox(height: 16),
              _itemEmergencyButton(id: 3, name: 'Name 1', code: '*121*11#'),
            ],
          )
        ],
      ),
    );
  }

  Widget _itemEmergencyButton({
    required final int id,
    required final String name,
    required final String code,
  }) {
    return GestureDetector(
      onTap: () {
        if ((getString('emergencyButtonName$id') ?? '') != '') {
          sendMessage(getString('emergencyButtonCode$id') ?? '');
        } else {
          snackbarRed(title: s.warning, subtitle: s.undefinedButton);
        }
      },
      onLongPress: () {
        getEmergencyButtonNameDialog(
          result: (param, code) {
            setData('emergencyButtonName$id', param);
            setData('emergencyButtonCode$id', code);
            back();
            setState(() {});
          },
        );
      },
      child: Container(
        width: Get.width / 3,
        height: Get.width / 4,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          gradient: const LinearGradient(begin: Alignment.bottomRight, end: Alignment.topLeft, colors: [
            Color(0xff2a2a2a),
            Color(0xff5d5c5d),
          ]),
          // color: Colors.white.withOpacity(0.8),
        ),
        child: Center(
          //
          child: Text(getString('emergencyButtonName$id') ?? '${s.button} $id',textAlign: TextAlign.center,).titleLarge(color: Colors.red).marginOnly(bottom: 8),
        ),
      ),
    );
  }
}
