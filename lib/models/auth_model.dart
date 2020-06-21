class AuthModel {
  final String accessToken;
  final String client;
  final String uid;

  AuthModel({this.accessToken, this.client, this.uid});

  String get decodeUid {
    final uri = Uri.parse(uid);
    print(uri.toString());
    return uri.toString();
  }
}
