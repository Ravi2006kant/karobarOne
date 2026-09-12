class Address {
  final String id;
  final String fullName;
  final String phone;
  final String addressLine;
  final String city;
  final String state;
  final String pincode;
  final String landmark;
  final String addressType;

  Address({
    required this.id,
    required this.fullName,
    required this.phone,
    required this.addressLine,
    required this.city,
    required this.state,
    required this.pincode,
    required this.landmark,
    required this.addressType,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['id'],
      fullName: json['fullName'],
      phone: json['phone'],
      addressLine: json['addressLine'],
      city: json['city'],
      state: json['state'],
      pincode: json['pincode'],
      landmark: json['landmark'],
      addressType: json['addressType'],
    );
  }
}
