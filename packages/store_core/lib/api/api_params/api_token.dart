final class ApiToken {
  String? tokenType;
  String? token;

  String? get accessToken => tokenType != null && token != null ? '$tokenType $token' : null;

  void clear() {
    tokenType = null;
    token = null;
  }

  void writeToken(String? tokenType, String? token){
    this.tokenType = tokenType;
    this.token = token;
  }
}
