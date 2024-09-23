class ErrorModel {
  int? statusCode;
  String? statusMessage;
  bool? success;

  ErrorModel({this.statusCode, this.statusMessage, this.success});

  factory ErrorModel.fromJson(Map<String, dynamic> json) => ErrorModel(
        statusCode: json['status_code'] as int?,
        statusMessage: json['status_message'] as String?,
        success: json['success'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'status_code': statusCode,
        'status_message': statusMessage,
        'success': success,
      };
}
