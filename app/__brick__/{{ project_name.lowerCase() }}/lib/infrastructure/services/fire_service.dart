import 'package:firebase_core/firebase_core.dart';

class FireService {
  Future<void> init() async {
    await Firebase.initializeApp();
  }
}
