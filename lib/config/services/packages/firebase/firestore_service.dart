// part of 'firebase_service.dart';

// typedef QSS<T> = QuerySnapshot<T>;
// typedef DSS<T> = DocumentSnapshot<T>;

// class FirestoreService {
//   static Future<DocumentSnapshot<Map<String, dynamic>>?> sendData(
//     Map<String, dynamic> data, {
//     String collection = 'errors',
//     String? docId,
//   }) async {
//     try {
//       return createDoc(collection: collection, data: data, docId: docId);
//     } catch (e) {
//       print('+++++Send error:=$collection error:=$e');
//     }
//     return null;
//     // try {
//     //   final count =
//     //       await FirebaseFirestore.instance.collection(collection).count().get();
//     //   if ((count.count ?? 0) < 1) {
//     //     return createDoc(
//     //         collection: collection, data: {'email': "required_data"});
//     //   }
//     //   return null;
//     // } catch (e) {
//     //   throw '+++++Create collection:=$collection error:=$e';
//     // }
//   }

//   static void addNewLog(
//     Map<String, dynamic> newLog, {
//     String collection = 'log',
//     String? docId,
//   }) async {
//     DocumentReference logDocRef =
//         FirebaseFirestore.instance.collection(collection).doc(docId);
//     try {
//       // Check if the document exists
//       DocumentSnapshot docSnapshot = await logDocRef.get();
//       if (docSnapshot.exists) {
//         // Document exists, update it by appending the new log
//         await logDocRef.update({
//           'logs': FieldValue.arrayUnion([newLog]),
//         });
//         print("New log added successfully!");
//       } else {
//         // Document does not exist, create a new one
//         await logDocRef.set({
//           'logs': [newLog], // Create a new array with the first log
//         });
//         print("Document created and new log added successfully!");
//       }
//     } catch (e) {
//       print("Error adding new log: $e");
//     }
//   }

//   static Future<DocumentSnapshot<Map<String, dynamic>>> createDoc({
//     String collection = 'errors',
//     required Map<String, dynamic> data,
//     String? docId,
//   }) async {
//     final collect = FirebaseFirestore.instance.collection(collection);
//     try {
//       DocumentReference<Map<String, dynamic>> doc;
//       if (docId != null) {
//         doc = collect.doc(docId)..set(data);
//       } else {
//         doc = await collect.add(data);
//       }
//       return doc.get();
//     } catch (e) {
//       throw 'Error on FirestoreService createDoc:=$e';
//     }
//   }

//   static late CollectionReference<UserData> userRef;
//   static late DocumentReference<UserData> myBalance;

//   // static void initBalance() {
//   //   userRef = FirebaseFirestore.instance
//   //       .collection('errors')
//   //       .withConverter<UserData>(
//   //         fromFirestore: (snapshots, _) => UserData.fromMap(snapshots.data()!),
//   //         toFirestore: (user, _) => user.toMap(),
//   //       );
//   //   myBalance = userRef.doc('${Boxes.email?.emailToName()}_${Boxes.uId}');
//   // }

//   // static Future<bool> toWithdraw(String address, double amount) async {
//   //   final myDoc = await myBalance.get();
//   //   final me = myDoc.data();
//   //   if (me?.address == null) return false;
//   //   await changeusdBalance(me!.address!, -amount)
//   //       .then((value) => changeusdBalance(address, amount - 1));
//   //   return true;
//   // }

//   // static Future changeusdBalance(String address, double amount) async {
//   //   final sendingUserData = await getUserFromAddress(address: address);
//   //   if (sendingUserData == null) return;
//   //   final data = sendingUserData.data();
//   //   final sendingUser = UserData.fromMap(data);
//   //   final newUser = sendingUser.copyWith(
//   //     usdBalance: (sendingUser.usdBalance ?? 0) + amount,
//   //   );
//   //   await sendingUserData.reference.update(newUser.toMap());
//   // }

//   // static Future<UserData> createUser(
//   //   UserData user, {
//   //   String collection = 'errors',
//   // }) async {
//   //   if (user.email == null) throw '+++User.email cant be empty!';
//   //   final checkedUser = await getUserFromEmail(email: user.email!);
//   //   if (checkedUser != null) {
//   //     return UserData.fromMap(checkedUser);
//   //   }
//   //   final createdDoc = await createDoc(
//   //       data: user.toMap(), docId: "${user.email?.emailToName()}_${user.uid}");
//   //   final data = createdDoc.data();
//   //   if (data == null) {
//   //     throw '+++FireStore user data not found!';
//   //   }
//   //   return UserData.fromMap(data);
//   // }

//   // static Future<Map<String, dynamic>?> getUserFromEmail({
//   //   String collection = 'errors',
//   //   required String email,
//   // }) async {
//   //   var query = await FirebaseFirestore.instance
//   //       .collection(collection)
//   //       .where('email', isEqualTo: email)
//   //       .limit(1)
//   //       .get();

//   //   if (query.size == 0) {
//   //     return null;
//   //   } else {
//   //     final doc = query.docs.first;
//   //     return doc.data();
//   //   }
//   // }

//   // static Future<QueryDocumentSnapshot<Map<String, dynamic>>?>
//   //     getUserFromAddress({
//   //   String collection = 'errors',
//   //   required String address,
//   // }) async {
//   //   var query = await FirebaseFirestore.instance
//   //       .collection(collection)
//   //       .where('address', isEqualTo: address)
//   //       .limit(1)
//   //       .get();

//   //   if (query.size == 0) {
//   //     return null;
//   //   } else {
//   //     return query.docs.first;
//   //   }
//   // }

//   // static Future<QueryDocumentSnapshot<Map<String, dynamic>>?> searchField(
//   //   String collection,
//   //   String fieldKey,
//   //   String data,
//   // ) async {
//   //   bool result;
//   //   final querySnapshot = await FirebaseFirestore.instance
//   //       .collection(collection)
//   //       .where(fieldKey, isEqualTo: data)
//   //       .get();

//   //   if (querySnapshot.docs.isNotEmpty) {
//   //     // User found
//   //     final userDoc = querySnapshot.docs.first;
//   //     print('User found: ${userDoc.data()}  ${userDoc.id}');
//   //     return userDoc;
//   //   } else {
//   //     print('User not found');
//   //     return null;
//   //   }
//   // }
// }
