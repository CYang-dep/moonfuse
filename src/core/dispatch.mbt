///|
/// Classify a request before an adapter invokes filesystem code.
pub fn classify(request : @protocol.Request) -> @protocol.Opcode? {
  request.operation
}

///|
/// Return whether an operation is safe to retry after a transport interruption.
pub fn retryable(operation : @protocol.Opcode?) -> Bool {
  match operation {
    Some(@protocol.Getattr) => true
    Some(@protocol.Lookup) => true
    Some(@protocol.Read) => true
    Some(@protocol.Readdir) => true
    _ => false
  }
}
