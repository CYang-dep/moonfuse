///|
/// Linux errno values used in FUSE replies.
pub enum Errno {
  Success
  NoSuchFile
  PermissionDenied
  AlreadyExists
  NotDirectory
  IsDirectory
  InvalidArgument
  Io
  NotImplemented
}

///|
pub fn Errno::number(self : Errno) -> Int {
  match self {
    Success => 0
    NoSuchFile => 2
    PermissionDenied => 13
    AlreadyExists => 17
    NotDirectory => 20
    IsDirectory => 21
    InvalidArgument => 22
    Io => 5
    NotImplemented => 38
  }
}
