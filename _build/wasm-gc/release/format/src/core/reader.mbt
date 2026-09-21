///|
/// Read a little-endian 32-bit word from a FUSE frame.
pub fn read_u32(bytes : Bytes, offset : Int) -> UInt? {
  if offset < 0 || offset + 4 > bytes.length() {
    None
  } else {
    let b0 = bytes.unsafe_get(offset).to_uint().unwrap()
    let b1 = bytes.unsafe_get(offset + 1).to_uint().unwrap()
    let b2 = bytes.unsafe_get(offset + 2).to_uint().unwrap()
    let b3 = bytes.unsafe_get(offset + 3).to_uint().unwrap()
    Some(b0 | (b1 << 8) | (b2 << 16) | (b3 << 24))
  }
}

///|
/// Read a little-endian 64-bit word from a FUSE frame.
pub fn read_u64(bytes : Bytes, offset : Int) -> UInt64? {
  if offset < 0 || offset + 8 > bytes.length() {
    None
  } else {
    let mut value : UInt64 = 0UL
    for i = 0; i < 8; i = i + 1 {
      let byte = bytes.unsafe_get(offset + i).to_uint64().unwrap()
      value = value | (byte << (i * 8))
    }
    Some(value)
  }
}

///|
/// Read a bounded payload view after a header.
pub fn payload_view(bytes : Bytes, offset : Int) -> BytesView? {
  if offset < 0 || offset > bytes.length() {
    None
  } else {
    Some(bytes[offset:])
  }
}
