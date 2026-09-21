///| A directory entry returned by a filesystem implementation.
pub struct DirEntry {
  pub inode : UInt64
  pub name : String
  pub kind : @protocol.NodeKind
}

pub struct OpenHandle {
  pub id : UInt64
  pub flags : UInt
}

pub struct ReadResult {
  pub data : Bytes
  pub eof : Bool
}
