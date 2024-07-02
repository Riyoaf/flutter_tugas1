import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/add_user.dart';
import 'package:my_app/list_transaksi.dart';
import 'package:my_app/list_user.dart';
import 'package:my_app/login_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final dio = Dio();
  final myStorage = GetStorage();
  final apiUrl = 'https://mobileapis.manpits.xyz/api';

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(),
        child: NavigationBar(
            selectedIndex: index,
            onDestinationSelected: (index) => setState(() {
                  this.index = index;
                }),
            destinations: [
              NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
              NavigationDestination(
                  icon: Icon(Icons.payment), label: 'Transaksi'),
              NavigationDestination(
                  icon: Icon(Icons.person_rounded), label: 'Profile')
            ]),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 140,
                  width: double.infinity,
                  color: Colors.blue,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    alignment: Alignment.topLeft,
                                    height: 46,
                                    width: 45,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'images/vec.profile.jpg')),
                                        borderRadius: BorderRadius.circular(25),
                                        border: Border.all(
                                            color: Colors.white,
                                            style: BorderStyle.solid,
                                            width: 2)),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    " welcome back !",
                                    style: GoogleFonts.montserrat(
                                        color: Colors.white),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                          Container(
                            alignment: Alignment.topRight,
                            child: Icon(
                              Icons.notifications_active,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white12,
                            borderRadius: BorderRadius.circular(30)),
                        child: TextField(
                          cursorHeight: 20,
                          autofocus: false,
                          decoration: InputDecoration(
                              // hintText: "Search Your dream car",
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 2),
                                  borderRadius: BorderRadius.circular(30))),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  goUser(dio, myStorage, apiUrl);
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    side: const BorderSide(
                                      color: Colors.black26,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  backgroundColor:
                                      Color.fromARGB(255, 2, 98, 176),
                                ),
                                icon: Icon(Icons.check, color: Colors.white),
                                label: const Text(
                                  'check',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ElevatedButton.icon(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AddUser()));
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                    color: Colors.black26,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                backgroundColor:
                                    const Color.fromARGB(255, 2, 98, 176),
                              ),
                              icon: Icon(Icons.person_add, color: Colors.white),
                              label: const Text(
                                'add user',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ElevatedButton.icon(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ListUser()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                    color: Colors.black26,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                backgroundColor:
                                    Color.fromARGB(255, 2, 98, 176),
                              ),
                              icon: Icon(Icons.list, color: Colors.white),
                              label: const Text(
                                'check list',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ElevatedButton.icon(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ListTransaksi(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                    color: Colors.black26,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                backgroundColor:
                                    Color.fromARGB(255, 2, 98, 176),
                              ),
                              icon:
                                  Icon(Icons.attach_money, color: Colors.white),
                              label: const Text(
                                'Transaksi Anggota',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ElevatedButton.icon(
                              onPressed: () {
                                goLogout(context, dio, apiUrl, myStorage);
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                    color: Colors.black26,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                backgroundColor:
                                    Color.fromARGB(255, 2, 98, 176),
                              ),
                              icon: Icon(Icons.logout, color: Colors.white),
                              label: const Text(
                                'Logout',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ]),
                    ),
                    // BATAS NAMBAHIN PADIING BARU
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

// fungsi login
void goUser(dio, myStorage, apiUrl) async {
  try {
    final response = await dio.get(
      '$apiUrl/user',
      options: Options(
        headers: {'Authorization': 'Bearer ${myStorage.read('token')}'},
      ),
    );
    print(response.data);
  } on DioException catch (e) {
    print('${e.response} - ${e.response?.statusCode}');
  }
}

// Fungsi logout
void goLogout(context, dio, apiUrl, myStorage) async {
  try {
    final response = await dio.get(
      '$apiUrl/logout',
      options: Options(
        headers: {'Authorization': 'Bearer ${myStorage.read('token')}'},
      ),
    );
    print(response.data);

    myStorage.remove('token');

    // Balik ke halaman login
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
    );
  } on DioException catch (e) {
    print('Error : ${e.response?.statusCode} - ${e.response?.data}');
  }
}
