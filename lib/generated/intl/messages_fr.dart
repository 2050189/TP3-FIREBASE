// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a fr locale. All the
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
  String get localeName => 'fr';

  static String m0(Username) => "Salut, ${Username}!";

  static String m1(Percentage) => "${Percentage}% fait";

  static String m2(Percentage) => "Temps restant : ${Percentage}%";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "back": MessageLookupByLibrary.simpleMessage("Retour"),
        "confirmPassword":
            MessageLookupByLibrary.simpleMessage("Confirmez le mot de passe"),
        "create": MessageLookupByLibrary.simpleMessage("Créer la tâche"),
        "createTask": MessageLookupByLibrary.simpleMessage("Créer une tâche"),
        "editProgress":
            MessageLookupByLibrary.simpleMessage("Modifier la tâche"),
        "existingAccount":
            MessageLookupByLibrary.simpleMessage("Compte existant?"),
        "helloLog": MessageLookupByLibrary.simpleMessage("Bonjour!"),
        "hiUser": m0,
        "hintConf": MessageLookupByLibrary.simpleMessage(
            "Réécrivez votre mot de passe"),
        "hintPassword":
            MessageLookupByLibrary.simpleMessage("4 caractères minimum"),
        "hintTask": MessageLookupByLibrary.simpleMessage(
            "Ex : Examen de mathématiques"),
        "hintUsername":
            MessageLookupByLibrary.simpleMessage("2 caractères minimum"),
        "home": MessageLookupByLibrary.simpleMessage("Accueil"),
        "instructionLog":
            MessageLookupByLibrary.simpleMessage("Veuillez vous connecter."),
        "instructionReg":
            MessageLookupByLibrary.simpleMessage("Veuillez vous inscrire."),
        "loading": MessageLookupByLibrary.simpleMessage("Attente..."),
        "login":
            MessageLookupByLibrary.simpleMessage("Se connecter avec Google"),
        "logout": MessageLookupByLibrary.simpleMessage("Déconnexion"),
        "nameTask": MessageLookupByLibrary.simpleMessage("Nom de la tâche"),
        "noAccount": MessageLookupByLibrary.simpleMessage("Pas de compte?"),
        "noNetwork": MessageLookupByLibrary.simpleMessage(
            "Aucun réseau, veuillez revérifier votre connexion Internet et rechargez la page."),
        "password": MessageLookupByLibrary.simpleMessage("Mot de passe"),
        "percDone": m1,
        "percTimeSpent": m2,
        "photoLibrary": MessageLookupByLibrary.simpleMessage("Galerie"),
        "psswdDiff": MessageLookupByLibrary.simpleMessage(
            "Mot de passe différent de la confirmation. Veuillez revérifier les champs."),
        "psswdInc": MessageLookupByLibrary.simpleMessage(
            "Mot de passe incorrect. Veuillez revérifier le champs."),
        "psswdTooShort": MessageLookupByLibrary.simpleMessage(
            "Mot de passe trop court. Veuillez utiliser au moins 4 caractères."),
        "selectDate":
            MessageLookupByLibrary.simpleMessage("Selectionnez une date"),
        "selectImg":
            MessageLookupByLibrary.simpleMessage("Sélectionnez une image"),
        "signup": MessageLookupByLibrary.simpleMessage("S\'inscrire!"),
        "tasknameEmpty": MessageLookupByLibrary.simpleMessage(
            "Nom vide. Veuillez écrire un nom."),
        "tasknameTaken": MessageLookupByLibrary.simpleMessage(
            "Nom déjà pris. Veuillez en choisir un autre."),
        "tasknameTooShort": MessageLookupByLibrary.simpleMessage(
            "Nom trop court. Veuillez utiliser au moins 2 caractères."),
        "toastFirstTask": MessageLookupByLibrary.simpleMessage(
            "Ajoutez votre première tâche!"),
        "username": MessageLookupByLibrary.simpleMessage("Pseudo"),
        "usernameNotFound": MessageLookupByLibrary.simpleMessage(
            "Pseudo non trouvé. Veuillez revérifier le champs."),
        "usernameTaken": MessageLookupByLibrary.simpleMessage(
            "Pseudo déjà pris. Veuillez en choisir un autre."),
        "usernameTooShort": MessageLookupByLibrary.simpleMessage(
            "Pseudo trop court. Veuillez utiliser au moins 2 caractères."),
        "welcomeReg": MessageLookupByLibrary.simpleMessage("Bienvenue!")
      };
}
