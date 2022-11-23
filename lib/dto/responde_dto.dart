class ResponseDto<T>{
  final bool success;
  final String? message;
  final T? data;

  ResponseDto({
    this.data,
    this.message,
    this.success = false,
    
  });

  factory ResponseDto.fromJson(Map<String, dynamic> json){
    return ResponseDto(
      data: json['data'],
      message: json['message'],
      success: json['success'],
    );
  }
}