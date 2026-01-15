import 'package:flutter/widgets.dart';

extension NumGap on num {
  Widget get gap => SizedBox(width: toDouble(), height: toDouble());
}
