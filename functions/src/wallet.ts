import * as functions from "firebase-functions";
import {axiosHelper} from "./axioshelper";
import * as header from './headers';
const ah = new axiosHelper();
const postMethod = "post";
const baseURL = "https://sandboxapi.rapyd.net/v1/";

export const createWallet = functions.https.onCall(async (request) => {
  const body = request["body"];
  const fullPath = baseURL + "user";
  const headers = header.getHeader(body, fullPath, postMethod);
  const req = {
    url: fullPath, headers: headers, body: body,
  };
  const response = await ah.postRequest(req);
  console.log(response);
  return response;
});

export const addFundsToWallet = functions.https.onCall(async (request) => {
  const body = request["body"];
  const fullPath = baseURL + "account/deposit";
  const headers = header.getHeader(body, fullPath, postMethod);
  const req = {
    url: fullPath, headers: headers, body: body,
  };
  const response = await ah.postRequest(req);
  console.log(response);
  return response;
});


export const removeFundsFromWallet = functions.https.onCall(async (request) => {
  const body = request["body"];
  const fullPath = baseURL + "account/withdraw";
  const headers = header.getHeader(body, fullPath, postMethod);
  const req = {
    url: fullPath, headers: headers, body: body,
  };
  const response = await ah.postRequest(req);
  console.log(response);
  return response;
});


export const loadWallet = functions.https.onCall(async (request) => {
  const userID = request["body"]["eWalletID"];
  const path = baseURL + `user/${userID}`;
  const headers = header.getHeader(null, path, "get");
  const userWallet = await ah.getRequest(path, headers);
  console.log(userWallet);
  return userWallet;
});

export const retrieveWalletBalances = functions.https.onCall(async (request) => {
  const userID = request["eWalletID"];
  const path = baseURL + `user/${userID}/accounts`;
  const headers = header.getHeader(null, path, "get");
  const userWalletBalance = await ah.getRequest(path, headers);
  console.log(userWalletBalance);
  return userWalletBalance;
});

export const walletTransferRequest = functions.https.onCall(async (request) => {
  const body = request["body"];
  const url = baseURL + "account/transfer";
  const headers = header.getHeader(body, url, postMethod);
  const req = {url: url, body: body, headers: headers};
  const result = await ah.postRequest(req);
  return result;
});

export const setTransferResponse = functions.https.onCall(async (request) => {
  const url = baseURL + 'account/transfer/response';
  const body = request["body"];
  const headers = header.getHeader(body, url, "post");
  return await ah.postRequest({url: url, body: body, headers: headers});
});


