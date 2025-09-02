/*
FIREBASE IS OUR BACKEND FOR AUTHENTICATION AND STORAGE
 */

import 'package:uc_task_1/features/auth/domain/entities/app_user.dart';
import 'package:uc_task_1/features/auth/domain/repos/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthRepo implements AuthRepo {

  // access to firebase
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // LOGIN
  @override
  Future<AppUser?> loginWithEmailPassword(String email, String Password) async {
    try {
      //attempt to sign in
      UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(email: email, password: Password);

      // Check if the user is not null after sign-in
      if (userCredential.user != null) {
        AppUser user = AppUser(
          uid: userCredential.user!.uid, // Access user from the instance userCredential
          email: email, // or userCredential.user!.email if you prefer (though email is already available)
        );
        return user; // Or do something with the AppUser object
      } else {
        // Handle the case where user is null after a successful sign-in (should be rare but good to check)
        throw Exception('Login successful, but user data is null.');
      }

      // return user; // This line was outside the if, make sure to return appropriately
    }
    catch (e) {
      throw Exception('Login Failed: $e');
    }
  }

  // REGISTER
  @override
  Future<AppUser?> registerWithEmailPassword(String name, String email, String Password) async{
    try {
      //attempt to sign up
      UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: Password);

      // create user
      AppUser user = AppUser(
        uid: userCredential.user!.uid,
        email: email,
      );

      return user;
    }
    catch (e) {
      throw Exception('Registration Failed: $e');
    }
  }

  //DELETE
  @override
  Future<void> deleteAccount() async{
    try {
      final user = firebaseAuth.currentUser;
      if (user == null) throw Exception('No user logged in...');

      await user.delete();

      await logout();
    }
    catch (e) {
      throw Exception('Deletion Failed: $e');
    }
  }


  // GET CURRENT USER
  @override
  Future<AppUser?> getCurrentUser() async {
    //get current user from firebase
    final firebaseUser = firebaseAuth.currentUser;

    // no logged in user
    if (firebaseUser == null) return null;
    //logged in user exists
    return AppUser(uid: firebaseUser.uid, email: firebaseUser.email!);
  }

  //LOGOUT
  @override
  Future<void> logout() async{
    await firebaseAuth.signOut();
  }

  //PASSWORD RESET
  @override
  Future<String> sendPasswordResetEmail(String email) async{
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
      return "Password reset email sent";
    }
    catch (e){
      throw Exception('Error sending password reset email: $e');
    }
  }
  
}
