import 'package:flutter/material.dart';

enum LifeState {
  detached,
  hidden,
  inactive,
  paused,
  resumed;

  bool get isDetached => super == detached;
  bool get isHidden => super == hidden;
  bool get isInactive => super == inactive;
  bool get isPaused => super == paused;
  bool get isResumed => super == resumed;
}

LifeState _state = LifeState.resumed;

class LifecycleManager extends StatefulWidget {
  final Widget child;
  const LifecycleManager({
    required this.child,
    super.key,
  });

  static LifeState get lifeState => _state;

  @override
  State<LifecycleManager> createState() => _LifecycleManagerState();
}

class _LifecycleManagerState extends State<LifecycleManager>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print("++++++++++AppLifecycleState:=$state");
    switch (state) {
      case AppLifecycleState.detached:
        {
          _state = LifeState.detached;
        }
      case AppLifecycleState.hidden:
        {
          _state = LifeState.hidden;
        }
      case AppLifecycleState.inactive:
        {
          _state = LifeState.inactive;
        }
      case AppLifecycleState.paused:
        {
          _state = LifeState.paused;
        }
      case AppLifecycleState.resumed:
        {
          _state = LifeState.resumed;
        }

      default:
        null;
    }
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
