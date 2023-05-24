Open the Firebase console and go to the "Database" tab.
Click on the "Rules" tab.
In the "Rules" editor, add the following rule:
{
  "rules": {
    ".write": "data.hasAll(['field_one', 'field_two'])"
  }
}

Save the rule.
Once you have saved the rule, any attempt to write to the database will be blocked if the data does not include the fields field_one and field_two.

Here is an example of how you can use this rule in Flutter:

import 'package:firebase_database/firebase_database.dart';

void main() {
  // Initialize Firebase
  FirebaseDatabase database = FirebaseDatabase.instance;

  // Get a reference to the document
  DatabaseReference documentRef = database.ref('my-document');

  // Write to the document
  documentRef.set({
    'field_one': 'value1',
    'field_two': 'value2'
  });
}

This code will write the data to the database if the data includes the fields field1 and field2. If the data does not include the fields field_one and field_two, the code will throw an error.

You can also use the validate function to validate incoming data. The validate function takes a document as input and returns a boolean value indicating whether the document is valid. The following code shows how to use the validate function:

import 'package:firebase_database/firebase_database.dart';

void main() {
  // Initialize Firebase
  FirebaseDatabase database = FirebaseDatabase.instance;

  // Get a reference to the document
  DatabaseReference documentRef = database.ref('my-document');

  // Validate the document
  bool isValid = documentRef.validate({
    'field_one': 'value1',
    'field_two': 'value2'
  });

  // If the document is valid, write it to the database
  if (isValid) {
    documentRef.set({
      'field_one': 'value1',
      'field_two': 'value2'
    });
  }
}

