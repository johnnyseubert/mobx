// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ListStore on _List, Store {
  Computed<bool>? _$isNotEmptyStringComputed;

  @override
  bool get isNotEmptyString => (_$isNotEmptyStringComputed ??= Computed<bool>(
          () => super.isNotEmptyString,
          name: '_List.isNotEmptyString'))
      .value;

  late final _$newTodoTitleAtom =
      Atom(name: '_List.newTodoTitle', context: context);

  @override
  String get newTodoTitle {
    _$newTodoTitleAtom.reportRead();
    return super.newTodoTitle;
  }

  @override
  set newTodoTitle(String value) {
    _$newTodoTitleAtom.reportWrite(value, super.newTodoTitle, () {
      super.newTodoTitle = value;
    });
  }

  late final _$ageAtom = Atom(name: '_List.age', context: context);

  @override
  int get age {
    _$ageAtom.reportRead();
    return super.age;
  }

  @override
  set age(int value) {
    _$ageAtom.reportWrite(value, super.age, () {
      super.age = value;
    });
  }

  late final _$_ListActionController =
      ActionController(name: '_List', context: context);

  @override
  void setNewTodoTitle(String value) {
    final _$actionInfo =
        _$_ListActionController.startAction(name: '_List.setNewTodoTitle');
    try {
      return super.setNewTodoTitle(value);
    } finally {
      _$_ListActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addTodo() {
    final _$actionInfo =
        _$_ListActionController.startAction(name: '_List.addTodo');
    try {
      return super.addTodo();
    } finally {
      _$_ListActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
newTodoTitle: ${newTodoTitle},
age: ${age},
isNotEmptyString: ${isNotEmptyString}
    ''';
  }
}
