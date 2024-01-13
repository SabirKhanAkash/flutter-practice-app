import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeActivity(),
    );
  }
}

class HomeActivity extends StatefulWidget {
  const HomeActivity({super.key});

  @override
  _HomeActivityState createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {
  int currentIndex = 0;

  showSnackBar(message, context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      backgroundColor: const Color.fromARGB(255, 0, 73, 120),
      action: SnackBarAction(
          label: 'ঠিক আছে',
          onPressed: ScaffoldMessenger.of(context).hideCurrentSnackBar),
    ));
  }

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP_RIGHT,
      backgroundColor: const Color.fromARGB(255, 0, 73, 120),
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: const Color.fromARGB(255, 0, 73, 120),
        centerTitle: true,
        title: const Text("নৌ টিকিট ব্যবস্থাপনা"),
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.normal),
        actions: [
          IconButton(
            onPressed: () {
              showSnackBar(
                  "অ্যাপটি তৈরী করেছেন আকাশ 💙 সকল অধিকার সংরক্ষিত", context);
            },
            icon: const Icon(Icons.info_outline_rounded),
            color: Colors.white,
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.airplane_ticket_rounded), label: "টিকিট"),
          BottomNavigationBarItem(
              icon: Icon(Icons.calculate_rounded), label: "হিসাব"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_rounded), label: "প্রোফাইল"),
        ],
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
          if (index == 0) {
            showToast("টিকিট কাটতে পারবেন");
          } else if (index == 1) {
            showToast("হিসাব রাখতে পারবেন");
          } else if (index == 2) {
            showToast("নিজ প্রোফাইল দেখতে পারবেন");
          }
        },
      ),
      backgroundColor: const Color.fromARGB(255, 235, 242, 252),
    );
  }
}
