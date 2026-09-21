///|
/// A stable identity for an open FUSE handle.
pub struct Handle {
  pub id : UInt64
  pub inode : UInt64
  pub flags : UInt
}

///|
pub fn handle(id : UInt64, inode : UInt64, flags : UInt) -> Handle {
  { id, inode, flags, }
}

///|
/// Check whether a handle belongs to an inode.
pub fn handle_matches(value : Handle, inode : UInt64) -> Bool {
  value.inode == inode
}
