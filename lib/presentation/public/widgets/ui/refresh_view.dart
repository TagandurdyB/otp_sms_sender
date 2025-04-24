import 'package:flutter/material.dart';
import 'package:otp_sms_sender/config/core/exports.dart';

import 'scroll_style.dart';

// ignore: must_be_immutable
class RefreshView extends StatefulWidget {
  final Color color;
  Widget Function(int index)? itemBuilder;
  int itemCount;
  final List<Widget> children;
  final Future<void> Function()? onRefresh;
  final Future<void> Function()? onFetch;
  bool canFetch;
  final EdgeInsetsGeometry padding;
  ScrollController? controller;
  Axis scrollDirection;
  RefreshView({
    this.onRefresh,
    this.onFetch,
    this.children = const [],
    this.itemCount = 0,
    this.itemBuilder,
    this.padding = const EdgeInsets.all(16),
    this.color = Colors.orange,
    this.controller,
    this.canFetch = false,
    this.scrollDirection = Axis.vertical,
    super.key,
  });

  @override
  State<RefreshView> createState() => _RefreshViewState();
}

class _RefreshViewState extends State<RefreshView> {
  @override
  void initState() {
    if (widget.onFetch != null) {
      widget.controller ??= ScrollController();
      initScroll();
    }
    super.initState();
  }

  void initScroll() {
    if (widget.controller == null) return;
    widget.controller!.addListener(() {
      if (widget.controller!.position.maxScrollExtent ==
          widget.controller!.offset) {
        widget.onFetch!();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: widget.onRefresh == null
          ? buildScrollView()
          : RefreshIndicator(
              color: widget.color,
              onRefresh: widget.onRefresh!,
              child: buildScrollView(),
            ),
    );
  }

  Widget buildScrollView() {
    return ScrollStyle(
      color: widget.color,
      child: ListView.builder(
        scrollDirection: widget.scrollDirection,
        controller: widget.controller,
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        // const ClampingScrollPhysics(parent: BouncingScrollPhysics()
        //     // AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics(),
        //     ),
        padding: widget.padding,
        itemCount: widget.itemCount + 2,
        itemBuilder: (context, index) {
          if (index > 0 && index < widget.itemCount + 1) {
            return widget.itemBuilder == null
                ? const SizedBox()
                : widget.itemBuilder!(index - 1);
          }
          if (index == 0) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.children,
            );
          } else {
            return widget.canFetch ? const LoadingWidget() : const SizedBox();
          }
        },
      ),
    );
  }
}
