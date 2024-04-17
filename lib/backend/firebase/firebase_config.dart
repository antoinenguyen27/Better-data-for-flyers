import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "",
            authDomain: "busky-2e2fc.firebaseapp.com",
            projectId: "busky-2e2fc",
            storageBucket: "busky-2e2fc.appspot.com",
            messagingSenderId: "252243585716",
            appId: "1:252243585716:web:d582228e03328d2a31c5e1",
            measurementId: "G-49CWNNH93D"));
  } else {
    await Firebase.initializeApp();
  }
}
