import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/// Hisab Public Addresses
class Config {
  static String dnAdrs = "https://www.googleapis.com";
}
class Helper {
  /// Checks if either wifi or mobile data is on, but not necessarily if there is internet.
  static Future<bool> gotInternet() {
    //Connectivity connectivity = Connectivity();
    return Future.value(true);
    /*connectivity.checkConnectivity().then((ConnectivityResult result) {
      return result.toString() == "ConnectivityResult.wifi" ||
          result.toString() == "ConnectivityResult.mobile";
    });*/

  }

  /// Trims phone number of format "0967823595" and "251967823595" and "67823595" to "67823595"
  static String phoneTrimmer(String originalPhone) {
    if (originalPhone.startsWith("09") && originalPhone.length == 10) {
      return originalPhone.trim().substring(2, originalPhone.length);
    } else if (originalPhone.startsWith("251") && originalPhone.length == 12) {
      return originalPhone.trim().substring(4, originalPhone.length);
    } else if (originalPhone.startsWith("+251") && originalPhone.length == 13) {
      return originalPhone.trim().substring(5, originalPhone.length);
    } else if (originalPhone.startsWith("09") && originalPhone.length == 9) {
      return originalPhone.trim().substring(1, originalPhone.length);
    } else if (originalPhone.length == 8) {
      return originalPhone;
    } else {
      throw Exception("Unknown phone format : $originalPhone");
    }
  }
}

class BookAPI {
  static String _bookURL = Config.dnAdrs + "/books/v1";


  static Future<List> getBooks(String hisabUserId) {
    return Helper.gotInternet().then((bool thereIsInternet) {
      // Got internet
      if (thereIsInternet) {
        print("url url $hisabUserId");
        String url = "$_bookURL/volumes?q=intitle:$hisabUserId&orderBy:relevance&subject:fiction&printType=books&maxResults=40&key=AIzaSyCcDUQ8o9nSt_Esd4by-1xvz2WxtSPwRUs";
        print("url url $url");
        return http.get(
          url,
          headers: {"Content-Type": "application/json"},
        ).then((http.Response response) {
          print("responseBody ${jsonDecode(response.body)}");
          Map<String, dynamic> responseBodyMap = jsonDecode(response.body);
          List responseBody = responseBodyMap["items"];
          return responseBody;
        }, onError: (err) {
          print("responseBody $err");
          return null;
        });
      }
      // No internet, Dial ussd
      else {
        return null;
      }
    });
  }

}