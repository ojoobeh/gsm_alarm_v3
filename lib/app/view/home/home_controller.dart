import 'package:bestdroid/app/core/core.dart';
import 'package:bestdroid/app/models/code_list/code.dart';

mixin HomeController {


  final formKey = GlobalKey<FormState>();

  Future<void> init({required final VoidCallback action}) async {
    action();
  }

  sendCode2(CodeModel model)async{

    String pass = Core.selectedModel.password??'';
    String code =  getCode(model);
    String _code=code.replaceAll("PASS", pass);
    debugPrint(_code);
    sendMessage(_code);
  }
}
