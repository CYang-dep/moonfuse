///|
/// Filesystem operation interface implemented by user-space filesystems.
pub trait Filesystem {
  fn lookup(Self, UInt64, String) -> Result[@protocol.FileAttr, @protocol.Errno]
  fn getattr(Self, UInt64) -> Result[@protocol.FileAttr, @protocol.Errno]
  fn readdir(Self, UInt64) -> Result[Array[@protocol.DirEntry], @protocol.Errno]
}
