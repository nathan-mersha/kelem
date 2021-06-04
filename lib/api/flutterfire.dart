import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
    print("here 3");
    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);
    print("here 2");

    return true;
  } catch (e) {
    return false;
  }
}

Future<bool> addCoin(Product product) async {
  try {
    var uid = FirebaseAuth.instance.currentUser.uid;
    var value = double.parse(product.price.toString());
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection("Users")
        .doc(uid)
        .collection("Coin")
        .doc(product.productId);

    FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot snapshot = await transaction.get(documentReference);
      if (!snapshot.exists) {
        documentReference.set({"Amount": value});
        return true;
      }
      double newAmount = snapshot.data()["Amount"] + value;
      transaction.update(documentReference, {"Amount": newAmount});
      return true;
    });

    //await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.trim(), password: password);
    return true;
  } catch (e) {
    print(e.toString());
  }
  return false;
}