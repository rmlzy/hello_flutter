import 'package:requests/requests.dart';

class Request {
//  static final host = "http://qa.util.city";
  static final host = "http://127.0.0.1:1029";

  static getCookie(name) async {
    final cookies = await Requests.getStoredCookies(host);
    return cookies[name];
  }

  static setCookie(key, value) async {
    await Requests.setStoredCookies(host, {key: value});
  }

  static get(String url,
      {Map<String, String> headers, queryParameters, bodyEncoding}) async {
    if (headers == null) headers = new Map();
    headers['token'] = await getCookie('token');
    return Requests.get(host + url,
        headers: headers,
        queryParameters: queryParameters,
        bodyEncoding: bodyEncoding);
  }

  static post(String url,
      {Map<String, String> headers,
      queryParameters,
      bodyEncoding = RequestBodyEncoding.JSON,
      body}) async {
    if (headers == null) headers = new Map();
    headers['token'] = await getCookie('token');
    return Requests.post(host + url,
        headers: headers,
        queryParameters: queryParameters,
        bodyEncoding: bodyEncoding,
        body: body);
  }
}
