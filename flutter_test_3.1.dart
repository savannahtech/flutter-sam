Open the Firebase console and go to the "Database" tab.
Click on the "Rules" tab.
In the "Rules" editor, add the following rule:
Code snippet
{
  "rules": {
    ".read": "auth != null",
    ".write": "auth != null"
  }
}

Save the rule.
Once you have saved the rule, any attempt to read or write to the document will be blocked if the user is not authenticated.

Here is an example of how you can use this rule in Flutter:

import 'package:firebase_database/firebase_database.dart';
void main() {
  // Initialize Firebase
  FirebaseDatabase database = FirebaseDatabase.instance;
  // Get a reference to the document
  DatabaseReference documentRef = database.ref('my-document');
  // Listen for changes to the document
  documentRef.onValue((event) {
    // Check if the user is authenticated
    if (FirebaseAuth.currentUser != null) {
      // The user is authenticated, so we can read the document
      print(event.snapshot.value);
    } else {
      // The user is not authenticated, so we cannot read the document
      print('The user is not authenticated');
    }
  });
}
