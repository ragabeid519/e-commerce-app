import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_base_project2/components/textformfield.dart';
import 'package:fire_base_project2/google_servces/firestore_services_class.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MyHomePage extends StatefulWidget {
  final String email;
  final String password;
  const MyHomePage({super.key, required this.email, required this.password});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late var userEmail = '';
  var userName = '';
  var userPoints = 0;
  final firestoreClass = FirestoreServicesClass();
  final List<Map<String, dynamic>> users = [];
  bool isLoading = false;

  TextEditingController docIdController = TextEditingController();

  void getData() {
    firestoreClass.getUsers().then((snapshot) {
      for (var doc in snapshot.docs) {
        if (users.any((element) => element['id'] == doc.id)) {
          continue;
        }
        final data = doc.data() as Map<String, dynamic>;

        if (!users.contains(data)) {
          users.add(data);
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    // isLoading = true;
  }

  @override
  void dispose() {
    docIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Test Firestore"),
        actions: [
          IconButton(
            onPressed: () async {
              await GoogleSignIn.instance.signOut();
              await FirebaseAuth.instance.signOut();
              Navigator.of(
                context,
              ).pushNamedAndRemoveUntil('/loginandreg', (route) => false);
            },
            icon: Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: ListView(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.email, style: TextStyle(color: Colors.black)),
                Text(widget.password),

                StreamBuilder(
                  stream: firestoreClass.usersCollection.snapshots(),
                  builder: (context, snapshots) {
                    if (snapshots.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (snapshots.hasError || !snapshots.hasData) {
                      return Center(child: Text("Fire Store Error"));
                    }
                    final docs = snapshots.data!.docs;
                    return Center(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: docs.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              title: Text(docs[index].id),
                              subtitle: Text(docs[index]['name']),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
                // isLoading
                //     ? CircularProgressIndicator()
                //     : Column(
                //         children: [
                //           ...List.generate(users.length, (index) {
                //             final user = users[index];
                //             return Column(
                //               crossAxisAlignment: CrossAxisAlignment.start,
                //               children: [
                //                 for (var key in user.keys)
                //                   if (key != 'id') ...[
                //                     showTextSpan(
                //                       context: context,
                //                       labelText: '$key:  ',
                //                       userData: user[key].toString(),
                //                     ),
                //                     SizedBox(height: 5),
                //                   ],
                //                 Divider(color: Colors.grey),
                //               ],
                //             );
                //           }),
                //         ],
                //       ),
                // Divider(color: Colors.black),

                // Divider(color: Colors.black),

                // TextButton(
                //   onPressed: () {
                //     setState(() {
                //       isLoading = true;
                //     });
                //     if (users.isEmpty) {
                //       getData();
                //     }

                //     isLoading = false;
                //     setState(() {});
                //   },
                //   child: Text(
                //     "Get Data",
                //     style: TextStyle(color: Colors.blue, fontSize: 20),
                //   ),
                // ),
                SizedBox(height: 20),
                ////////////get user by id ////////////
                CustomTextForm(
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Field is required';
                    }
                    return null;
                  },
                  hinttext: "Enter Document ID",
                  mycontroller: docIdController,
                ),

                TextButton(
                  onPressed: () {
                    String docId = docIdController.text.trim();
                    if (docId.isEmpty) return;
                    firestoreClass.getUserById(docId).then((userData) {
                      if (userData != null) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('User Data'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                for (var key in userData.keys) ...[
                                  showTextSpan(
                                    context: context,
                                    labelText: '$key:',
                                    userData: userData[key].toString(),
                                  ),
                                  SizedBox(height: 8),
                                ],
                              ],
                            ),

                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text('OK'),
                              ),
                            ],
                          ),
                        );
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Error'),
                            content: Text('No user found with ID $docId'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text('OK'),
                              ),
                            ],
                          ),
                        );
                      }
                    });
                  },
                  child: Text("get user by id"),
                ),
                ////////////update user by id ////////////
                TextButton(
                  onPressed: () {
                    String docId = docIdController.text.trim();
                    if (docId.isEmpty) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Error'),
                            content: Text(
                              'Please enter a Document ID to update.',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                      return;
                    }
                    setState(() {
                      firestoreClass.updateUser(docId, {
                        'name': 'ragab Name',
                        'email': 'ragab@example.com',
                      });
                    });
                  },
                  child: Text("Update User"),
                ),
                ///////////add new document ////////////
                TextButton(
                  onPressed: () {
                    setState(() {
                      firestoreClass.addUser2(
                        docID: docIdController.text.trim().isEmpty
                            ? 'user_${DateTime.now().hour}'
                            : docIdController.text.trim(),
                        userData: {
                          'name': 'New User',
                          'email': 'newuser@example.com',
                        },
                      );
                    });
                  },
                  child: Text("Add New User"),
                ),
                ///////////ubdate using set with merge//////////
                TextButton(
                  onPressed: () {
                    String docId = docIdController.text.trim();
                    if (docId.isEmpty) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Error'),
                            content: Text(
                              'Please enter a Document ID to update.',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                      return;
                    }
                    setState(() {
                      firestoreClass.updateUserUsingSet(docId, {'points': 100});
                    });
                  },
                  child: Text("Update User Using Set with Merge"),
                ),
                TextButton(
                  onPressed: () async {
                    await firestoreClass.usersCollection.doc("user1").update({
                      'lang': FieldValue.arrayRemove(['en']),
                    });
                    setState(() {});
                  },
                  child: Text("remove lang"),
                ),
                TextButton(
                  onPressed: () async {
                    await firestoreClass.usersCollection.doc("user1").update({
                      'lang': FieldValue.arrayUnion(['en']),
                    });
                    setState(() {});
                  },
                  child: Text("add lang"),
                ),
                TextButton(
                  onPressed: () async {
                    await firestoreClass.usersCollection.doc("user1").update({
                      'points': FieldValue.increment(2),
                    });
                    setState(() {});
                  },
                  child: Text("increament points"),
                ),
                TextButton(
                  onPressed: () async {
                    final docSnapshot = await firestoreClass.usersCollection
                        .doc("user1")
                        .collection('posts')
                        .get();
                    for (var element in docSnapshot.docs) {
                      print(element.id);
                    }
                  },
                  child: Text("get collection posts from doc user"),
                ),
                TextButton(
                  onPressed: () async {
                    final docSnapshot = await firestoreClass.usersCollection
                        .where('isActive', isEqualTo: true)
                        .get();
                    for (var element in docSnapshot.docs) {
                      print(element.id);
                    }
                  },
                  child: Text("get user is active"),
                ),
                TextButton(
                  onPressed: () async {
                    final docSnapshot = await firestoreClass.usersCollection
                        .where('points', isLessThan: 100)
                        .get();
                    for (var element in docSnapshot.docs) {
                      print(element.id);
                    }
                  },
                  child: Text("get user by points"),
                ),
                TextButton(
                  onPressed: () async {
                    final docSnapshot = await firestoreClass.usersCollection
                        .where('lang', arrayContains: 'ar')
                        .get();
                    for (var element in docSnapshot.docs) {
                      print(element.id);
                    }
                  },
                  child: Text("get user by lang using contain"),
                ),
                TextButton(
                  onPressed: () async {
                    final docSnapshot = await firestoreClass.usersCollection
                        .where('lang', arrayContainsAny: ['ar', 'fr'])
                        .get();
                    for (var element in docSnapshot.docs) {
                      print(element.id);
                    }
                  },
                  child: Text("get user by lang using contain any"),
                ),
                TextButton(
                  onPressed: () async {
                    final docSnapshot = await firestoreClass.usersCollection
                        .where(
                          Filter.and(
                            Filter('lang', arrayContainsAny: ['ar', 'fr']),
                            Filter('points', isLessThan: 100),
                          ),
                        )
                        .get();
                    for (var element in docSnapshot.docs) {
                      print(element.id);
                    }
                  },
                  child: Text("get user by lang using filter"),
                ),
                TextButton(
                  onPressed: () async {
                    final docSnapshot = await firestoreClass.usersCollection
                        .where('name', whereNotIn: ['ragab', 'mostafa'])
                        // .where('name', whereIn: ['ragab', 'mostafa'])
                        .get();
                    for (var element in docSnapshot.docs) {
                      print(element.id);
                    }
                  },
                  child: Text("get user by lang using wherein"),
                ),
                TextButton(
                  onPressed: () async {
                    final docSnapshot = await firestoreClass.usersCollection
                        .orderBy('points', descending: false)
                        .limit(2)
                        .get();
                    for (var element in docSnapshot.docs) {
                      print(element.id);
                    }
                  },
                  child: Text("get user by orderd by and using limit"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Text showTextSpan({
    required BuildContext context,
    required String labelText,
    required String userData,
  }) {
    return Text.rich(
      TextSpan(
        text: '$labelText  ',
        style: TextStyle(fontSize: 18),
        children: <TextSpan>[
          TextSpan(
            text: userData,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
