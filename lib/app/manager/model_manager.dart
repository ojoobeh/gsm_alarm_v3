import 'package:bestdroid/app/core/core.dart';
import 'package:bestdroid/app/models/model/model.dart';
import 'package:hive/hive.dart';

class ModelManager {
  factory ModelManager() => _instance;

  ModelManager._internal();

  static final ModelManager _instance = ModelManager._internal();

  static late Box<Model> _modelBox;

  static Future<void> init() async {

    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(ModelAdapter());
    }

    _modelBox = await Hive.openBox<Model>(AppConstants.hiveModel);
  }

  static const String boxName = AppConstants.hiveModel;


  /// گرفتن کل لیست مدل‌ها
  static List<Model> getList() {
    return _modelBox.values.toList();
  }

  /// ذخیره یک مدل جدید
  static Future<void> add(Model model) async {
    debugPrint('BEFORE ADD: ${_modelBox.length}');
    debugPrint('MODEL: ${model.id} - ${model.title}');

    final key = await _modelBox.add(model);

    debugPrint('ADDED KEY: $key');
    debugPrint('AFTER ADD: ${_modelBox.length}');
  }

  /// ذخیره چند مدل
  static Future<void> addAll(List<Model> models) async {
    await _modelBox.addAll(models);
  }

  /// گرفتن مدل بر اساس id خود مدل
  static Model? getById(int id) {
    try {
      return _modelBox.values.firstWhere((Model model) => model.id == id);
    } catch (_) {
      return null;
    }
  }

  /// آپدیت مدل بر اساس id
  static Future<bool> update(Model updatedModel) async {
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
    List<Model> _list=_modelBox.values.toList();
    final index = _list.indexWhere((Model model) => model.id == id);

    if (index == -1) {
      return false;
    }

    await _modelBox.deleteAt(index);//

    return true;
  }

  /// پاک کردن کل لیست
  static Future<void> clear() async {
    await _modelBox.clear();
  }

  /// تعداد مدل‌ها
  static int get length => _modelBox.length;
}
