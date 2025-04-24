


enum Device {
  mobile('assets/images/mobile.png', 'Mobile'),
  tablet('assets/images/tablet.png', 'Tablet'),
  desktop('assets/images/desktop.png', 'Desktop'),
  unknown('assets/images/unknown.png', 'unknown');

  bool get isMobile => super == mobile;

  bool get isTablet => super == tablet;

  bool get isDesktop => super == desktop;

  bool get isUnknown => super == unknown;

  const Device(this.img, this.tag);
  final String tag;
  final String img;
}