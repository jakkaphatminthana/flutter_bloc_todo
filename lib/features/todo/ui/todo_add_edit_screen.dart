import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_todo/core/common_widget/app_button.dart';
import 'package:flutter_bloc_todo/core/common_widget/custom_reactive_textfield.dart';
import 'package:flutter_bloc_todo/features/todo/blocs/todo_cubit.dart';
import 'package:flutter_bloc_todo/features/todo/data/models/todo_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:reactive_forms/reactive_forms.dart';

class TodoAddEditScreen extends StatefulWidget {
  const TodoAddEditScreen({super.key});

  @override
  State<TodoAddEditScreen> createState() => _TodoAddEditScreenState();
}

class _TodoAddEditScreenState extends State<TodoAddEditScreen> {
  final _form = FormGroup({
    'title': FormControl<String>(
      validators: [
        Validators.required,
      ],
    ),
    'description': FormControl<String>(
      validators: [
        Validators.required,
      ],
    ),
  });

  Future<void> _handleSubmit() async {
    if (_form.valid) {
      final title = _form.control('title').value;
      final description = _form.control('description').value;

      await BlocProvider.of<TodoCubit>(context).addTodo(
        title: title,
        description: description,
      );
      _form.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalizations.of(context);

    return BlocBuilder<TodoCubit, TodoState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text(localization?.todo__add_appbar_title ?? ''),
              backgroundColor: Colors.white,
            ),
            body: ReactiveForm(
              formGroup: _form,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: Column(
                  children: [
                    _buildTitleInput(localization),
                    const SizedBox(height: 16),
                    _buildDescription(localization),
                    const SizedBox(height: 26),
                    AppButton(
                      onClick: () => _handleSubmit(),
                      color: Theme.of(context).primaryColor,
                      text: localization?.todo__add_appbar_title ?? '',
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTitleInput(AppLocalizations? locale) {
    const String formKey = 'title';

    return ReactiveValueListenableBuilder(
      formControlName: formKey,
      builder: (context, control, child) {
        return CustomReactiveTextfield(
          formControlName: formKey,
          hintText: locale?.todo__input_title ?? '',
          validationMessages: {
            ValidationMessage.required: (_) => locale?.todo__error__input_required ?? '',
          },
          suffixIcon: control.invalid && control.dirty ? const Icon(Icons.cancel_rounded) : null,
        );
      },
    );
  }

  Widget _buildDescription(AppLocalizations? locale) {
    const String formKey = 'description';

    return ReactiveValueListenableBuilder(
      formControlName: formKey,
      builder: (context, control, child) {
        return CustomReactiveTextfield(
          formControlName: formKey,
          hintText: locale?.todo__input_description ?? '',
          validationMessages: {
            ValidationMessage.required: (_) => locale?.todo__error__input_required ?? '',
          },
          suffixIcon: control.invalid && control.dirty ? const Icon(Icons.cancel_rounded) : null,
        );
      },
    );
  }
}
