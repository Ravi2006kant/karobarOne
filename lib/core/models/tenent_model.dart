class Tenant {
  final String? id;
  final String? gstNumber;
  final String? panNumber;
  final String? documentMediaLink;
  final bool? documentVerificationDone;
  final String? documentVerificationDoneBy;

  final String businessName;
  final String? legalName;
  final String? logoMediaId;

  final String email;
  final String mobile;
  final String? whatsappMobile;
  final String? ownerName;

  final String? businessAddressLine1;
  final String? businessAddressLine2;
  final double? locationLatitude;
  final double? locationLongitude;
  final String? landmark;
  final String? postOffice;
  final String? policeStation;
  final String? city;
  final String? state;
  final String? country;
  final String? postalCode;

  final String? businessType;
  final String? businessDescription;
  final int? employeeCount;
  final DateTime? registeredAt;

  final int? statusId;
  final bool? isActive;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Tenant({
    this.id,
    this.gstNumber,
    this.panNumber,
    this.documentMediaLink,
    this.documentVerificationDone,
    this.documentVerificationDoneBy,
    required this.businessName,
    this.legalName,
    this.logoMediaId,
    required this.email,
    required this.mobile,
    this.whatsappMobile,
    this.ownerName,
    this.businessAddressLine1,
    this.businessAddressLine2,
    this.locationLatitude,
    this.locationLongitude,
    this.landmark,
    this.postOffice,
    this.policeStation,
    this.city,
    this.state,
    this.country,
    this.postalCode,
    this.businessType,
    this.businessDescription,
    this.employeeCount,
    this.registeredAt,
    this.statusId,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  factory Tenant.fromJson(Map<String, dynamic> json) {
    return Tenant(
      id: json['id'],
      gstNumber: json['gstNumber'],
      panNumber: json['panNumber'],
      documentMediaLink: json['documentMediaLink'],
      documentVerificationDone: json['documentVerificationDone'],
      documentVerificationDoneBy: json['documentVerificationDoneBy'],
      businessName: json['businessName'] ?? '',
      legalName: json['legalName'],
      logoMediaId: json['logoMediaId'],
      email: json['email'] ?? '',
      mobile: json['mobile'] ?? '',
      whatsappMobile: json['whatsappMobile'],
      ownerName: json['ownerName'],
      businessAddressLine1: json['businessAddressLine1'],
      businessAddressLine2: json['businessAddressLine2'],
      locationLatitude: (json['locationLatitude'] as num?)?.toDouble(),
      locationLongitude: (json['locationLongitude'] as num?)?.toDouble(),
      landmark: json['landmark'],
      postOffice: json['postOffice'],
      policeStation: json['policeStation'],
      city: json['city'],
      state: json['state'],
      country: json['country'],
      postalCode: json['postalCode'],
      businessType: json['businessType'],
      businessDescription: json['businessDescription'],
      employeeCount: json['employeeCount'],
      registeredAt: json['registeredAt'] != null
          ? DateTime.tryParse(json['registeredAt'])
          : null,
      statusId: json['statusId'],
      isActive: json['isActive'],
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.tryParse(json['updatedAt'])
          : null,
    );
  }
}