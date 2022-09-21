// create first wallet

import {initializeApp} from "@firebase/app";
import {connectFunctionsEmulator, getFunctions, httpsCallable} from "@firebase/functions";
// Your web app's Firebase configuration
const firebaseConfig = {
  apiKey: "AIzaSyBntzbM2WW4WEw8LgPnwuCCiFLzTpaWEPs",
  authDomain: "meworld-329f3.firebaseapp.com",
  databaseURL: "https://meworld-329f3-default-rtdb.firebaseio.com",
  projectId: "meworld-329f3",
  storageBucket: "meworld-329f3.appspot.com",
  messagingSenderId: "334513007663",
  appId: "1:334513007663:web:a34c90d9a637826be26ada"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const functions = getFunctions(app);
connectFunctionsEmulator(functions, 'localhost', 5001);

async function test() {
  console.log('creating first wallet....')
  const createWallet_ = httpsCallable(functions, 'createWallet')
  var wallet1 = await createWallet_({
    'first_name': 'sender',
    'last_name': 'abba'
  });
  let wallet_: any = wallet1.data
  let w1id = wallet_.data.id;
  console.log('id is:', w1id)

  console.log('creating second wallet....')
  var wallet2 = await createWallet_({
    'body': {
      'first_name': 'receiver',
      'last_name': 'Ahmad'
    }
  });
  let wallet__: any = wallet2.data
  let w2id = wallet__.data.id;

  console.log('id is:', w2id)
  console.log('adding funds to wallet 1....')
  const addFundsToWallet_ = httpsCallable(functions, 'addFundsToWallet')
  var fundingStatus1 = await addFundsToWallet_({
    'body': {

      'ewallet': w1id,
      'amount': '200',
      'currency': 'USD'
    }
  });
  console.log(fundingStatus1.data)
  console.log('adding funds to wallet 2....')
  var fundingStatus2 = await addFundsToWallet_({
    'body': {
      'ewallet': w2id,
      'amount': '200',
      'currency': 'USD'
    }

  });
  console.log(fundingStatus2.data)

  console.log('viewing balance for both wallets:')
  const retrieveBalance = httpsCallable(functions, 'retrieveWalletBalances')

  await retrieveBalance({
    'eWalletID': w1id
  });
  await retrieveBalance({
    'eWalletID': w2id
  });
  console.log('sending funds from wallet 1 to wallet 2....')
  const walletTransferRequest = httpsCallable(functions, 'walletTransferRequest')
  var response = await walletTransferRequest({
    body: {
      'amount': '20',
      currency: 'USD',
      destination_ewallet: w2id,
      source_ewallet: w1id
    }
  });
  console.log(response.data)
  let transactionData: any = response.data
  let txnID = transactionData.data.id
  console.log(response.data)
  console.log('Getting all transactions from wallet 1...')
  const getAllTransactions = httpsCallable(functions, 'getAllTransactions')
  var response1 = await getAllTransactions({
    eWalletID: w1id
  });
  console.log(response1.data)
  console.log('Getting all transactions from wallet 2...')
  var response2 = await getAllTransactions({
    eWalletID: w2id
  });
  console.log(response2.data)
  //you can only reject funds if you are the receiver otherwise you can only cancel
  console.log('wallet 2 is rejecting the funds sent by wallet 1.....')
  const setTransferResponse = httpsCallable(functions, 'setTransferResponse')
  var status = await setTransferResponse({
    body: {
      id: txnID,
      status: 'decline',
    }
  })
  console.log(status)
  console.log('Getting all transactions from wallet 2 again...')
  var response2 = await getAllTransactions({
    eWalletID: w2id
  });
  console.log('getting wallet 2 balance again...')
  await retrieveBalance({
    'eWalletID': w2id
  });
  //how to get pending transaction that require your action...cos it doenst show up in your history

  // console.log('sending funds from wallet 1 to wallet 2 again....')
  // console.log('wallet 2 is accepting the funds sent by wallet 1.....')
  // console.log('showing balance for wallet 1.....')
  // console.log('showing balance for wallet 2.....')
  // console.log('showing transaction history for wallet 1...')
  // console.log('showing transaction history for wallet 2...')
  // console.log('sending funds from wallet 2 to wallet 1....')
  // console.log('Cancelling the funds sent....')
}

async function testFakeData() {
  const createWallet_ = httpsCallable(functions, 'createWallet')
  for (let index = 0; index < 10; index++) {


    var wallet1 = await createWallet_({
      'first_name': 'sender',
      'last_name': 'abba'
    });
    let wallet_: any = wallet1.data
    let w1id = wallet_.data.id;
    console.log(w1id)
  }
}

// test().then((res) => { }).catch((err) => console.log(err))
testFakeData().then((res) => { }).catch((err) => console.log(err))


