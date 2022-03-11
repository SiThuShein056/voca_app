class ResponseOb {
  MsgStae? msgState;
  ErrState? errState;
  dynamic data;

  ResponseOb({this.data, this.errState, this.msgState});
}

enum MsgStae {
  data,
  loading,
  error,
}
enum ErrState {
  unknownErr,
  notfoundErr,
  ServerErr,
}
