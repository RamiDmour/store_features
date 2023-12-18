final class ApiUrlBuilder {
  int version = 1;

  String buildUrl({required String path, int? version}) {
    int v = version ?? this.version;
    return _buildUrlUpdatedVersion(path, v);
  }

  String _buildUrlUpdatedVersion(String path, int version) {
    return '/api/v$version/$path';
  }
}
