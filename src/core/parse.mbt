///|
/// Parse the fixed 40-byte request header used by FUSE.
pub fn parse_header(bytes : Bytes) -> @protocol.RequestHeader? {
  if bytes.length() < 40 {
    return None
  }
  let length = @core.read_u32(bytes, 0)
  let opcode = @core.read_u32(bytes, 4)
  let unique = @core.read_u64(bytes, 8)
  let nodeid = @core.read_u64(bytes, 16)
  let uid = @core.read_u32(bytes, 24)
  let gid = @core.read_u32(bytes, 28)
  let pid = @core.read_u32(bytes, 32)
  match (length, opcode, unique, nodeid, uid, gid, pid) {
    (
      Some(length),
      Some(opcode),
      Some(unique),
      Some(nodeid),
      Some(uid),
      Some(gid),
      Some(pid),
    ) => Some({ length, opcode, unique, nodeid, uid, gid, pid, })
    _ => None
  }
}
