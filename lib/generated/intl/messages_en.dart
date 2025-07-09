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

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "generate_invoice": MessageLookupByLibrary.simpleMessage(
      "Generate Invoice",
    ),
    "printReady_invoice": MessageLookupByLibrary.simpleMessage(
      "PrintReady Invoice",
    ),
    "printReady_invoice_description": MessageLookupByLibrary.simpleMessage(
      "Fill in the details below to generate your invoice",
    ),
    "project_description": MessageLookupByLibrary.simpleMessage(
      "Description (Optional)",
    ),
    "project_description_hint": MessageLookupByLibrary.simpleMessage(
      "Provide a brief description of project",
    ),
    "project_details": MessageLookupByLibrary.simpleMessage("Project Details"),
    "project_framework": MessageLookupByLibrary.simpleMessage(
      "Project Framework",
    ),
    "project_framework_hint": MessageLookupByLibrary.simpleMessage(
      "Select the framework...",
    ),
    "project_name": MessageLookupByLibrary.simpleMessage("Project Name"),
    "project_name_hint": MessageLookupByLibrary.simpleMessage(
      "E.g., Corporate Website Redesign",
    ),
    "project_type": MessageLookupByLibrary.simpleMessage("Project Type"),
    "project_type_hint": MessageLookupByLibrary.simpleMessage(
      "Select the type of project",
    ),
    "technologies_used": MessageLookupByLibrary.simpleMessage(
      "Technologies Used",
    ),
    "technologies_used_hint": MessageLookupByLibrary.simpleMessage(
      "Select Technologies...",
    ),
  };
}
