/* 
  Information on the client devicebeing used.
  https://blog.gskinner.com/archives/2020/03/flutter-simplify-platform-detection-responsive-sizing.html
*/

/// Screen information for the client device that is using the application.
class Screen {
  final double ppi;
  final double width;
  final double height;
  final double diagonal;

  late double widthInches;
  late double heightInches;
  late double diagonalInches;

  Screen({
    required this.ppi,
    required this.width,
    required this.height,
    required this.diagonal,
  }){
    widthInches = width / ppi;
    heightInches = height / ppi;
    diagonalInches = diagonal / ppi;
  }

  get isLargePhone => diagonal > 720;
  get isTablet => diagonalInches >= 7;
  get isNarrow => widthInches < 3.5;
}
