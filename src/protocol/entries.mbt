///|
/// A directory entry returned by a filesystem implementation.
pub struct DirEntry {
  pub inode : UInt64
  pub name : String
  pub kind : NodeKind
}

///|
pub struct OpenHandle {
  pub id : UInt64
  pub flags : UInt
}

///|
pub struct ReadResult {
  pub data : Bytes
  pub eof : Bool
}

///|
/// Construct a directory entry returned by a readdir operation.
pub fn dir_entry(name : String, inode : UInt64, kind : NodeKind) -> DirEntry {
  { name, inode, kind, }
}
