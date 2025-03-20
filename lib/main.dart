import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:intl/intl.dart'; // Import the intl package to format today's date

void main() {
  runApp(BankingApp());
}

class BankingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Banking App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get today's date
    String todayDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

    return Scaffold(
      appBar: AppBar(title: Text('Welcome')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Bank logo - make sure you have a logo image in assets
            Image.asset('assets/bank_logo.png', height: 100),  // Update the path to your logo
            SizedBox(height: 20),
            Text(
              'Welcome to Your Bank',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 10),
            Text(
              'Today\'s Date: $todayDate',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AccountListScreen()),
                );
              },
              child: Text('View Accounts'),
            ),
          ],
        ),
      ),
    );
  }
}

class AccountListScreen extends StatefulWidget {
  @override
  _AccountListScreenState createState() => _AccountListScreenState();
}

class _AccountListScreenState extends State<AccountListScreen> {
  List<dynamic> accounts = [];

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  Future<void> loadJsonData() async {
    String jsonString1 = await rootBundle.loadString('assets/accounts.json');
    setState(() {
      accounts = json.decode(jsonString1)['accounts'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Accounts')),
      body: ListView.builder(
        itemCount: accounts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(accounts[index]['type']),
            subtitle: Text('Balance: \$${accounts[index]['balance']}'),
            trailing: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TransactionsScreen(accounts[index]['type']),
                  ),
                );
              },
              child: Text('View Transactions'),
            ),
          );
        },
      ),
    );
  }
}

class TransactionsScreen extends StatelessWidget {
  final String accountType;

  TransactionsScreen(this.accountType);

  Future<List<dynamic>> loadTransactions() async {
    String jsonString2 = await rootBundle.loadString('assets/transactions.json');
    Map<String, dynamic> allTransactions = json.decode(jsonString2)['transactions'];

    // Filter transactions by account type
    List<dynamic> transactions = allTransactions[accountType] ?? [];
    return transactions;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Transactions')),
      body: FutureBuilder(
        future: loadTransactions(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          List<dynamic> transactions = snapshot.data!;
          return ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(transactions[index]['description']),
                subtitle: Text('Amount: \$${transactions[index]['amount']}'),
              );
            },
          );
        },
      ),
    );
  }
}
