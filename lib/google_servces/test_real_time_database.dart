import 'package:fire_base_project2/components/textformfield.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class TestRealTimeDatabase extends StatefulWidget {
  const TestRealTimeDatabase({super.key});

  @override
  State<TestRealTimeDatabase> createState() => _TestRealTimeDatabaseState();
}

class _TestRealTimeDatabaseState extends State<TestRealTimeDatabase> {
  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref('user/123');
  DatabaseReference ref2 = FirebaseDatabase.instance.ref('posts');
  DatabaseReference ref3 = FirebaseDatabase.instance.ref();
  Future<void> setData() async {
    await ref.set({
      'name': 'John Doe',
      'age': 30,
      'email': 'john.doe@example.com',
      'address': {
        'street': '123 main st',
        'city': 'anytown',
        'state': 'ca',
        'zip': '12345',
      },
    });
  }

  TextEditingController editingController = TextEditingController();
  @override
  void initState() {
    listenPosts(ref2);
    super.initState();
  }

  @override
  void dispose() {
    editingController.dispose();
    super.dispose();
  }

  void listenPosts(DatabaseReference ref2) {
    ref2.onValue.listen((event) {
      final data = event.snapshot.value;
      print(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Test Real Time Database')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('This is a placeholder for Real Time Database testing.'),
            TextButton(
              onPressed: () {
                setData();
              },
              child: Text('set data'),
            ),
            TextButton(
              onPressed: () async {
                await ref.update({'age': 31});
              },
              child: Text('update data'),
            ),
            TextButton(
              onPressed: () async {
                await ref2.update({
                  '123/age': 32,
                  '123/address/city': 'newcity',
                });
              },
              child: Text('update data2'),
            ),
            TextButton(
              onPressed: () async {
                final snapshot = await ref3.child('users').get();
                if (snapshot.exists) {
                  print('${snapshot.value}');
                } else {
                  print('no data available');
                }
              },
              child: Text('get users get()'),
            ),
            TextButton(
              onPressed: () async {
                final snapshot = await ref3.child('posts').get();
                Map data = snapshot.value as Map;
                if (snapshot.exists) {
                  print('${data['post1']}');
                } else {
                  print('no data available');
                }
              },
              child: Text('get posts get()'),
            ),
            // difference between get() and once() is that once() listens for a single event and then stops listening, while get() retrieves the data once without setting up a listener.
            TextButton(
              onPressed: () async {
                final snapshot = await ref3
                    .child('posts')
                    .once(DatabaseEventType.value);
                Map data = snapshot.snapshot.value as Map;
                if (snapshot.snapshot.exists) {
                  print('${data['post1']}');
                } else {
                  print('no data available');
                }
              },
              child: Text('get posts once()'),
            ),
            TextButton(
              onPressed: () async {
                final newPostKay = ref3.child('posts').push().key;
                await ref3.child('posts').update({
                  '$newPostKay': {
                    'text': 'hello world',
                    'timestamp': DateTime.now().hour,
                    'views': 3,
                  },
                });
              },
              child: Text('generate new post using push()'),
            ),
            CustomTextForm(
              validator: (val) {
                if (val!.isEmpty) {
                  return 'Field is required';
                }
                return null;
              },
              hinttext: 'Enter post id you want to remove',
              mycontroller: editingController,
            ),
            TextButton(
              onPressed: () async {
                String postId = editingController.text;
                if (postId.isNotEmpty) {
                  await ref3.child('posts/$postId').remove();
                }
              },
              child: Text('remove post'),
            ),
            TextButton(
              onPressed: () async {
                String postId = editingController.text;
                if (postId.isNotEmpty) {
                  await ref3.child('posts/$postId').remove();
                }
              },
              child: Text('increament views post'),
            ),
          ],
        ),
      ),
    );
  }
}
