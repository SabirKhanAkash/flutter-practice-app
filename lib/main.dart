import 'package:flutter/material.dart';

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
          textColor: Colors.white,
          onPressed: ScaffoldMessenger.of(context).hideCurrentSnackBar),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: const Color.fromARGB(255, 0, 73, 120),
        centerTitle: true,
        title: const Text(
          "নৌ টিকিট ব্যবস্থাপনা",
          style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.normal,
              fontFamily: 'balooda'),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showSnackBar(
                  const Text(
                    "অ্যাপটি তৈরী করেছেন আকাশ 💙 সকল অধিকার সংরক্ষিত",
                    style: TextStyle(fontFamily: 'balooda'),
                  ),
                  context);
            },
            icon: const Icon(Icons.info_outline_rounded),
            color: Colors.white,
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: const Color.fromARGB(255, 0, 73, 120),
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
            showSnackBar("টিকিট কাটতে পারবেন", context);
          } else if (index == 1) {
            showSnackBar("হিসাব রাখতে পারবেন", context);
          } else if (index == 2) {
            showSnackBar("নিজ প্রোফাইল দেখতে পারবেন", context);
          }
        },
      ),
      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 235, 242, 252),
        child: ListView(
          children: [
            const DrawerHeader(
                padding: EdgeInsets.all(0),
                child: UserAccountsDrawerHeader(
                    decoration: BoxDecoration(color: Color.fromARGB(255, 0, 73, 120)),
                    accountName: Text("নৌ টিকিট ব্যবস্থাপনায়\nআপনাকে স্বাগতম",
                        style: TextStyle(
                            fontFamily: 'balooda',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    accountEmail: Text("nou.support@gmail.com"))),
            ListTile(
                title: const Text("হোমপেজ",
                    style: TextStyle(fontFamily: 'balooda')),
                leading: const Icon(Icons.home_rounded,
                    color: Color.fromARGB(255, 0, 73, 120)),
                onTap: () {
                  showSnackBar("হোমপেজ চেপেছেন", context);
                }),
            ListTile(
                title: const Text("গোপনীয়তা শর্তাবলী",
                    style: TextStyle(fontFamily: 'balooda')),
                leading: const Icon(Icons.info_outline_rounded,
                    color: Color.fromARGB(255, 0, 73, 120)),
                onTap: () {
                  showSnackBar("গোপনীয়তা শর্তাবলী চেপেছেন", context);
                }),
            ListTile(
                title: const Text("নীতিমালা",
                    style: TextStyle(fontFamily: 'balooda')),
                leading: const Icon(Icons.edit_document,
                    color: Color.fromARGB(255, 0, 73, 120)),
                onTap: () {
                  showSnackBar("নীতিমালা চেপেছেন", context);
                }),
            ListTile(
                title: const Text("ভার্শন চেক করুন",
                    style: TextStyle(fontFamily: 'balooda')),
                leading: const Icon(Icons.update_rounded,
                    color: Color.fromARGB(255, 0, 73, 120)),
                onTap: () {
                  showSnackBar("ভার্শন চেক করুন চেপেছেন", context);
                }),
            ListTile(
                title: const Text("লগ আউট করুন",
                    style: TextStyle(fontFamily: 'balooda')),
                leading: const Icon(Icons.logout_rounded,
                    color: Color.fromARGB(255, 0, 73, 120)),
                onTap: () {
                  showSnackBar("লগ আউট চেপেছেন", context);
                }),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 235, 242, 252),
    );
  }
}
