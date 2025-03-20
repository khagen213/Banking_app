# Banking App

## Overview
The **Banking App** is a simple mobile application built with **Flutter** that simulates a banking system. It allows users to view their bank accounts, check account balances, and see a list of transactions associated with each account. The app uses local JSON files to simulate the data storage and retrieval of account and transaction information.

## Features
- **Welcome Screen**: Displays a welcoming message and the current date.
- **Account List**: Lists the available bank accounts with their balances. Users can view detailed transaction histories for each account.
- **Transaction List**: Displays a list of transactions for each selected account, showing descriptions and amounts for each transaction.

## Purpose
This app serves as a simple demonstration of Flutter's capabilities in building a banking interface. It is designed to help users interact with basic financial information, such as account balances and transaction details, without needing an internet connection.

## Files and Structure
The project consists of the following key files:

### 1. **main.dart**
- Contains the core Flutter code for the app.
- Implements three screens:
    - **WelcomeScreen**: Displays a greeting message and the current date.
    - **AccountListScreen**: Displays a list of user accounts fetched from a local JSON file.
    - **TransactionsScreen**: Displays the list of transactions for a selected account, also fetched from a JSON file.

### 2. **assets/accounts.json**
- Contains a list of bank accounts with account details like type, account number, and balance.
- Example:
  ```json
  {
    "accounts": [
      {
        "type": "Chequing",
        "account_number": "CHQ123456789",
        "balance": 2500.00
      },
      {
        "type": "Savings",
        "account_number": "SAV987654321",
        "balance": 5000.00
      }
    ]
  }
  ```

### 3. **assets/transactions.json**
- Contains the transaction history for each account.
- The transactions are categorized by account type (Chequing, Savings).
- Example:
  ```json
  {
    "transactions": {
      "Chequing": [
        {
          "date": "2024-04-14",
          "description": "Utility Bill Payment",
          "amount": -120.00
        },
        {
          "date": "2024-04-16",
          "description": "ATM Withdrawal",
          "amount": -75.00
        }
      ],
      "Savings": [
        {
          "date": "2024-04-12",
          "description": "Withdrawal",
          "amount": -300.00
        },
        {
          "date": "2024-04-15",
          "description": "Interest",
          "amount": 10.00
        }
      ]
    }
  }
  ```

## Code Changes
Here is a summary of the important changes made to the initial codebase:

### 1. **loadJsonData() Method**
- The method to load data from local JSON files (`accounts.json` and `transactions.json`) was implemented to populate the account list and transaction details dynamically.

### 2. **State Management**
- `StatefulWidget` was used in `AccountListScreen` to manage the state of the app as the user navigates and views different accounts and transactions.

### 3. **Transactions Filtering**
- A method `loadTransactions()` was implemented in the `TransactionsScreen` to filter transactions by account ID. This ensures that only transactions related to the selected account are shown.

### 4. **UI Enhancements**
- The user interface was updated to include buttons for navigation between different screens (Account List to Transactions List).
- A loading spinner was added while fetching data asynchronously to improve user experience.

## How to Run
1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/banking-app.git


Navigate to the project directory:
bash

cd banking-app
Install dependencies:
bash

flutter pub get
Run the app:
bash

flutter run
Future Improvements
Backend Integration: Instead of using local JSON files, the app can be connected to a backend service to fetch real-time data.
User Authentication: Implementing user login and authentication to securely manage user data.
Transaction Creation: Allow users to add, edit, and delete transactions through the app.
License
This project is open source and available under the MIT License.

markdown


### Instructions:
- **Title Sections**: Titles like `# Banking App` and `## Overview` are formatted to be prominent when viewed on GitHub.
- **Details**: The README provides explanations about the features, files, code changes, and future improvements.
- **Usage**: Instructions for running the project locally have been included.

### How to Add the README to Your GitHub Repository:
1. Create a `README.md` file in the root directory of your project.
2. Copy and paste the above content into the `README.md` file.
3. Add the README file to Git:

   ```bash
   git add README.md
   git commit -m "Added README file"
   git push
