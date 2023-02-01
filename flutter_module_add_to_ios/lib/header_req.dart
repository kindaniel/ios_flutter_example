class HeaderReq {
  final String name;
  final String value;
  final String deviceId;

  HeaderReq({
    required this.name,
    required this.value,
    required this.deviceId,
  });

  @override
  String toString() {
    return 'HeaderReq{name: $name, value: $value, deviceId: $deviceId}';
  }
}
