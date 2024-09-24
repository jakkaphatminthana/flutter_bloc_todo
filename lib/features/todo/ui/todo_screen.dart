import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_todo/core/blocs/language/language_cubit.dart';
import 'package:flutter_bloc_todo/core/constants/localization_constant.dart';
import 'package:flutter_bloc_todo/core/theme/text_styles.dart';
import 'package:flutter_bloc_todo/features/todo/blocs/todo_cubit.dart';
import 'package:flutter_bloc_todo/features/todo/ui/todo_add_edit_screen.dart';
import 'package:flutter_bloc_todo/features/todo/ui/widget/todo_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<TodoCubit>(context).fetchTodoList();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _changeLocale(BuildContext context, LanguageState state) {
    final currentLocale = state.locale;
    var newLocale = currentLocale;

    if (currentLocale == const Locale(LocalizationConstant.localeTHCode)) {
      newLocale = const Locale(LocalizationConstant.localeENCode);
    } else {
      newLocale = const Locale(LocalizationConstant.localeTHCode);
    }
    BlocProvider.of<LanguageCubit>(context).changeLocale(newLocale.languageCode);
  }

  void _handelAddTodo() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const TodoAddEditScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);

    return BlocConsumer<LanguageCubit, LanguageState>(
      listener: (context, state) {
        if (state.locale == const Locale(LocalizationConstant.localeTHCode)) {
          log("🌎 เปลี่ยนเป็นภาษาไทยแล้ว");
        }
        if (state.locale == const Locale(LocalizationConstant.localeENCode)) {
          log("🌎 Changed to English success");
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              localization?.appbar_title ?? "-",
              style: AppCustomTextStyle.title2(),
            ),
            actions: [
              IconButton(
                onPressed: () => _changeLocale(context, state),
                icon: const Icon(
                  Icons.language_rounded,
                  size: 30,
                ),
              ),
            ],
          ),
          body: BlocBuilder<TodoCubit, TodoState>(
            builder: (context, state) {
              if (state.todoList.isEmpty) {
                return _buildEmptyData(localization);
              }

              return ListView.builder(
                itemCount: state.todoList.length,
                itemBuilder: (context, index) {
                  final item = state.todoList[index];
                  return TodoCard(data: item);
                },
              );
            },
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => _handelAddTodo(),
            child: const Icon(Icons.add, size: 30),
          ),
        );
      },
    );
  }

  Widget _buildEmptyData(AppLocalizations? locale) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.not_interested,
            size: 56,
          ),
          const SizedBox(height: 16),
          Text(
            locale?.todo__empty ?? '',
            style: AppCustomTextStyle.title1(),
          ),
        ],
      ),
    );
  }
}
