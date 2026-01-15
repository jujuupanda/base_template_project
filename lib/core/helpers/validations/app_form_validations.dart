import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// Kelas utilitas untuk semua kebutuhan validasi dan formatting input formulir.
sealed class AppFormValidations {
  // =======================================================================
  // 1. Username Validation & Formatting
  // =======================================================================

  /// Formatter: Memungkinkan Huruf (Inggris + Arab), Angka, Garis Bawah, Titik, dan Tanda Penghubung.
  static final List<TextInputFormatter> userNameFormater = [
    FilteringTextInputFormatter.allow(
      RegExp(r'[\u0600-\u06FF\u0750-\u077F\u08A0-\u08FFa-zA-Z0-9_.-]'),
    ),
  ];

  static String? userNameValidator(String? value) {
    // Pola: 3-16 karakter, hanya huruf, angka, garis bawah, titik, atau tanda hubung.
    const userNamePattern = r'^[a-zA-Z0-9_.-]{3,16}$';

    if (value == null || value.isEmpty) {
      return 'Nama pengguna wajib diisi.';
    } else if (!RegExp(userNamePattern).hasMatch(value)) {
      return 'Nama pengguna harus 3-16 karakter, hanya huruf, angka, dan karakter khusus (_ . -) yang diizinkan.';
    }
    return null;
  }

  // =======================================================================
  // 2. Email Validation & Formatting
  // =======================================================================

