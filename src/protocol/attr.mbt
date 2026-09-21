///|
/// Filesystem object kind exposed through FUSE attributes.
pub enum NodeKind {
  Regular
  Directory
  Symlink
  CharacterDevice
  BlockDevice
  Fifo
  Socket
}

///|
pub struct FileAttr {
  pub inode : UInt64
  pub size : UInt64
  pub mode : UInt
  pub nlink : UInt
  pub uid : UInt
  pub gid : UInt
  pub kind : NodeKind
}

///|
pub fn FileAttr::is_directory(self : FileAttr) -> Bool {
  match self.kind {
    Directory => true
    _ => false
  }
}

///|
/// Construct file metadata for filesystem implementations.
pub fn file_attr(
  inode : UInt64,
  size : UInt64,
  mode : UInt,
  nlink : UInt,
  uid : UInt,
  gid : UInt,
  kind : NodeKind,
) -> FileAttr {
  { inode, size, mode, nlink, uid, gid, kind, }
}
