import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:bestdroid/app/core/get.dart';

part 'text_extension.dart';
part 'widget_extension.dart';
part 'iterable_extension.dart';

extension BoolExtensios on bool {
  bool toggle() => !this;
}
