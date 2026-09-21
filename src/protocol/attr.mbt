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
