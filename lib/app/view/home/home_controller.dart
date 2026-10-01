import 'package:bestdroid/app/core/core.dart';
import 'package:bestdroid/app/models/code_list/code.dart';

mixin HomeController {
  final formKey = GlobalKey<FormState>();

  Future<void> init({required final VoidCallback action}) async {
    action();
  }

  sendCode2(CodeModel model) async {
    String pass = Core.selectedModel.password ?? '';
    String code = getCode(model);
    String _code = code.replaceAll("PASS", pass);

    debugPrint(_code);
    sendMessage(_code);
  }
  sendCode4(CodeModel model,int part) async {
    String pass = Core.selectedModel.password ?? '';
    String code = getCode(model);
    String _code = code.replaceAll("PASS", pass);
    if(Core.selectedModel.modelId!=1){
      _code='$code$part#';
    }

    debugPrint(_code);
    sendMessage(_code);
  }

  sendCode3(CodeModel model, int part) async {
    String pass = Core.selectedModel.password ?? '';
    String code = getCode(model);

    if (Core.selectedModel.id == 1) {
      if (part == 0) {
        code = code.replaceAll('#X#', '#');
      }
    }

    String _code = code.replaceAll("PASS", pass).replaceAll('X', part.toString());
    debugPrint(_code);
    sendMessage(_code);
  }
}
