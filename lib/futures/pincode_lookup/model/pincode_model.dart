class PostOffice {
  final String name;
  final String district;
  final String state;
  final String deliveryStatus;

  PostOffice({
    required this.name,
    required this.district,
    required this.state,
    required this.deliveryStatus,
  });

  factory PostOffice.fromJson(Map<String, dynamic> json) {
    return PostOffice(
      name: json['Name'] ?? 'N/A',
      district: json['District'] ?? 'N/A',
      state: json['State'] ?? 'N/A',
      deliveryStatus: json['DeliveryStatus'] ?? 'N/A',
    );
  }
}