  /// Formatter: Memungkinkan karakter yang umum untuk Email.
  static final List<TextInputFormatter> emailFormater = [
    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9@._\-]')),
  ];

  static final emailRegex = RegExp(
    r'^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$',
  );

  static String? emailValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email wajib diisi.';
    } else if (!emailRegex.hasMatch(value)) {
      return 'Masukkan email yang valid.';
    }
    return null;
  }

  // =======================================================================
  // 3. Email & Phone Validation
  // =======================================================================

  static final phoneRegex = RegExp(
    r'^\+?[1-9]\d{6,14}$', // Regex standar untuk nomor telepon internasional (7 hingga 15 digit)
  );

  static String? emailAndPhoneValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email atau Nomor Telepon wajib diisi.';
    } else if (!emailRegex.hasMatch(value) && !phoneRegex.hasMatch(value)) {
      return 'Masukkan email atau nomor telepon yang valid.';
    }
    return null;
  }

  // =======================================================================
  // 4. OTP (Code) Validation & Formatting
  // =======================================================================

  /// Formatter: Hanya mengizinkan digit (0-9).
  static final List<TextInputFormatter> otpFormater = [
    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
    LengthLimitingTextInputFormatter(6), // Batasi panjang menjadi 6
  ];

  static String? otpValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Kode wajib diisi.';
    } else if (value.length != 6) {
      return 'Masukkan kode yang valid (harus 6 digit).';
    }
    return null;
  }

  // =======================================================================
  // 5. Password Validation & Formatting
  // =======================================================================

  /// Formatter: Memungkinkan Alfanumerik dan Karakter Khusus yang luas.
  static final List<TextInputFormatter> passwordFormater = [
    FilteringTextInputFormatter.allow(
      RegExp(r'[a-zA-Z0-9!@#$%^&*()_+\-=\[\]{};:\\|,.<>/?~` ]'),
    ),
  ];

  static String? passwordValidation(String? value) {
    // Bypass validasi ketat saat Debug mode (seperti di kode Anda)
    if (kDebugMode) return null;

    if (value == null || value.isEmpty) {
      return 'Kata sandi wajib diisi.';
    } else if (value.length < 8) {
      return 'Kata sandi harus minimal 8 karakter.';
    } else if (!RegExp(r'[a-zA-Z]').hasMatch(value)) {
      return 'Kata sandi harus mengandung huruf.';
    } else if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Kata sandi harus mengandung angka.';
    }
    // Tambahan Opsional: Validasi Karakter Khusus
    // else if (!RegExp(r'[!@#$%^&*()_+\-=\[\]{};:"\\|,.<>/?~`]').hasMatch(value)) {
    //   return 'Kata sandi harus mengandung setidaknya satu karakter khusus.';
    // }
    return null;
  }

  static String? confirmPasswordValidation(
    String? confirmPassword,
    String? password,
  ) {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return 'Konfirmasi kata sandi wajib diisi.';
    } else if (confirmPassword.length < 8) {
      return 'Kata sandi harus minimal 8 karakter.';
    } else if (confirmPassword != password) {
      return 'Konfirmasi kata sandi tidak cocok dengan kata sandi baru.';
    }
    return null;
  }

  // =======================================================================
  // 6. Phone Number Validation & Formatting
  // =======================================================================

  /// Formatter: Hanya mengizinkan digit (0-9) dengan batas panjang 15 (standar internasional).
  static final List<TextInputFormatter> phoneNumberFormatter = [
    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
    LengthLimitingTextInputFormatter(15),
  ];

  static String? phoneNumberValidator(String? value) {
    // Pola: Minimal 7 digit, maksimal 15 digit.
    const phoneNumberPattern = r'^\d{7,15}$';
    if (value == null || value.isEmpty) {
      return 'Nomor telepon wajib diisi.';
    } else if (!RegExp(phoneNumberPattern).hasMatch(value)) {
      return 'Masukkan nomor telepon yang valid (7-15 digit).';
    }
    return null;
  }

  // =======================================================================
  // 7. Card Number Validation & Formatting (16 Digit)
  // =======================================================================

  /// Formatter: Hanya mengizinkan 16 digit.
  static final List<TextInputFormatter> cardNumberFormatter = [
    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
    LengthLimitingTextInputFormatter(16),
  ];

  static String? cardNumberValidator(String? value) {
    const cardNumberPattern = r'^\d{16}$';
    if (value == null || value.isEmpty) {
      return 'Nomor kartu wajib diisi.';
    } else if (!RegExp(cardNumberPattern).hasMatch(value)) {
      return 'Masukkan 16 digit nomor kartu yang valid.';
    }
    return null;
  }

  // =======================================================================
  // 8. Card Expiry Date Validation & Formatting (MM/YY)
  // =======================================================================

  /// Formatter: Hanya mengizinkan digit dan garis miring (/), batas 5 karakter (MM/YY).
  static final List<TextInputFormatter> cardExpiryDateFormatter = [
    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
    LengthLimitingTextInputFormatter(4), // Batasi menjadi 4 digit (akan di format oleh masker/input custom)
  ];

  static String? cardExpiryDateValidator(String? value) {
    // Regex: MM/YY
    const cardExpiryDatePattern = r'^(0[1-9]|1[0-2])\d{2}$';

    if (value == null || value.isEmpty) {
      return 'Tanggal kadaluarsa wajib diisi.';
    } else if (!RegExp(cardExpiryDatePattern).hasMatch(value)) {
      return 'Format harus MM/YY yang valid.';
    }

    // Logika Tambahan: Pastikan Bulan Valid (sudah dicakup oleh Regex) dan Tahun Tidak Kadaluarsa
    final month = int.tryParse(value.substring(0, 2));
    final year = int.tryParse(value.substring(2, 4));

    if (month == null || year == null) return 'Format MM/YY tidak valid.';

    final currentYearLastTwoDigits = int.parse(DateTime.now().year.toString().substring(2, 4));
    final currentMonth = DateTime.now().month;

    if (year < currentYearLastTwoDigits || (year == currentYearLastTwoDigits && month < currentMonth)) {
      return 'Kartu sudah kadaluarsa.';
    }

    return null;
  }

  // =======================================================================
  // 9. Card Security Code Validation & Formatting (3 atau 4 Digit)
  // =======================================================================

  /// Formatter: Hanya mengizinkan 3 atau 4 digit.
  static final List<TextInputFormatter> cardSecurityCodeFormatter = [
    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
    LengthLimitingTextInputFormatter(4), // Maksimal 4 digit (untuk Amex)
  ];

  static String? cardSecurityCodeValidator(String? value) {
    // Pola: 3 atau 4 digit.
    const cardSecurityCodePattern = r'^\d{3,4}$';
    if (value == null || value.isEmpty) {
      return 'Kode keamanan wajib diisi.';
    } else if (!RegExp(cardSecurityCodePattern).hasMatch(value)) {
      return 'Masukkan kode keamanan 3 atau 4 digit yang valid.';
    }
    return null;
  }
}
