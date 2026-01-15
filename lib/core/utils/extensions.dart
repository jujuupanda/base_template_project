import 'package:flutter/material.dart';

extension NumGap on num {
  Widget get gap => SizedBox(width: toDouble(), height: toDouble());

  Widget get vGap => SizedBox(height: toDouble());

  Widget get hGap => SizedBox(width: toDouble());
}

enum TransactionStatus { pending, success, failed }

extension TransactionStatusX on TransactionStatus {
  Color get color {
    switch (this) {
      case TransactionStatus.pending:
        return Colors.orange;
      case TransactionStatus.success:
        return Colors.green;
      case TransactionStatus.failed:
        return Colors.red;
    }
  }

  String get label {
    switch (this) {
      case TransactionStatus.pending:
        return 'Menunggu Pembayaran';
      case TransactionStatus.success:
        return 'Berhasil';
      case TransactionStatus.failed:
        return 'Gagal';
    }
  }
}

extension StatusExtension on dynamic {
  String get _asString => '$this';

  bool get isApproved => _asString == "2";

  bool get isPending => _asString == "1";

  bool get isRejected => _asString == "0";

  Color get toColor {
    if (isApproved) return Colors.green;
    if (isPending) return Colors.orange;
    if (isRejected) return Colors.red;
    return Colors.black;
  }
}

extension ContextX on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  double get mqWidth => MediaQuery.sizeOf(this).width;

  double get mqHeight => MediaQuery.sizeOf(this).height;

  bool get isMobile => mqWidth < 600;
}

extension StringX on String? {
  String get orDash => (this == null || this!.isEmpty || this == '') ? '-' : this!;
}
