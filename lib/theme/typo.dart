/*
  The typography used by the application, which is choosen on startup dependent on brand and device.

  Named Typo not to clash with Typography

  - Cupertino Typograhy
  
  https://developer.apple.com/design/human-interface-guidelines/ios/visual-design/typography/
  Large (Default)
  Style	Weight	Size (points)	Leading (points)
  Large Title	Regular	34	41
  Title 1	Regular	28	34
  Title 2	Regular	22	28
  Title 3	Regular	20	25
  Headline	Semi-Bold	17	22
  Body	Regular	17	22
  Callout	Regular	16	21
  Subhead	Regular	15	20
  Footnote	Regular	13	18
  Caption 1	Regular	12	16
  Caption 2	Regular	11	13
 */

// Flutter imports:
import 'package:flutter/cupertino.dart';

class Typo {
  TextStyle title3 = const TextStyle(
    fontSize: 20,
  );

  TextStyle navBar = const TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w600,
  );

  TextStyle body = const TextStyle(
    fontSize: 17,
  );
}
