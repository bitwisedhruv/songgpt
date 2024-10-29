import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:songgpt/core/providers/firebase_providers.dart';
import 'package:songgpt/features/auth/models/user_model.dart';

final authRepositoryProvider = Provider(
  (ref) => AuthRepository(
    auth: ref.read(authProvider),
    firestore: ref.read(firestoreProvider),
    googleSignIn: ref.read(googleSignInProvider),
  ),
);

class AuthRepository {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;
  final GoogleSignIn _googleSignIn;

  AuthRepository({
    required FirebaseAuth auth,
    required FirebaseFirestore firestore,
    required GoogleSignIn googleSignIn,
  })  : _auth = auth,
        _firestore = firestore,
        _googleSignIn = googleSignIn;

  Stream<User?> get authState => _auth.authStateChanges();

  Future<AppUserModel> signUpWithEmail({
    required String name,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      AppUserModel userModel =
          AppUserModel(name: name, email: email, uid: userCredential.user!.uid);
      await _firestore.collection('users').doc(_auth.currentUser!.uid).set(
            userModel.toMap(),
          );
      return userModel;
    } on FirebaseAuthException catch (e) {
      throw (e.message!);
    }
  }

  Future<void> signInWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw e.message!;
    }
  }

  Future<AppUserModel> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      if (googleAuth?.accessToken != null && googleAuth?.idToken != null) {
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );

        UserCredential userCredential =
            await _auth.signInWithCredential(credential);

        AppUserModel userModel;

        if (userCredential.user != null) {
          if (userCredential.additionalUserInfo!.isNewUser) {
            userModel = AppUserModel(
              name: userCredential.user!.displayName.toString(),
              email: userCredential.user!.email.toString(),
              uid: userCredential.user!.uid,
            );
            await _firestore
                .collection('users')
                .doc(userCredential.user!.uid)
                .set(userModel.toMap());
          } else {
            userModel = await getUserData(userCredential.user!.uid).first;
          }
          return userModel;
        }
      }
      throw 'Google Sign in complete';
    } on FirebaseAuthException catch (e) {
      throw e.message!;
    }
  }

  Stream<AppUserModel> getUserData(String uid) {
    return _firestore.collection('users').doc(uid).snapshots().map(
          (event) => AppUserModel.fromMap(
            event.data() as Map<String, dynamic>,
          ),
        );
  }

  void logout() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}
