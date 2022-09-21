const baseURL = "https://sandboxapi.rapyd.net/v1/";


import * as functions from "firebase-functions";
import {axiosHelper} from "./axioshelper";
import * as header from "./headers";
const axios_ = new axiosHelper();
// create subscriptions
export const createSubscription = functions.https.onCall(async (request) => {
  const url = baseURL + "payments/subscriptions";
  const body = request.body;
  const headers = header.getHeader(body, url, "post");
  const result = await axios_.postRequest({url: url, body: body, headers: headers});
  if (result["status"]["status"] == "SUCCESS") {
    return result.data;
  }
  console.log(result.data)
  return false;
});

// export const getAllSubscriptions = functions.https.onCall(async (request) => {
//   const userId = request["body"]["userID"];
//   const subscriptions = await admin.firestore().collection(`Users/${userId}/subscriptions/subscriptionItems`).get();
//   return subscriptions;
// });


//retrieve subscriptions
export const listCustomerSubscriptions = functions.https.onCall(async (request) => {
  const url = baseURL + `payments/subscriptions?customer=${request['customerID']}`
  const headers = header.getHeader(null, url, "post");
  const result = await axios_.getRequest(url, headers);
  return result;

});


//retrieve subscribers to a product
export const listBusinessSubscriptions = functions.https.onCall(async (request) => {
  const url = baseURL + `payments/subscriptions?product=${request['productID']}`
  const headers = header.getHeader(null, url, "post");
  const result = await axios_.getRequest(url, headers);
  return result;

});


// cancel subscriptions
export const cancelSubscription = functions.https.onCall(async (request) => {
  const url = baseURL + `payments/subscriptions/${request.subscription}`
  const headers = header.getHeader(null, url, "post");
  const result = await axios_.deleteResponse({url: url, header: headers});
  return result;
});


//create subscribeable plan for business
export const createPlan = functions.https.onCall(async (request) => {
  // const body = {
  //   "amount": request.amount,
  //   "currency": request.payout_currency,
  //   "interval": 'month',
  //   "interval_count": 1,
  //   "product": request.productID,
  // };
  const url = baseURL + "plans/";
  const headers = header.getHeader(request.body, url, "post");
  const result = await axios_.postRequest({url: url, body: request.body, headers: headers});
  return result["data"]["id"];
});

//create subscribeable plan for business
export const createProduct = functions.https.onCall(async (request) => {
  const url = baseURL + "products/";
  const headers = header.getHeader(request.body, url, "post");
  const result = await axios_.postRequest({url: url, body: request.body, headers: headers});
  return result["data"]["id"];
});

// async function _createsubProduct(request: any) {
//   const body = {
//     "name": request["product_name"],
//     "type": "services",
//     "active": true,
//     "statement_descriptor": request["product_description"],
//   };

// }


// create customer
export const createCustomer = functions.https.onCall(async (request) => {
  const body = request['body'];
  const url = baseURL + "customers";
  const headers = header.getHeader(body, url, "post");
  const result = await axios_.postRequest({url: url, body: body, headers: headers});
  return result["data"]["id"];
});
