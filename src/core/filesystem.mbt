///|
/// Operations a userspace filesystem may implement.
pub trait Filesystem {
  fn lookup(Self, UInt64, String) -> Result[@protocol.FileAttr, @protocol.Errno]
  fn getattr(Self, UInt64) -> Result[@protocol.FileAttr, @protocol.Errno]
  fn readdir(Self, UInt64) -> Result[Array[@protocol.DirEntry], @protocol.Errno]
}

///| A safe default filesystem dispatcher boundary.
pub fn unsupported[T]() -> Result[T, @protocol.Errno] {
  Err(@protocol.Errno::NotImplemented)
}
