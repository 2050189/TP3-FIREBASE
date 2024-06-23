// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(Username) => "Hi, ${Username}!";

  static String m1(Percentage) => "${Percentage}% done";

  static String m2(Percentage) => "Time left : ${Percentage}%";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "back": MessageLookupByLibrary.simpleMessage("Back"),
        "confirmPassword":
            MessageLookupByLibrary.simpleMessage("Confirm password"),
        "create": MessageLookupByLibrary.simpleMessage("Create the task"),
        "createTask": MessageLookupByLibrary.simpleMessage("Create a task"),
        "editProgress": MessageLookupByLibrary.simpleMessage("Edit the task"),
        "existingAccount":
            MessageLookupByLibrary.simpleMessage("Existing account?"),
        "helloLog": MessageLookupByLibrary.simpleMessage("Hello!"),
        "hiUser": m0,
        "hintConf":
            MessageLookupByLibrary.simpleMessage("Rewrite your password"),
        "hintPassword":
            MessageLookupByLibrary.simpleMessage("4 characters minimum"),
        "hintTask": MessageLookupByLibrary.simpleMessage("Ex : Math exam"),
        "hintUsername":
            MessageLookupByLibrary.simpleMessage("2 characters minimum"),
        "home": MessageLookupByLibrary.simpleMessage("Home"),
        "instructionLog":
            MessageLookupByLibrary.simpleMessage("Please log in."),
        "instructionReg":
            MessageLookupByLibrary.simpleMessage("Please sign up."),
        "loading": MessageLookupByLibrary.simpleMessage("Loading..."),
        "login": MessageLookupByLibrary.simpleMessage("Log in!"),
        "logout": MessageLookupByLibrary.simpleMessage("Log out"),
        "nameTask": MessageLookupByLibrary.simpleMessage("Name of the task"),
        "noAccount": MessageLookupByLibrary.simpleMessage("No account?"),
        "noNetwork": MessageLookupByLibrary.simpleMessage(
            "No network. Please check your Internet connection and refresh the page."),
        "password": MessageLookupByLibrary.simpleMessage("Password"),
        "percDone": m1,
        "percTimeSpent": m2,
        "photoLibrary": MessageLookupByLibrary.simpleMessage("Library"),
        "psswdDiff": MessageLookupByLibrary.simpleMessage(
            "Password is different from the confirmation. Please recheck your fields."),
        "psswdInc": MessageLookupByLibrary.simpleMessage(
            "Incorrect password. Please recheck the field."),
        "psswdTooShort": MessageLookupByLibrary.simpleMessage(
            "Password too short. Please use at least 4 characters."),
        "selectDate": MessageLookupByLibrary.simpleMessage("Select a date"),
        "selectImg": MessageLookupByLibrary.simpleMessage("Select an image"),
        "signup": MessageLookupByLibrary.simpleMessage("Sign up!"),
        "tasknameEmpty": MessageLookupByLibrary.simpleMessage(
            "Name empty. Please write a name."),
        "tasknameTaken": MessageLookupByLibrary.simpleMessage(
            "Name taken. Please choose another one."),
        "tasknameTooShort": MessageLookupByLibrary.simpleMessage(
            "Name too short. Please use at least 2 characters."),
        "toastFirstTask":
            MessageLookupByLibrary.simpleMessage("Add your first task!"),
        "username": MessageLookupByLibrary.simpleMessage("Username"),
        "usernameNotFound": MessageLookupByLibrary.simpleMessage(
            "Username not found. Please recheck the field."),
        "usernameTaken": MessageLookupByLibrary.simpleMessage(
            "Username taken. Please choose another one."),
        "usernameTooShort": MessageLookupByLibrary.simpleMessage(
            "Username too short. Please use at least 2 characters."),
        "welcomeReg": MessageLookupByLibrary.simpleMessage("Welcome!")
      };
}
