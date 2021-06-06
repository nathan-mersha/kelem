import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kelemapp/model/commerce/coupon.dart';
import 'package:kelemapp/model/commerce/product.dart';

Future<bool> signIn(String email, String emailLink) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailLink(email: email, emailLink: emailLink);
    return true;
  } catch (e) {
    print(e);
    return false;
  }
}

Future<bool> signInWithGoogle() async {
  try {
    print("here");

    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);
    print("here 2");

    return true;
  } catch (e) {
    print("error is $e");

    return false;
  }
}

UploadTask uploadFileStore(String des, File file) {
  try {
    final ref = FirebaseStorage.instance.ref(des);
    return ref.putFile(file);
  } on FirebaseException catch (e) {
    return null;
  }
}

Future<bool> addCoupon(Coupon coupon) async {
  try {
    //  var uid = FirebaseAuth.instance.currentUser.uid;
    var uid = "f9fWxOCNn0eI84R1A8Fa";
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection("Users")
        .doc(uid)
        .collection("Coupon")
        .doc(coupon.code);

    FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot snapshot = await transaction.get(documentReference);
      if (!snapshot.exists) {
        documentReference.set(Coupon.toMap(coupon));
        return true;
      }
      // double newAmount = snapshot.data()["Amount"] + value;
      // transaction.update(documentReference, {"Amount": newAmount});
      return true;
    });

    return true;
  } catch (e) {
    print(e.toString());
  }
  return false;
}

Future<bool> addProduct(Product product) async {
  try {
    //  var uid = FirebaseAuth.instance.currentUser.uid;
    var uid = "micWxOCNn0eI84R1A8Fa";
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("product").doc(uid);

    FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot snapshot = await transaction.get(documentReference);
      if (!snapshot.exists) {
        documentReference.set(Product.toMap(product));
        return true;
      }
      // double newAmount = snapshot.data()["Amount"] + value;
      // transaction.update(documentReference, {"Amount": newAmount});
      return true;
    });

    return true;
  } catch (e) {
    print(e.toString());
  }
  return false;
}
