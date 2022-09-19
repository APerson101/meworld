import axios from "axios";
import * as functions from "firebase-functions";
import {axiosHelper} from "./axioshelper";
import * as header from './headers';
const ah = new axiosHelper();
const baseURL = "https://sandboxapi.rapyd.net/v1/";

export const getAllTransactions = functions.https.onCall(async (request) => {
  const eWalletID = request["eWalletID"];
  const path = `${baseURL}user/${eWalletID}/transactions`;
  const headers = header.getHeader(null, path, "get");
  return await ah.getRequest(path, headers);
});

export const transactionDetails = functions.https.onCall(async (request) => {
  const eWalletID = request["eWalletID"];
  const id = request["id"];
  const path = `${baseURL}user/${eWalletID}/transactions/${id}`;
  const headers = header.getHeader(null, path, "get");
  return await ah.getRequest(path, headers);
});

export const viewTransactionHistory = functions.https.onCall((request) => {
  console.log("loading histroy of transactions");
  axios.get(request["url"], {headers: request["headers"]}).then(
    (res) => {
      console.log(res.data); return res.data;
    }
  ).catch((error) => console.log(error));
});