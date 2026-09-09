part of 'widgets.dart';


PreferredSizeWidget appBar(String title)=>AppBar(
  backgroundColor: context.theme.scaffoldBackgroundColor,
  iconTheme: IconThemeData(
    color: context.theme.dividerColor, //change your color here
  ),
  leading: IconButton(
    icon: Icon(Icons.arrow_back_ios, color: context.theme.dividerColor),
    onPressed: () => {Get.back()},
  ),
  title: Text(title).titleLarge(),
  centerTitle: true,
);