import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class WebServices {
  static Future<Map<String, dynamic>> downloadRequest(String url) async {
    bool isConnected = await checkConnectivity();

    if (isConnected) {
      final encodedUrl = Uri.encodeFull(url);
      final requestURL =
          'https://instagram-downloader-download-instagram-videos-stories.p.rapidapi.com/index?url=$encodedUrl';
      final headers = {
        'X-RapidAPI-Key': '84daa8bff9mshb0a367f5c02843ep1f0d59jsnea742fae1817',
        'X-RapidAPI-Host':
        'instagram-downloader-download-instagram-videos-stories.p.rapidapi.com'
      };

      final response = await http.get(Uri.parse(requestURL), headers: headers);

      return jsonDecode(response.body);
    } else {
      return {
        'code': 503,
        'status': 'no_connection',
        'message': 'No connection available. Please connect to internet!',
      };
    }
  }

  static Future<bool> checkConnectivity() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }

  static Future<void> saveImage(BuildContext context, String url) async {
    try {
      // Download image
      final http.Response response = await http.get(Uri.parse(url));

      // Get temporary directory
      final Directory? dir = Platform.isAndroid
          ? await getExternalStorageDirectory()
          : await getApplicationSupportDirectory();

      // Create an image name
      String? ext;
      if (url.contains('.mp4')) {
        ext = '.mp4';
      } else if (url.contains('.png')) {
        ext = '.png';
      } else if (url.contains('.jpeg') || url.contains('.jpg')) {
        ext = '.jpg';
      }

      if (ext != null && dir != null) {
        final filename = '${dir.path}/insta_downloader$ext';

        // Save to filesystem
        final file = File(filename);
        await file.writeAsBytes(response.bodyBytes);

        EasyLoading.showSuccess('Download successful!');
      } else {
        EasyLoading.showError('Error occurred while saving the file!');
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
    }
  }
}
