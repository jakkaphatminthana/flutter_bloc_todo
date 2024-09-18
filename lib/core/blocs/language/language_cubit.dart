import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(const LanguageState(locale: Locale('th')));

  void changeLocale(String languageCode) {
    emit(LanguageState(locale: Locale(languageCode)));
  }
}
