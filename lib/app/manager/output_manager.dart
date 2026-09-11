import 'package:bestdroid/app/core/core.dart';
import 'package:bestdroid/app/models/output/output.dart';
import 'package:hive/hive.dart';

class OutputManager {
  factory OutputManager() => _instance;

  OutputManager._internal();

  static final OutputManager _instance = OutputManager._internal();

  static late Box<OutputModel> _modelBox;

  static Future<void> init() async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(OutputModelAdapter());
    }

    _modelBox = await Hive.openBox<OutputModel>(AppConstants.hiveOutput);
  }

  static const String boxName = AppConstants.hiveOutput;

  /// گرفتن کل لیست مدل‌ها
  static List<OutputModel> getList() {
    return _modelBox.values.toList();
  }

  /// ذخیره یک مدل جدید
  static Future<void> add(OutputModel model) async {
    debugPrint('BEFORE ADD: ${_modelBox.length}');
    debugPrint('MODEL: ${model.id} - ${model.title}');

    final key = await _modelBox.add(model);

    debugPrint('ADDED KEY: $key');
    debugPrint('AFTER ADD: ${_modelBox.length}');
  }

  /// ذخیره چند مدل
  static Future<void> addAll(List<OutputModel> models) async {
    await _modelBox.addAll(models);
  }

  /// گرفتن مدل بر اساس id خود مدل
  static OutputModel? getById(int id) {
    try {
      return _modelBox.values.firstWhere((OutputModel model) => model.id == id);
    } catch (_) {
      return null;
    }
  }

  /// آپدیت مدل بر اساس id
  static Future<bool> update(OutputModel updatedModel) async {
    final model = getById(updatedModel.id ?? -1);

    if (model == null) {
      return false;
    }

    final index = _modelBox.values.toList().indexOf(model);

    await _modelBox.putAt(index, updatedModel);

    return true;
  }

  /// حذف مدل بر اساس id
  static Future<bool> deleteById(int id) async {
    List<OutputModel> _list = _modelBox.values.toList();
    final index = _list.indexWhere((OutputModel model) => model.id == id);

    if (index == -1) {
      return false;
    }

    await _modelBox.deleteAt(index); //

    return true;
  }

  /// پاک کردن کل لیست
  static Future<void> clear() async {
    await _modelBox.clear();
  }

  /// تعداد مدل‌ها
  static int get length => _modelBox.length;
}
