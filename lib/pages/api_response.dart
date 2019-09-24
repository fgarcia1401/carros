
class ApiResponse<T> {
  bool sucesso;
  String msg;
  T result;

  ApiResponse.ok(this.result) {
    sucesso = true;
  }

  ApiResponse.error(this.msg) {
    sucesso = false;
  }


}