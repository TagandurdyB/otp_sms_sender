import '../../../config/core/exports.dart';

class Page404 extends StatelessWidget {
  const Page404({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, toolbarHeight: 0),
      body: const Center(
        child: Text(
          "404",
          style: TextStyle(fontSize: 60),
        ),
      ),
    );
  }
}
