import 'package:otp_sms_sender/config/core/exports.dart';

class LogoPage extends StatefulWidget {
  const LogoPage({super.key});

  @override
  State<LogoPage> createState() => _LogoPageState();
}

class _LogoPageState extends State<LogoPage> {
  int _selectedIndex = 0;

  @override
  void initState() {
    MyOrientation.setPortraitUp();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // ToastService.init(AppRoute.context);
    });
    _goHomeAsync();
    super.initState();
  }

  void _goHomeAsync() {
 
    Future.delayed(const Duration(seconds: 3)).then((_) {
      if (_selectedIndex != 4) _goHome;
    });
  }

  void get _goHome {
    // if (route == null) _goHomeAsync();
    // Go.toReplace(route!);
    Go.toReplace(Go.home);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    MySize().changeSize(size.width, size.height);

    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor, //cc.cols.darkSlateGray,
      appBar: AppBar(elevation: 0, toolbarHeight: 0),
      body: Stack(
        children: [
          Center(child: buildLogo()),
          buildSifr(),
          Visibility(
            visible: _selectedIndex == 4,
            child: GestureDetector(
              onTap: () => _goHome,
              child: Container(
                color: Colors.transparent,
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: const Column(
                  children: [
                    Text('Tagandurdy Bayramdurdyyev Mekanovic'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSifr() {
    return Wrap(
        children: List.generate(
            4,
            (index) => GestureDetector(
                  onTap: () => _sifrFunc(index),
                  child: Container(
                    color: Colors.transparent,
                    width: MySize.width * 0.5,
                    height: MySize.height * 0.5,
                  ),
                )));
  }

  void _sifrFunc(int index) {
    if (_selectedIndex != 4) {
      if (index == _selectedIndex) {
        _selectedIndex++;
        setState(() {});
      } else {
        {
          _selectedIndex = 0;
        }
      }
    }
    debugPrint("$_selectedIndex");
  }

  Widget buildLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InCard(
          col: Theme.of(context).primaryColor,
          child: Text(
            'OTP SMS SENDER',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
            ),
          ),
        )
        // SvgPicture.asset(Asset.cubicSvg),
        // const SizedBox(width: 12),
        // SvgPicture.asset(Asset.logoSvg),
      ],
    );
  }
}
