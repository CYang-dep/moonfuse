///|
/// Parse the fixed 40-byte request header used by FUSE.
pub fn parse_header(bytes : Bytes) -> @protocol.RequestHeader? {
  if bytes.length() < 40 {
    return None
  }
  let length = read_u32(bytes, 0)
  let opcode = read_u32(bytes, 4)
  let unique = read_u64(bytes, 8)
  let nodeid = read_u64(bytes, 16)
  let uid = read_u32(bytes, 24)
  let gid = read_u32(bytes, 28)
  let pid = read_u32(bytes, 32)
  match (length, opcode, unique, nodeid, uid, gid, pid) {
    (
      Some(length),
      Some(opcode),
      Some(unique),
      Some(nodeid),
      Some(uid),
      Some(gid),
      Some(pid),
    ) =>
      Some(
        @protocol.request_header(length, opcode, unique, nodeid, uid, gid, pid),
      )
    _ => None
  }
}
