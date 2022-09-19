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

async function testSubscriptions() {

  console.log('creating wallet....')
  const createWallet_ = httpsCallable(functions, 'createWallet')
  var wallet1 = await createWallet_({
    'first_name': 'sender',
    'last_name': 'abba'
  });
  let wallet_: any = wallet1.data
  let walletID = wallet_.data.id;
  console.log('id is:', walletID)
  // let walletID = "ewallet_aaa817cc69fd3fd48b11b53024fe5db6"

  const createBusinessProduct = httpsCallable(functions, 'createProduct')
  var productData = await createBusinessProduct({
    body: {
      "name": 'brooks gym',
      "type": "services",
      "active": true,
    }
  });
  let productID = productData.data;
  console.log("product id is : ", productID)

  const createBusinessPlan = httpsCallable(functions, 'createPlan')
  var planData = await createBusinessPlan({
    body: {
      "amount": 40,
      "currency": 'USD',
      "interval": 'month',
      "interval_count": 1,
      "product": productID,
    }
  });

  let planID = planData.data;
  console.log("plan id is : ", planID)

  const createCustomer = httpsCallable(functions, 'createCustomer')
  var customerData = await createCustomer({
    body: {
      ewallet: walletID,
      name: "Abba gana"
    }
  });

  let customerID = customerData.data;
  console.log("Customer ID is : ", customerID)

  const createSubscription = httpsCallable(functions, 'createSubscription')
  var subscriptionData: any = await createSubscription({
    billing: 'pay_automatically',
    customer: customerID,
    subscription_items: [{"plan": 'plan_dd4ab7538a1468b8600f9dacfa2f0374', quantity: 1}]
  });
  let subscription = subscriptionData.data
  console.log('subscription is: ', subscription)

  const listCustomerSubscriptions = httpsCallable(functions, 'listCustomerSubscriptions')
  var customerSubs = await listCustomerSubscriptions({
    customerID: customerID
  });

  console.log('customer subscriptions are: ', customerSubs.data)


  const listBusinessSubs = httpsCallable(functions, 'listBusinessSubscriptions')
  var businessSubs = await listBusinessSubs({
    productID: productID
  });

  console.log('business subscriptions are: ', businessSubs.data)



  console.log('canceling subscription...')
  const cancelSubscription = httpsCallable(functions, 'cancelSubscription')
  await cancelSubscription({
    subscription: subscription.id
  });
  console.log('checking the customer subscriptions again...')
  const listCustomerSubscriptionsagain = httpsCallable(functions, 'listCustomerSubscriptions')
  var customerSubs2 = await listCustomerSubscriptionsagain({
    customerID: customerID
  });
  console.log('customer subscriptions again are: ', customerSubs2)

  console.log('Checking business subs again.....')


  const listBusinessSubs2 = httpsCallable(functions, 'listBusinessSubscriptions')
  var businessSubs2 = await listBusinessSubs2({
    productID: productID
  });

  console.log('business subscriptions are: ', businessSubs2)



}

testSubscriptions().then((res) => { }).catch((err) => {console.log(err)})
