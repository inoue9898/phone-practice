import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Map<String, String>> contacts = [
    {'name': '江戸川　コナン', 'number': '070-1234-5678', 'address': '東京都'},
    {'name': '毛利　蘭', 'number': '080-1234-5678', 'address': '埼玉県'},
    {'name': '黒羽　海斗', 'number': '090-1234-5678', 'address': '群馬県'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
        body: ListView.builder(
            itemCount: contacts.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(Icons.phone),
                title: Text(contacts[index]['name']!),
                subtitle: Text(contacts[index]['number']!),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return NextPage(contact: contacts[index]);
                    })
                  );
                },
              );
        }
      )
    );
  }
}

class NextPage extends StatelessWidget {
  const NextPage({Key? key,required this.contact}) : super(key: key);

  final Map<String, String> contact;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${contact['name']}'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(width: 40,),
                  Icon(Icons.account_circle,size: 30,),
                  Text('名前:${contact['name']}'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(width: 40,),
                  Icon(Icons.phone,size: 30,),
                  Text('電話:${contact['number']}'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(width: 40,),
                  Icon(Icons.home,size: 30,),
                  Text('住所:${contact['address']}'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.phone,
                        size: 30,
                      ),
                      Text('電話を掛ける'),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}

