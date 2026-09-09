import 'package:bestdroid/app/core/core.dart';

class BasePage extends StatelessWidget {
  final Widget child;
  const BasePage({required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false, // اگر true باشه محتوا زیر AppBar میره
      backgroundColor: Colors.white, // یا هر رنگ دلخواه
      appBar: AppBar(title: Text("صفحه")),
      body: SafeArea(

        child: child,
      ),
    );
  }
}